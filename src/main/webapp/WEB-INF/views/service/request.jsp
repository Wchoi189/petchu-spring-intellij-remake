<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/resources/css/serequest.css" rel="stylesheet">
<link rel="short icon" href="#">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/pagination.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/chart.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<body>
	<p class="title">요청서를 제출할 서비스 종류를 선택하세요</p>
	<div id="regi">
		<input type="radio" class="radio1" name="service" id="modal_btn1"> <label for="modal_btn1">미용</label> &nbsp;
		<input type="radio" class="radio1"name="service" id="modal_btn2">	<label for="modal_btn2">홈클리닝</label> &nbsp;
		<input type="radio" class="radio1" name="service" id="modal_btn3">	<label for="modal_btn3">레슨</label> &nbsp;
	</div>
	
	<div class="black_bg" ></div> <!-- 창 띄웠을시 배경 -->
	<form name="frm1" action="binsert" method="post" enctype="multipart/form-data">
		<input type="text" name="uid" value="${id}" style="display:none;">
		<input type="text" name="nick" value="${nick}" style="display:none;">
		<div class="modal_wrap" id="modal_wrap1"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
    		<div class="page1" id="page1" style="display : block">
    			<p class="title">[1/9] 어떤 반려동물인가요?</p>
    		    <input type="radio" class="rad" name="pcate" value="강아지" id="pcatedog">
    		    <label for="pcatedog">강아지</label><br/><br/>
    		    <input type="radio" class="rad" name="pcate" value="고양이" id="pcatecat">
				<label for="pcatecat">고양이</label><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [2/9] 어떤 서비스를 원하시나요?</p>
    		    <input type="radio" class="rad" name="beauty_classification" value="목욕" id="beauty_classfication1">
    		    <label for="beauty_classfication1">목욕</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="전체미용" id="beauty_classfication2">
    		    <label for="beauty_classfication2">전체미용</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="부분미용" id="beauty_classfication3">
    		    <label for="beauty_classfication3">부분미용</label><br/><br/>
    		    <input type="radio" class="rad" name="beauty_classification" value="위생미용" id="beauty_classfication4">
    		    <label for="beauty_classfication4">위생미용</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title">[3/9] 반려동물 체중을 선택해주세요</p>
    		    <input type="radio" class="rad" name="weight" value="4kg미만" id="weight1">
				<label for="weight1">4kg미만</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="4~7kg" id="weight2"> 
				<label for="weight2">4~7kg</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="7~10kg" id="weight3">
				<label for="weight3">7~10kg</label><br/><br/>
    		    <input type="radio" class="rad" name="weight" value="10~14kg" id="weight4">
				<label for="weight4">10~14kg</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title">[4/9] 반려동물 나이를 선택해주세요</p>
    		    <input type="radio" class="rad" name="age" value="1살미만" id="age1">
				<label for="age1">1살미만</label><br/><br/>
    		    <input type="radio" class="rad" name="age" value="1~9살" id="age2">
				<label for="age2">1~9살</label><br/><br/>
    		    <input type="radio" class="rad" name="age" value="10살이상" id="age3">
				<label for="age3">10살이상</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [5/9] 마지막 미용시기는 선택해주세요</p>
    		    <input type="radio" class="rad" name="last_beautydate" value="첫미용" id="last_beautydate1">
				<label for="last_beautydate1">첫미용</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="1달 내외" id="last_beautydate2">
				<label for="last_beautydate2">1달 내외</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="2달 내외" id="last_beautydate3">
				<label for="last_beautydate3">2달 내외</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="3달 내외" id="last_beautydate4">
				<label for="last_beautydate4">3달 내외</label><br/><br/>
    		    <input type="radio" class="rad" name="last_beautydate" value="unknown" id="last_beautydate5">
				<label for="last_beautydate5">잘 모르겠다</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [6/9] 어떻게 진행하기를 원하시나요?</p>
    		    <input type="radio" class="rad" name="service_place" value="집(출장 서비스)" id="service_place1">
				<label for="service_place1">집(출장 서비스)</label><br/><br/>
    		    <input type="radio" class="rad" name="service_place" value="개인 미용실" id="service_place2">
				<label for="service_place2">개인 미용실</label><br/><br/>
    		    <input type="radio" class="rad" name="service_place" value="무관" id="service_place3"> 
				<label for="service_place3">무관</label><br/><br/>
			</div>
   		 	<div class="page1">
   		 		<p class="title"> [7/9] 희망서비스일을 선택해주세요</p>
    		    <input type="radio" class="rad" name="wish_date" value="협의" id="wish_date1"> 
				<label for="wish_date1">협의 가능</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="가능한 빨리 진행" id="wish_date2">
				<label for="wish_date2">가능한 빨리 진행</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="일주 이내" id="wish_date3"> 
				<label for="wish_date3">일주일 이내</label><br/><br/>
    		    <input type="radio" class="rad" name="wish_date" value="상관 없음"  id="wish_date4">
				<label for="wish_date4">상관 없음</label><br/><br/>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [8/9] 서비스 희망 지역을 남겨주세요</p>
   		         <table class="city">
    		     	<tr>
    		     		<td>시/도</td>
    		     		<td class="sido"><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. 경기도" name="wish_local1"></td>
    		     	</tr>
    		     	<tr>
    		     		<td>시/군/구</td>
    		     		<td class="gungu"><input type="text" placeholder="ex. 부천시" name="wish_local2"></td>
    		     	</tr>
    		     </table>
   		 	</div>
   		 	<div class="page1">
   		 		<p class="title"> [9/9] 서비스 관련 문의 및 세부사항을 남겨주세요</p>
    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="반려동물의 품종, 병력, 성격 등을 알려주시면 좋아요!"></textarea></div>
   		 	</div>
   			<button type="button" class="buttonc" id="prev1" disabled>이전</button> &nbsp;
   			<input type="button" class="buttonc" id="next1" value="다음">
	   		<input type="submit" class="buttonb" value="요청보내기">
   		</div>
   	</form>
   	
   	<form name="frm2"  action="cinsert" method="post" enctype="multipart/form-data">
   		<input type="text" name="uid" value="${id}" style="display:none;">
   		<input type="text" name="nick" value="${nick}" style="display:none;">
 		<div class="modal_wrap" id="modal_wrap2"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close2"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page2" id="page2" style="display : block;">
	    		    <p class="title">[1/5] 건물유형을 선택해주세요</p>
	    		    <input type="radio" class="rad" name="building_classification" value="아파트"> 아파트 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="빌라"> 빌라 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="주택"> 주택 <br/><br/>
	    		    <input type="radio" class="rad" name="building_classification" value="오피스텔"> 오피스텔 <br/><br/>
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title">[2/5] 집 면적을 선택해주세요</p>
	    		      <input type="radio" class="rad" name="house_size" value="10평 미만"> 10평 미만 <br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="10평대"> 10평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="20평대"> 20평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value="30평대"> 30평대<br/><br/>
	    		    <input type="radio" class="rad" name="house_size" value=> 기타   <input type="text" id="house_size_text" disabled>
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title">[3/5] 클리닝 원하는 날을 선택해주세요</p>
	    		      <input type="radio" class="rad" name="wish_date" value="협의"> 협의 가능 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="가능한 빨리"> 가능한 빨리 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" value="일주 이내"> 일주 이내<br/><br/>
	    		    <input type="radio" class="rad" name="wish_date" id="wish_date" value=> 원하는 날 있음 <input type="date" id="wish_date_date" style="display: none;">
	    		    
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title"> [4/5] 원하는 지역을 선택해주세요</p>
	    		     <table class="city">
	    		     	<tr>
	    		     		<td>시/도</td>
	    		     		<td class="sido"><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex. 경기도" name="wish_local1"></td>
	    		     	</tr>
	    		     	<tr>
	    		     		<td>시/군/구</td>
	    		     		<td class="gungu"><input type="text" placeholder="ex. 부천시" name="wish_local2"></td>
	    		     	</tr>
	    		     </table>
	   		 	</div>
	   		 	<div class="page2">
	    		     <p class="title"> [5/5] 클리닝 관련 희망사항을 남겨주세요</p>
	    		     <div class="texta"><textarea style="width" rows="6" cols="50" name="hope_matters" placeholder="ex. 냄새 제거 및 살균소독 원해요"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev2" disabled>이전</button> &nbsp; <input type="button" class="buttonc" id="next2" value="다음">
	   		 <input type="submit" class="buttonb" value="요청보내기">
   		</div> 
  	</form>
  	
  	<form name="frm3"  action="linsert" method="post" enctype="multipart/form-data">
  		<input type="text" name="uid" value="${id}" style="display:none;">
  		<input type="text" name="nick" value="${nick}" style="display:none;">
   		<div class="modal_wrap" id="modal_wrap3"> <!-- 창 본체 -->
			<div class="modal_close" id="modal_close3"><a href="javascript:void(0);">close</a></div>
	   		 	<div class="page3" id="page3" style="display : block;">
	    		   <p class="title">[1/11] 어떤 레슨을 원하시나요?</p>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 훈련 레슨"> 훈련 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 미용 레슨"> 미용 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value="펫 용품 제작 레슨"> 펫용품 제작 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_classification" value=> 기타 <input type="text" id="lesson_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[2/11] 레슨 받는 목적이 무엇인가요?</p>
	    		    <input type="radio" class="rad" name="lesson_goal" value="홈케어"> 홈 케어 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="자격증 취득"> 자격증 취득 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="취업 준비"> 취업 준비 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_goal" value="창업 준비"> 창업 준비 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[3/11] 어떤 레슨 형태를 원하시나요?</p>
	    		    <input type="radio" class="rad" name="lesson_method" value="개인 레슨"> 개인 레슨<br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="그룹 레슨"> 그룹 레슨 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="온라인 레슨"> 온라인 레슨 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_method" value="학원"> 학원 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[4/11] 연령대를 선택해주세요</p>
	    		    <input type="radio" class="rad" name="age" value="10대 미만"> 10대 미만<br/><br/>
	    		    <input type="radio" class="rad" name="age" value="10대"> 10대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="20대"> 20대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="30대"> 30대 <br/><br/>
	    		    <input type="radio" class="rad" name="age" value="40대"> 40대 이상 
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[5/11] 성별이 어떻게 되시나요?</p>
	    		    <input type="radio" class="rad" name="gender" value="남자"> 남자 <br/><br/>
	    		    <input type="radio" class="rad" name="gender" value="여자"> 여자 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[6/11] 선호하는 강사의 성별이 있으신가요?</p>
	    		    <input type="radio" class="rad" name="wish_gender" value="남자"> 남자 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="여자"> 여자 <br/><br/>
	    		    <input type="radio" class="rad" name="wish_gender" value="무관"> 무관 <br/><br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[7/11] 레슨 받기 좋은 날짜를 기입해주세요</p>
	    		    <input type="checkbox" class="rad" name="wish_date" value="월" id="mon"><label for="mon"> 월 </label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="화" id="tue"><label for="tue"> 화</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="수" id="wen"> <label for="wen"> 수</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="목" id="thu"> <label for="thu"> 목</label>  <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="금" id="fri"> <label for="fri"> 금</label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="토" id="sat"> <label for="sat"> 토</label> <br/>
	    		    <input type="checkbox" class="rad" name="wish_date" value="상담 후" id="lat"> <label for="lat">상담 후</label> 
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[8/11] 희망하는 레슨 시간대를 선택해주세요</p>
	    		    <input type="radio" class="rad" name="wish_time" value="이른 오전(9시 이전)"> 이른 오전(9시 이전) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="오전(9~12시)"> 오전(9~12시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="오후(12~3시)"> 오후(12~3시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="늦은 오후(3시~6시)"> 늦은 오후(3시~6시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="저녁(6~9시)">  저녁(6~9시) <br/>
	    		    <input type="radio" class="rad" name="wish_time" value="늦은 저녁(9시 이후)"> 늦은 저녁(9시 이후) <br/>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[9/11] 어떻게 진행하기 원하시나요?</p>
	    		    <input type="radio" class="rad" name="lesson_place" value="교육생 장소로"> 제가 있는 곳으로 와주세요 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="레슨실"> 레슨실 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value="무관"> 무관 <br/><br/>
	    		    <input type="radio" class="rad" name="lesson_place" value=> 기타 <input type="text" id="place_text" disabled>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[10/11] 원하는 지역을 선택해주세요</p>
	    		    <div class="city"><span class="sido">시/도 &nbsp; &nbsp; : </span><input type="text" style="margin-left:2px; margin-bottom:10px;" placeholder="ex)경기도" name="wish_local1"> <br/>
	    		   <span class="gungu"> 시/군/구 : </span><input type="text" placeholder="ex)부천시" name="wish_local2"></div>
	   		 	</div>
	   		 	<div class="page3">
	    		    <p class="title">[11/11] 레슨 관련 문의 사항을 남겨주세요</p>
	    		    <div class="texta"><textarea style="width" rows="6" cols="50" name="detailed_matters" placeholder="ex. 펫 미용 자격증을 따고 싶어요"></textarea></div>
	   		 	</div>
   		 	 <button type="button" class="buttonc" id="prev3" disabled>이전</button> &nbsp; <input type="button" class="buttonc" id="next3" value="다음">
	   		 <input type="submit" class="buttonb" value="요청보내기">
   		</div>
 	</form>
 	
</body>

<script>
var pageo = document.getElementsByClassName("page1");
var pages = document.getElementsByClassName("page2");
var paget = document.getElementsByClassName("page3");
var i=0; 
var s=0;
var t=0;

//기타
$("input:radio[name='house_size']").click(function(){
	var etcCheck1 = $('input:radio[name="house_size"]:checked').val();
	if( etcCheck1 == ""){
		$('#house_size_text').attr("disabled", false);
	}else{
		$('#house_size_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_classification']").click(function(){
	var etcCheck2 = $('input:radio[name="lesson_classification"]:checked').val();
	if( etcCheck2 == ""){
		$('#lesson_text').attr("disabled", false);
	}else{
		$('#lesson_text').attr("disabled", true);
	}
});

$("input:radio[name='lesson_place']").click(function(){
	var etcCheck3 = $('input:radio[name="lesson_place"]:checked').val();
	if( etcCheck3 == ""){
		$('#place_text').attr("disabled", false);
	}else{
		$('#place_text').attr("disabled", true);
	}
});

//원하는 날짜
$("#wish_date").on("click", function(){
	if($(frm2.wish_date_date).css("display") == "none"){
         $(frm2.wish_date_date).show();
	}else{
		$(frm2.wish_date_date).hide();
	}
})

//frm1
$("#next1").on("click", function(){
	pageo[i].style.display = 'none';
	if(i < pageo.length){i++}
	var si= i;
	pageo[si].style.display = 'block';
	$("#prev1").attr("disabled", false);
	if(i == pageo.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev1").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next1").css({display:""});
	pageo[i].style.display = 'none';
	i--
	pageo[i].style.display = 'block';
	if(i == 0){
		$(this).attr("disabled", true);
	}
});

$(frm1).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm1.uid).val();
	var nick=$(frm1.nick).val();
	var pcate = $(':radio[name="pcate"]:checked').val();
	var beauty_classification = $(':radio[name="beauty_classification"]:checked').val();
	var weight = $(':radio[name="weight"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var last_beautydate = $(':radio[name="last_beautydate"]:checked').val();
	var service_place = $(':radio[name="service_place"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm1.wish_local1).val();
	var wish_local2 = $(frm1.wish_local2).val();
	var detailed_matters = $(frm1.detailed_matters).val();
	
	if(pcate == null){
		swal("1번 문항을 선택해주세요");
		return;
	}else if(beauty_classification == null){
		swal("2번 문항을 선택해주세요");
		return;
	}else if(weight == null){
		swal("3번 문항을 선택해주세요");
		return;
	}else if(age == null){
		swal("4번 문항을 선택해주세요");
		return;
	}else if(last_beautydate == null){
		swal("5번 문항을 선택해주세요");
		return;
	}else if(service_place == null){
		swal("6번 문항을 선택해주세요");
		return;
	}else if(wish_date == null){
		swal("7번 문항을 선택해주세요");
		return;
	}else if(wish_local1 ==""){
		swal("8번 문항을 기입해주세요");
		return;
	}else if(wish_local2 ==""){
		swal("8번 문항을 기입해주세요");
		return;
	}
	if(!confirm("요청서를 작성하시겠습니까?")) return;
	frm1.submit();
});

//frm2
$("#next2").on("click", function(){
	pages[s].style.display = 'none';
	if(s < pages.length){s++}
	var ss= s;
	pages[ss].style.display = 'block';
	$("#prev2").attr("disabled", false);
	if(s == pages.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev2").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next2").css({display:""});
	pages[s].style.display = 'none';
	s--
	pages[s].style.display = 'block';
	if(s == 0){
		$(this).attr("disabled", true);
	}
});

$(frm2).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm2.uid).val();
	var building_classification = $(':radio[name="building_classification"]:checked').val();
	var house_size = $(':radio[name="house_size"]:checked').val();
	var wish_date = $(':radio[name="wish_date"]:checked').val();
	var wish_local1 = $(frm2.wish_local1).val();
	var wish_local2 = $(frm2.wish_local2).val();
	var hope_matters = $(frm2.hope_matters).val();
	
	var house_size_etc = $("#house_size_text").val();
	var wish_date_date = $("#wish_date_date").val();
	
	
	if(building_classification== null){
		swal("1번 문항을 선택해주세요");
		return;
	}else if(house_size == null && house_size_text == ""){
		swal("2번 문항을 선택해주세요");
		return;
	}else if(wish_date == null &&  wish_date_date == ""){
		swal("3번 문항을 선택해주세요");
		return;
	}else if(wish_local1 == ""){
		swal("4번 문항을 선택해주세요");
		return;
	}else if(wish_local2 ==""){
		swal("4번 문항을 선택해주세요");
		return;
	}else{
		if(!confirm("요청서를 작성하시겠습니까?")) return;
		if(wish_date == ""){
			var date = $("#wish_date_date").val();
			$(frm2.wish_date).val(date);
		}
		if(house_size == ""){
			var size = $("#house_size_text").val();
			$(frm2.house_size).val(size);
		}
	}
	
	frm2.submit();
});

//frm3
$("#next3").on("click", function(){
	paget[t].style.display = 'none';
	if(t < paget.length){t++}
	var st= t;
	paget[st].style.display = 'block';
	$("#prev3").attr("disabled", false);
	if(t == paget.length - 1){
		$(this).css({display : 'none'});
		$('.buttonb').css({display : 'block'});
	}else{
		$(this).css({display : ''});
		$('.buttonb').css({display : 'none'});
	}
});

$("#prev3").on("click", function(){
	$(".buttonb").css({display:"none"});
	$("#next3").css({display:""});
	paget[t].style.display = 'none';
	t--
	paget[t].style.display = 'block';
	if(t == 0){
		$(this).attr("disabled", true);
	}
});

$(frm3).on("submit", function(e){
	e.preventDefault();
	var uid=$(frm3.uid).val();
	var lesson_classification = $(':radio[name="lesson_classification"]:checked').val();
	var lesson_goal = $(':radio[name="lesson_goal"]:checked').val();
	var lesson_method = $(':radio[name="lesson_method"]:checked').val();
	var age = $(':radio[name="age"]:checked').val();
	var gender = $(':radio[name="gender"]:checked').val();
	var wish_gender = $(':radio[name="wish_gender"]:checked').val();
	var wish_date = $(':checkbox[name="wish_date"]:checked').val();
	var wish_time = $(':radio[name="wish_time"]:checked').val();
	var lesson_place = $(':radio[name="lesson_place"]:checked').val();
	var wish_local1 = $(frm3.wish_local1).val();
	var wish_local2 = $(frm3.wish_local2).val();
	var detailed_matters = $(frm3.detailed_matters).val();
	
	var lesson_classification_etc = $("#lesson_text").val();
	var lesson_place_etc = $("#place_text").val();
	
	console.log(wish_date);
	
	if(lesson_classification == null && lesson_classification_etc == ""){
		swal("1번 문항을 선택해주세요");
		return;
	}else if(lesson_goal == null){
		swal("2번 문항을 선택해주세요");
		return;
	}else if(lesson_method == null){
		swal("3번 문항을 선택해주세요");
		return;
	}else if(age == null){
		swal("4번 문항을 선택해주세요");
		return;
	}else if(gender == null){
		swal("5번 문항을 선택해주세요");
		return;
	}else if(wish_gender == null){
		swal("6번 문항을 선택해주세요");
		return;
	}else if(wish_date == null){
		swal("7번 문항을 선택해주세요");
		return;
	}else if(wish_time == null){
		swal("8번 문항을 선택해주세요");
		return;
	}else if(lesson_place == null && lesson_place_etc == ""){
		swal("9번 문항을 선택해주세요");
		return;
	}else if(wish_local1 == "" || wish_local2 == ""){
		swal("10번 문항을 선택해주세요");
		return;
	}else{
		if(!confirm("요청서를 작성하시겠습니까?")) return;
		if(lesson_classification == ""){
			$(frm3.lesson_classification).val(lesson_classification_etc);
		}
		if(lesson_place == ""){
			$(frm3.lesson_place).val(lesson_place_etc);
		}
	}
	
	frm3.submit();
});

var services = document.getElementsByName("service");

for(a=0; a < services.length; a++){
    services[a].addEventListener('click', function(){
    console.log('function ON');
    console.log(this.id);
    switch(this.id){
        case "modal_btn1" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap1').style.display ='block';
            break;
        case "modal_btn2" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap2').style.display ='block';
            break;             
        case "modal_btn3" :
        	document.querySelector('.black_bg').style.display ='block';
        	document.querySelector('#modal_wrap3').style.display ='block';
            break;
    }
});
}

window.onload = function() {
    function offClick() {
        document.querySelector('#modal_wrap1').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page1').css({display:'none'});
    	$('#page1').css({display:'block'});
    	$("#next1").css({display : ''});
		$('.buttonb').css({display : 'none'});
		i=0;
        
    }
    function offClick1() {
        document.querySelector('#modal_wrap2').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page2').css({display:'none'});
    	$('#page2').css({display:'block'});
    	$("#next2").css({display : ''});
		$('.buttonb').css({display : 'none'});
		s=0;
    }
    function offClick2() {
        document.querySelector('#modal_wrap3').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        $('.page3').css({display:'none'});
    	$('#page3').css({display:'block'});
    	$("#next3").css({display : ''});
		$('.buttonb').css({display : 'none'});
		t=0;
    }
    document.querySelector('#modal_close1').addEventListener('click', offClick);
    document.querySelector('#modal_close2').addEventListener('click', offClick1);
    document.querySelector('#modal_close3').addEventListener('click', offClick2);
};
</script>