<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="requestInfo" style="text-align : left;">
	<h1>[${bvo.nick}]님의 요청서</h1>
	<h3>1. 반려동물 분류</h3>
	<span>${bvo.pcate}</span>
	<hr/>
	<h3>2. 원하는 서비스 </h3>
	<span>${bvo.beauty_classification}</span>
	<hr/>
	<h3>3. 반려동물의 체중</h3>
	<span>${bvo.weight}</span>
	<hr/>
	<h3>4. 반려동물의 나이</h3>
	<span>${bvo.age}</span>
	<hr/>
	<h3>5. 마지막 미용시기</h3>
	<span>${bvo.last_beautydate}</span>
	<hr/>
	<h3>6. 진행방법</h3>
	<span>${bvo.service_place}</span>
	<hr/>
	<h3>7. 희망서비스일</h3>
	<span>${bvo.wish_date}</span>
	<hr/>
	<h3>8. 서비스 희망 지역</h3>
	<span>${bvo.wish_local1} ${bvo.wish_local2}</span>
	<hr/>
	<h3>9. 서비스 관련 문의 및 세부사항</h3>
	<span>${bvo.detailed_matters}</span>
	<br/><br/>
		<div> 
			<button type="button" style="float : right;" id="btnList">목록이동</button> 
		</div>
		<br/>
</div>
<script>
    var brno = $('.requestInfo').attr("brno");
	$("#btnList").on("click" ,function(){
		location.href="/user/myDeadlineList";
	});
	
</script>