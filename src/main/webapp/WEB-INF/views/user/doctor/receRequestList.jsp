<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/request.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p class="title"><b>최근</b>에 도착한 견적서</p>
<div id="recepage">
<c:forEach items="${list}" var="vo">
	<div class="menu_box" rno="${vo.rno}">
		<p>${vo.nick}님</p>
		<p>동물이름 : ${vo.pname}</p>
		<p>나이 : ${vo.page}</p>
		<p>품종 : ${vo.pbreed}</p>
	</div>
</c:forEach>
</div>
<script>
	$(".menu_box").on("click", function(){
		var rno = $(this).attr("rno");
		location.href = "/request/read?rno=" + rno;
	})
</script>