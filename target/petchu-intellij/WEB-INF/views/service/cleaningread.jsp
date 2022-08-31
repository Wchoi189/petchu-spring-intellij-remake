<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.requestInfo {
	text-align : left;
	padding : 0px 100px;
}
.requestInfo hr {
	width : 800px;
}

</style>
<div class="requestInfo" uid="${cvo.uid}}" crno="${cvo.crno}">
	<h1>[${cvo.nick}]님의 요청서</h1>
	<h3>1. 건물유형</h3>
	<span>${cvo.building_classification}</span>
	<hr/>
	<h3>2. 집 면적 </h3>
	<span>${cvo.house_size}</span>
	<hr/>
	<h3>3. 클리닝을 원하는 날</h3>
	<span>${cvo.wish_date}</span>
	<hr/>
	<h3>4. 원하는 지역</h3>
	<span>${cvo.wish_local1} ${cvo.wish_local2}</span>
	<hr/>
	<h3>5. 클리닝 관련 희망사항</h3>
	<span>${cvo.hope_matters}</span>
	<br/><br/>
	<form name="frm" action="ceinsert" method="get">
		<input type="text" name="crno" value="${cvo.crno}" style="display:none;">
		<div> 
			<button type="button" style="float : right;" id="btnList">목록이동</button> 
			<button type="submit" style="float : right; margin-right : 10px;" id="estimate">견적서 작성</button> 
		</div>
	</form>
	<br/>
</div>
<script>
	$("#btnList").on("click" ,function(){
		location.href="/request/servicelist";
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		if(!confirm("견적서 작성페이지로 이동하시겠습니까?")) return;
		frm.submit();
	});
</script>