<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.sideMenu{

		width: 150px; 
		float: left;
		height:100%
	}
	*{
	text-align: left;
	}
	.serside, #esside, #requestside, .resside{
		font-size: 12px; margin-left: 5px;
	}
	#petSmallMenu{
		font-size: 12px; margin-left: 5px;
	}
</style>
    
<div class="sideMenu">
	<p><a href="/user/mypage?id=${id}">마이페이지</a></p> 
	<p id="petMiddleMenu"><a href="#">마이펫 관리</a></p> 
	<div id="petSmallMenu" style="display: none;">
	<p><a href="/mypet/mypetInsert?id=${id}"> · 마이펫 추가하기</a></p> 
	<p><a href="/mypet/mypetlist?id=${id }"> · 마이펫 정보</a>
	</div>
	<c:if test="${type=='의사'}">
		<p><a href="#">병원관리</a></p>
	</c:if>
	<c:if test="${type=='업체'}">
		<p class="companyMenu"><a href="#">업체관리</a></p>
		<div class="serside" style="display: none;">
		<p><a href="/hoschool/insert?id=${id }"> · 내 업체 등록</a></p>
		<p><a href="/hoschool/myList?id=${id }"> · 내 업체 목록</a></p>
		</div>
	</c:if>
	<c:if test="${type=='업체'}">
		<p id="estimateMenu"><a href="#">견적서 관리</a></p>
		<div id="esside" style="display: none;">
			<p><a href="/service/beslist"> · 미용</a></p>
			<p><a href="/service/ceslist"> · 홈 클리닝</a></p>
			<p><a href="/service/leslist"> · 레슨</a></p>
		</div>
	</c:if>
	<c:if test="${type=='일반'}">
		<p id="requestMenu"><a href="#">서비스 요청서 관리</a></p>
		<div id="requestside" style="display: none;">
			<p><a href="/user/myRequest"> · 내가 작성한 요청서</a></p>
			<p><a href="/user/myDeadlineList"> · 마감처리한 요청서</a></p>
			<p><a href="/user/myChooseList"> · 채택한 요청서</a></p>
		</div>
	</c:if>
	<p><a href="#">구매내역</a></p>
	<c:if test="${type=='일반'}">
		<p class="reserveMenu"><a href="#">예약내역</a></p>
		<div class="resside" style="display: none;">
		<p><a href="/reserve/myreserveList?id=${id}"> · 내 예약리스트</a></p>
		</div>
	</c:if>
	<c:if test="${type=='업체'}">
		<p class="reserveMenu"><a href="#">예약내역</a></p>
		<div class="resside" style="display: none;">
		<p><a href="/reserve/myreserveList?id=${id}"> · 내 예약리스트</a></p>
		<p><a href="/reserve/comReserveList?id=${id}"> · 우리업체 예약리스트</a></p>
		</div>
	</c:if>
	<p><a href="#">후기관리</a></p>
	<p><a href="#">포인트관리</a></p>
	<p><a href="/user/passchk?id=${vo.id }">비밀번호 변경</a></p>
	<p><a href="/user/deletechk?id=${vo.id }">회원탈퇴</a></p>
</div>
<script>
$("#petMiddleMenu").on("click", function(){
	if($("#petSmallMenu").css("display") == "none"){
		$("#petSmallMenu").show();
	}else {
		$("#petSmallMenu").hide();
	}
})

	$(".companyMenu").on("click", function(){
		if($(".serside").css("display") == "none"){
			$(".serside").show();
		}else {
			$(".serside").hide();
		}
	})
	$(".reserveMenu").on("click", function(){
	if($(".resside").css("display") == "none"){
		$(".resside").show();
	}else {
		$(".resside").hide();
	}
})
	
	$("#estimateMenu").on("click", function(){
		if($("#esside").css("display") == "none"){
			$("#esside").show();
		}else {
			$("#esside").hide();
		}
	});
	
	$("#requestMenu").on("click", function(){
		if($("#requestside").css("display") == "none"){
			$("#requestside").show();
		}else {
			$("#requestside").hide();
		}
	});
</script>