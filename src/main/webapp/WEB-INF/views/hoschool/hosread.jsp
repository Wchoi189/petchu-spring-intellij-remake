<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/star.css" rel="stylesheet"/>
<link href="/resources/css/hosread.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://kit.fontawesome.com/e44146d80b.js" crossorigin="anonymous"></script>
<style>
.swal-button, .confirm {
  padding: 7px 19px;
  border-radius: 2px;
  width:100px;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
  background-color: #A7CA37;
}
:disabled{
	background-color: #e9ecef;
	cursor:inherit; }
	
#userCheck{
	width: 20px;
	height: 20px;
	border: 2px solid #A7CA37;
	border-radius: 10px;
	position: absolute;
}
</style>
<div id="page">

   <form name="frm">
      <!-- 백그라운드 이미지 -->
      <div id="topArea">
         <div id="topimg">
            <img src = "/display?fileName=${vo.bgimage}" width=960 height=400>
         </div>
         <!-- 업체 이미지 -->
         <div id="imgArea">
            <img src = "/display?fileName=${vo.scimage}" width=450 height=500>
         </div>
         <!-- 업체 요약설명 -->
         <div id="titleArea">
         	<table id="info">
         		<tr>
         			<td colspan=2 id="tblname">${vo.scname }</td>
         		</tr>
         		<tr>
         			<td class="title" width=100>전 &nbsp;&nbsp;&nbsp;&nbsp; 화</td>
         			<td class="tel">${vo.sctel}</td>
         		</tr>
         		<tr>
         			<td class="title">위 &nbsp;&nbsp;&nbsp;&nbsp; 치</td>
         			<td>${vo.scaddress1}</td>
         		</tr>
         		<tr>
         			<td class="title">최저가격</td>
         			<td class="price">${vo.scprice }</td>
         		</tr>
         	</table>
            <div class="icon-score">
		        <div class="rating2">
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		         </div>
		         <div class="rating3">
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
		         </div>
			 	<span id="rating"  avgRate="${avgRate}">${avgRate}</span>
	    	</div>
            <p>
               <c:if test="${vo.sconeline != ''}">
                  <div class="oneLine">
                     <p style="font-weight:bold;">사장님의 한줄소개</p>
                     <p>${vo.sconeline}</p>
                  </div>
               </c:if>
               <c:if test="${vo.sconeline == ''}">
                  <div class="oneLine">
                     <p style="font-weight:bold;">사장님의 한줄소개</p>
                     <p>사장님의 한줄 소개가 없습니다.</p>
                  </div>
               </c:if>
            </p>
            <div id="buttons">
               <input type="button" class="openPopup" value="예약하기">
               <input type="button" value="채팅하기">
            </div>
         </div>
      </div>
      <br>
      <!-- 상세설명 -->
      <table id="contentsArea">
      	<tr>
      		<td colspan=2 class="title">영업시간</td>
      	</tr>
      	<tr>
      		<td width=100>OPEN</td>
      		<td>${vo.opentime}</td>
      	</tr>
      	<tr>
      		<td>BREAK</td>
      		<td>${vo.breaktime}</td>
      	</tr>
      	<tr>
      		<td>CLOSE</td>
      		<td>${vo.closetime}</td>
      	</tr>
       	<tr>
       		<td colspan=2 class="title">상세소개</td>
       	</tr>
       	<tr>
       		<td colspan=2>${vo.scdetail_description}</td>
       	</tr>
      </table>
      
   </form>
   <form class="mb-3" name="myform" id="myform" method="post" action="rateInsert">
	   	<input type="hidden" name="id" value="${id }">
	   	<input type="hidden" name="scno" value="${vo.scno }">
		<fieldset>
			<span class="text-bold"></span>
			<input type="radio" name="rate" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="rate" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="rate" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="rate" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="rate" value="1" id="rate5"><label
				for="rate5">★</label>
		</fieldset>
		<div>
			<textarea class="col-auto form-control" type="text" id="reviewContents" name="comments"
					  placeholder="유치원이나 호텔을 이용하시고 후기를 남겨주시면 큰 도움이 됩니다! 감사합니다!"></textarea>
			<div id="btnReviewArea">
				<button id = "btnReview">저&nbsp;&nbsp;&nbsp;&nbsp;장</button>
			</div>
		</div>
	</form>
		<div id="reviewArea" style="text-align: right;"></div>
			<script id="temp" type="text/x-handlebars-template">
				{{#each list}}
					<div class="review">
						<span class="reviewId">{{id}}</span>
						<span class="reviewDate">{{revDate}}</span>
						<p class="rate{{rate}}">{{rate}}</p>
						<p class="reviewComments">{{comments }}</p>
					</div>
				{{/each}}
			</script>
		<div id="btnPage">
			<button id="prev">이전</button>
			<span id="curpage"></span>
			<button id="next">다음</button>
		</div>
	
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	5c9e09df993f534bf4a2916f4cf43cdd&libraries=services"></script>
<div id="map" style="height:350px;"></div>


	<div id="popup01">
		<span id="scno" value="${vo.scno }" style="display:none;"></span>
		<h2 style="margin-left: 150px;" id="scname">${vo.scname}</h2>
		<table id="serviceInfo">
			<tr>
				<td width=100>전화</td>
				<td class="num" id="sctel">${vo.sctel}</td>
			</tr>
			<tr>
				<td>위치</td>
				<td id="scaddress1">${vo.scaddress1}</td>
			</tr>
		</table>
		<hr>
		<table id="date">
			<tr>
				<td width=100>체크인</td>
				<td id="checkin"><input type="date" id="checkinDate" readonly></td>
			</tr>
			<tr>
				<td>체크아웃</td>
				<td id="checkout"><input type="date" id="checkoutDate" readonly></td>
			</tr>
		</table>
		<hr>
		<div id="user" style="width: 400px; height: 270px;">
			<span>본인정보와 동일</span><input type="checkbox" id="userCheck" checked>
			<hr style="margin-left: -10px; margin-top: 15px;">
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
			 <button id="btnpay"onclick="payAPI()">결제하기</button>
		</div>
		<div id="btnClose">
			<button class="close" style="margin-top: 20px;">종료</button>
		</div>
	</div>

<script>
	var page=1;
	var perPageNum=5;
	
	//별점 색칠하기
	$(".rating2").each(function(){
		var targetscore = $(this).parent().find("#rating").html();
		//var targetscore = $(this).parent().find("#rating").attr("avgRate");
		//$('#rating').html(targetscore);
		console.log(targetscore);
		var firstDigit = targetscore.split('.');	
			console.log(firstDigit);
			console.log("테스트   "+firstDigit.length);
			if(firstDigit.length > 1) {
				for(var i=0; i<firstDigit[0]; i++){
					$(this).find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
				}
				$(this).find('.star').eq(firstDigit[0]).css({width:firstDigit[1] + '0%', color : '#F08d28'});
			}else {
				for(var i=0; i<targetscore; i++){
					$(this).find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
				}
			}
			
	});
	//페이지 이전버튼
	$("#prev").on("click", function(){
		page--;
		getReview();

	});
	//페이지 다음버튼
	$("#next").on("click", function(){
		page++;
		getReview();

	});
	//scno값 불러오기
	var scno = $(myform.scno).val();
	getReview();
	
	function getReview(){
		var start = ((page-1)*5);
		$.ajax({
			type: "get",
			url: "/hoschool/reviewList",
			data:{scno:scno, start:start, perPageNum:perPageNum},
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#reviewArea").html(template(data));
				
				var total = data.count;
				var lastPage=Math.ceil(total/perPageNum);
				$("#curpage").html(page+"/"+lastPage);
				if(page==1){
	               $("#prev").attr("disabled",true);
	            }else{
	               $("#prev").attr("disabled",false);
	            }
	            if(page==lastPage){
	               $("#next").attr("disabled",true);
	            }else{
	               $("#next").attr("disabled",false);
	            }
	            //별점 부여
	            $(".rate1").html("⭐");
	            $(".rate2").html("⭐⭐");
	            $(".rate3").html("⭐⭐⭐");
	            $(".rate4").html("⭐⭐⭐⭐");
	            $(".rate5").html("⭐⭐⭐⭐⭐"); 
		        
	            var id = "${id}";
	            var scno = "${vo.scno}";
	            $.ajax({
	            	type:"post",
	            	url: "/hoschool/reviewAllCount",
	            	data:{id:id, scno:scno},
	            	success: function(data){
	            		if(data == 0){
	            			$("#reviewContents").attr("disabled",true);
	            			$("#reviewContents").attr("placeholder", "리뷰는 예약 후 작성이 가능합니다");
	            		}
	            	}
	            });
	            
			}
		});
	}
	//별점이 변경된 경우
	$("input[name='rate']:radio").change(function () {
	    //라디오 값 가져와서 옆에 span에 출력
	    if(this.value==5){
	   		$(".text-bold").html("😍");
	    }else if(this.value==4){
	    	$(".text-bold").html("😎");
	    }else if(this.value==3){
	    	$(".text-bold").html("😄");
	    }else if(this.value==2){
	    	$(".text-bold").html("😥");
	    }else if(this.value==1){
	    	$(".text-bold").html("😭");	
	    }
	});

	//리뷰 저장버튼을 클릭한 경우
	$("#btnReview").on("click", function(e){
		e.preventDefault();
		
		var target = $(myform.comments).val();
		 var id = "${id}";
         var scno = "${vo.scno}";
         $.ajax({
         	type:"post",
         	url: "/hoschool/reviewAllCount",
         	data:{id:id, scno:scno},
         	success: function(data){
         		if(data == 0){
         			swal({
         				 title: "",
         				 text: "리뷰는 예약 후 작성이 가능합니다.",
         				 type: "warning"
         				});
         		}else{
         			if(target.length > 500){
         				swal({
         					 title:"",
           				 	 text: "500자 이내로 작성 가능합니다.",
           				 	 type: "warning"
           				});
         			}else if(target.length == 0){
         				swal({
         					 title:"",
            				 text: "내용을 입력해주세요.",
            				 type: "warning"
            				});
         			}
         			
         			swal({
         				title : '',
         				text : '댓글을 등록하실래요?',
         				type : "info",
         				showCancelButton : true,
         				confirmButtonClass : "btn-danger",
         				confirmButtonText : "예",
         				cancelButtonText : "아니오",
         				confirmButtonColor: "#A7CA37",
         				closeOnConfirm : false,
         				closeOnCancel : true
         			}, function(isConfirm) {
         				if (isConfirm) {
         					swal({
         						title : '',
         						text : '',
         						type: 'success',
         						confirmButtonColor: "#A7CA37",	
         					});
         					myform.submit();
         				}else{
         					swal({
         							title : '',
         							text : '취소되었습니다.',
         							type: 'error',
         							confirmButtonColor: "#A7CA37",	
         						});
         				}
         			});
         			
         		}
         	}
         });
		
		
	});
	//PG사 결제API
	function payAPI(){
		IMP.init('imp61649606');
		var userID = "${id}";
		var userName = $("#userName").val();
		var userTel = $("#userTel").val();
		var scPrice = "${vo.scprice}";
		var email = "${email}";
		var address = "${address}";
		var zipcode = "${zipcode}";
		swal(userName+"/"+userTel+"/"+scPrice+"/"+email+"/"+address+"/"+zipcode);
		
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'Pet-CHU 결제시스템',
		    amount : scPrice, //판매 가격
		    buyer_email : email,
		    buyer_name : userName,
		    buyer_tel : userTel,
		    buyer_addr : address,
		    buyer_postcode : zipcode
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    swal(msg);
		});
		
	}
	
	//종료버튼을 클릭한 경우
	$(".close").on("click",function(e){
		e.preventDefault();
		$("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
        $(".backon").hide();
	    
	});
	//예약하기 버튼 클릭시 
	$("#btnReserve").on("click", function(e){
		e.preventDefault();
		
		var id= "${id}";
		var scno = "${vo.scno}";
		var checkin = $("#checkinDate").val();
		var checkout = $("#checkoutDate").val();
		var request = $("#request").val();
		var userName = $("#userName").val();
		
		var tel1=$("#userTel1").val();
		var tel2=$("#userTel2").val();
		var tel3=$("#userTel3").val();
		$("#userTel").val(tel1+tel2+tel3);
		
		var userTel = $("#userTel").val();
		
		swal({
			title : "",
			text : "예약하시겠습니까?",
			type : "info",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			confirmButtonColor: "#A7CA37",
			closeOnConfirm : false,
			closeOnCancel : false
		}, function(isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "get",
					url: "/reserve/reserveInsert",
					data: {id:id, scno:scno, checkin:checkin, checkout:checkout, request:request, userName:userName, userTel:userTel},
					success:function(){
						swal({
							title : '예약완료',
							text : '예약내역으로 이동하시겠습니까?',
							type : "success",
							showCancelButton : true,
							confirmButtonClass : "btn-danger",
							confirmButtonText : "예",
							confirmButtonColor: '#A7CA37',
							cancelButtonText : "아니오",
							
							closeOnConfirm : false,
							closeOnCancel : true
						}, function(isConfirm) {
							if (isConfirm) {
								location.href="/reserve/myreserveList?id="+id;
							}else{
								return;
							}
						});
					}
				});
			}else{
				swal({
					title : '',
					text : '예약이 취소되었습니다.',
					type: 'error',
					confirmButtonColor: "#A7CA37",	
				});
				
			}

		});
		
		
	});
	
	//전화번호 포멧
	var num = $("#titleArea").find(".tel").html();
	var formatNum = '';
	
    if(num.length==11){
        formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }else if(num.indexOf('02')==0){
        formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
    }else if(num.length==12){
        formatNum = num.replace(/(\d{4})(\d{4})(\d{4})/, '$1-$2-$3');
    }else{
        formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    }
    	$("#serviceInfo").find(".num").html(formatNum);
    	$("#titleArea").find(".tel").html(formatNum);

	//가격 천단위 콤마 포멧
	var price = $("#titleArea").find(".price");
	var fmtPrice = price.html().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	price.html(fmtPrice+"원");
	
	//모달팝업 생성
	$(document).ready(function( $ ){     
    $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
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
	
	var address1="${vo.scaddress1}";
	var scname = "${vo.scname}";
	

	
	//지도표시
	$(function(){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//주소로 좌표를 검색합니다
		geocoder.addressSearch(address1, function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.scname}</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
			} 
		});    
	});
	

</script>
