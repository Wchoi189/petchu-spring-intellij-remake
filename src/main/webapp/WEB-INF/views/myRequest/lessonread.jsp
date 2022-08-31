<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="requestInfo" uid="${lvo.uid}}" lrno="${lvo.lrno}"  style="text-align : left;">
	<h1>[${lvo.nick}]님의 요청서</h1>
	<h3>1. 원하는 레슨 분류</h3>
	<span>${lvo.lesson_classification}</span>
	<hr/>
	<h3>2. 레슨 받는 목적</h3>
	<span>${lvo.lesson_goal}</span>
	<hr/>
	<h3>3. 레슨 형태</h3>
	<span>${lvo.lesson_method}</span>
	<hr/>
	<h3>4. 연령</h3>
	<span>${lvo.age}</span>
	<hr/>
	<h3>5. 성별</h3>
	<span>${lvo.gender}</span>
	<hr/>
	<h3>6. 선호하는 강사 성별</h3>
	<span>${lvo.wish_gender}</span>
	<hr/>
	<h3>7. 레슨 받기 좋은 날짜</h3>
	<span>${lvo.wish_date}</span>
	<hr/>
	<h3>8. 희망하는 레슨 시간대</h3>
	<span>${lvo.wish_time}</span>
	<hr/>
	<h3>9. 진행 방법</h3>
	<span>${lvo.wish_local1} ${lvo.wish_local2}</span>
	<hr/>
	<h3>10. 원하는 지역</h3>
	<span>${lvo.lesson_place}</span>
	<hr/>
	<h3>11. 레슨 관련 문의사항</h3>
	<span>${lvo.detailed_matters}</span>
	<br/><br/>
		<div> 
			<button type="button" style="float : right;" id="btnList">목록이동</button> 
		</div>
	<br/>
</div>
<script>
	$("#btnList").on("click" ,function(){
		location.href="/user/myDeadlineList";
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("견적서 작성페이지로 이동하시겠습니까?")) return;
		frm.submit();
	});
</script>