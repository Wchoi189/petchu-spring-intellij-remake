<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet">
<link href="/resources/css/hosread.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/e44146d80b.js" crossorigin="anonymous"></script>
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${vo.dname}</b> 에서 답변한 견적서
		</p>
		<table id="petinfo">
			<tr>
				<td width=150 class="title">이름</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title">진단명</td>
				<td>${vo.drdisease}</td>
			</tr>
			<tr>
				<td class="title">설명</td>
				<td>${vo.drcontent}</td>
			</tr>
			<tr>
				<td class="title">예상청구금액</td>
				<td>${vo.drprice}</td>
			</tr>
			<tr>
				<td><img src="/display?fileName=${vo.drfile}"></td>
			</tr>
		</table>
		<div id="btn">
			<button class="bigbtn" onClick="location.href='result'">목록이동</button>
			<button class="bigbtn" id="openPopup">예약하기</button>
			<button class="bigbtn" id="chatadd">채&nbsp;&nbsp;&nbsp;팅</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital"></table>
		<script id="temp" type="text/x-handlebars-template">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>{{dname}} 정보</b></td>
			</tr>
			<tr>
				<td width=100><b>오픈시간</b></td>
				<td>{{open}}</td>
				<td width=100><b>마감시간</b></td>
				<td>{{close}}</td>
			</tr>
			<tr>
				<td><b>점심시간</b></td>
				<td colspan=3>{{o_break}} - {{c_break}}</td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td colspan=3>{{dtel}}</td>
			</tr>
			<tr>
				<td><b>병원소개</b></td>
				<td colspan=3>{{dinfo}}</td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td colspan=3>{{daddress1}} {{daddress2}}</td>
			</tr>
			<tr>
				<td colspan=3><input type="text" id="did" value={{id}} style="display:none"></td>
			</tr>
		</script>
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
		</div>
	<div id="popup01">
		<span id="scno" value="" style="display:none;"></span>
		<h2 style="margin-left: 150px;" id="dname">${vo.dname}</h2>
		<table id="date">
			<tr>
				<td width=100>예약일</td>
				<td id="checkin">
					<input type="date" id="checkDate"><input type="time" id="checkTime">
				</td>
			</tr>
		</table>
		<hr>
		<div id="user">
			본인정보와 동일<input type="checkbox" id="userCheck" checked>
			<p>예약자 성함</p>
			<input type="text" id="userName" size=4 value="${uvo.name}">
			<p>예약자 연락처</p>
			<input type="hidden" id="userTel" name="userTel" value="${uvo.tel}">
			<input type="text" id="userTel1" size=3>
			<input type="text" id="userTel2" size=4>
			<input type="text" id="userTel3" size=4>
		</div>
		
		<div id="please">
			<p>요청사항</p>
			<p><textarea rows="5" cols="50" id="request">요청사항을 기재해 주세요.</textarea><p>
		</div>
		<div id="button">
			<button id="btnReserve">예약하기</button>
		</div>
		<div id="btnClose">
			<button class="close">종료</button>
		</div>
	</div>
</div>
<script>
var dno = "${vo.dno}";
	getList();
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/request/doctorinfo",
			data:{dno:dno},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#hospital").html(template(data));
			}
		})
	}
	
	
</script>
<script>
var id = "${id}";
$("#chatadd").on("click", function(e) {
	var doctorid = $("#did").val();
	console.log(doctorid);
	e.preventDefault();
	$.ajax({
		type:"get",
		url:"/chat/create",
		data:{doctorid:doctorid},
		success:function(data){
			console.log("방이 생성되었습니다.");
			$.ajax({
				type:"get",
				url:"/chat/selcrno",
				data:{doctorid:doctorid},
				success:function(data1){
					console.log(data1);
					$.ajax({
						type: "post",
						url: "/chat/send",
						data: {message:"도움이 필요해요!", id:id, receiver:doctorid, dno:dno, crno:data1, send:1},
						success:function(){
							console.log("데이터 보냄");
							window.open("/chat/room?crno=" + data1,"chat", "width=450, height=700, top=200, left=900");
						}
					}) 
				}
			})
			
		}
	})
	
});

	//전체전화번호 
	var userTel=$("#userTel").val();
	//전화번호 substring
	var tel1=userTel.substring(0,3);
	var tel2=userTel.substring(3,7);
	var tel3=userTel.substring(7,11);
	//substring 한 전화번호 출력
	$("#userTel1").val(tel1);
	$("#userTel2").val(tel2);
	$("#userTel3").val(tel3);
	//체크박스가 변동된 경우
	$("#userCheck").on("change", function(){
		if($(this).is(":checked")){
			var name="${uvo.name}"
			$("#userName").val(name);
			$("#userTel1").val(tel1);
			$("#userTel2").val(tel2);
			$("#userTel3").val(tel3);
		}else{
			$("#userName").val("");
			$("#userTel1").val("");
			$("#userTel2").val("");
			$("#userTel3").val("");
		}
	});
	

//모달팝업 생성
$(document).ready(function( $ ){     
$("#openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
$("#popup01").show();   //팝업 오픈
$("body").append('<div class="backon"></div>'); //뒷배경 생성
});

$("body").on("click", function(event) { 
    if(event.target.className == 'close' || event.target.className == 'backon'){
        $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
        $(".backon").hide();
    }
  });
var checkin="${checkin}";
	var checkout="${checkout}";
	
	$("#checkinDate").val(checkin);
	$("#checkoutDate").val(checkout);
});

var address="${vo.daddress1}";
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					address,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.dname}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>