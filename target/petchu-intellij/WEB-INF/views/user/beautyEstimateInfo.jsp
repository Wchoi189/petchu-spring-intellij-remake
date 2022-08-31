<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/request.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	textarea {
	margin-left : 0px;
	}
</style>
<div id="sendrequpage">
	<div id="request">
		<p class="title">
			<b>${bvo.scname}</b>에서 답변한 견적서
		</p>
		<table id="petinfo">
			<tr>
				<td class="title" width=100>설명</td>
				<td>${bvo.description}</td>
			</tr>
			<tr>
				<td class="title">예상청구금액</td>
				<td>${bvo.fprice}원</td>
			</tr>
		</table>
		<div id="btn">
			<button class="bigbtn" onClick="location.href='result'">목록이동</button>
			<button id="bigChoose" >채택하기</button>
			<button class="bigbtn">채팅</button>
		</div>
	</div>
	<div id="hosinfo">
		<table id="hospital">
			<tr>
				<td class="title" style="text-align:center; font-size: 25px"  colspan=4><b>${bvo.scname} 정보</b></td>
			</tr>
			<tr>
				<td width=70><b>오픈시간</b></td>
				<td colspan=2>${bvo.opentime}</td>
			</tr>
			<tr>
				<td width=70><b>마감시간</b></td>
				<td colspan=3>${bvo.closetime}</td>
			</tr>
			<tr>
				<td><b>점심시간</b></td>
				<td colspan=3>${bvo.breaktime}</td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
				<td colspan=3>${bvo.sctel}</td>
			</tr>
			<tr>
				<td><b>한줄소개</b></td>
				<td colspan=3>${bvo.sconeline}</td>
			</tr>
			<tr>
				<td><b>병원소개</b></td>
				<td><textarea rows=3 cols=70>${bvo.scdetail_description}</textarea></td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td colspan=3>${bvo.scaddress1} ${bvo.scaddress2}</td>
			</tr>

		</table>
		<div id="map"></div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
	</div>
</div>
<script>


</script>
<script>

var scname = "${bvo.scname}";
var seno="${bvo.seno}"; 
var brno="${bvo.brno}";

 $("#bigChoose").on("click", function(){
	 if(!confirm("해당 견적서를 채택하시겠습니까?")) return;
	 $.ajax({
		type : "post",
		url : "/request/bchoose",
		data : {brno:brno, seno:seno},
		success:function(){
			swal(scname + " 업체의 견적서가 채택 되었습니다!");
		}
	 });
 });
 
var address="${bvo.scaddress1}";
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