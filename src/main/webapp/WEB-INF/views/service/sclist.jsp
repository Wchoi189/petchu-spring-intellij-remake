<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/request.css" rel="stylesheet">
<style>

.main input[type=radio] {
	display: none;
}

#tab-1:checked ~ .contentss .content-dis:nth-child(1), 
#tab-2:checked ~ .contentss .content-dis:nth-child(2),
#tab-3:checked ~ .contentss .content-dis:nth-child(3)
	{
	display: block;
}

#tab-1:checked ~ .tab label:nth-child(1), 
#tab-2:checked ~ .tab label:nth-child(2),
#tab-3:checked ~ .tab label:nth-child(3)
	{
	background-color: rgba(0, 0, 0, 0.2);
	box-shadow: none;
}

.contentss > div {
	display: none;
}



.main {
	margin: 0 auto;
	main-width: 1380px;
}

.tab {
	overflow : hidden;
}

.tab label {
	font-size: 18px;
	cursor: pointer;
	float: left;
	width: 33.3%;
	text-align: center;
	padding: 15px 0;
	text-transform: uppercase;
	font-weight: bold;
	letter-spacing: 2px;
	user-select: none;
	-webkit-user-select: none;
	margin-right : 0px;
	top : 0;
}

.contentss {
	background-color: rgba(0, 0, 0, 0.2);
	min-height: 600px;
	overflow : hidden;
}

.contentss>div {
	padding: 30px;
	padding-left : 72.5px;
	line-height: 1.5;
	font-size: 17px;
}

a:visited {
	color: white;
}

</style>

<div class="main">
	<input type="radio" id="tab-1" name="show" checked /> 
	<input type="radio" id="tab-2" name="show" /> 
	<input type="radio" id="tab-3" name="show" /> 
	<input type="radio" id="tab-4" name="show" />
	<div class="tab">
		<label for="tab-1">미용 요청서 </label> 
		<label for="tab-2">홈 클리닝 요청서</label> 
		<label for="tab-3">레슨 요청서</label> 
	</div>
<div class="contentss">
    <div class="content-dis">
    	<h2 id="text1">유저가 작성한 요청서가 없습니다</h2>
		<c:forEach items="${beautyList}" var="vo">
			<div class="menu_box1" brno="${vo.brno}" uid="${vo.uid}">
				<p class="dname" style="overflow: hidden; text-overflow: ellipsis; white-space : nowrap;">${vo.nick}님의 요청서</p>
				<p>${vo.pcate}</p>
				<p>${vo.beauty_classification}<p>
				<p>${vo.wish_date}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
	</div>
    <div class="content-dis">
    	<h2 id="text2">유저가 작성한 요청서가 없습니다</h2>
    	<c:forEach items="${cleanList}" var="vo">
			<div class="menu_box2" crno="${vo.crno}" uid="${vo.uid}">
				<p class="dname" style="overflow: hidden; text-overflow: ellipsis; white-space : nowrap;">${vo.nick}님의 요청서</p>
				<p>${vo.building_classification}</p>
				<p>${vo.house_size}<p>
				<p>${vo.wish_date}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
	</div>
    <div class="content-dis">
    	<h2 id="text3">유저가 작성한 요청서가 없습니다</h2>
    	<c:forEach items="${lessonList}" var="vo">
			<div class="menu_box3" lrno="${vo.lrno}" uid="${vo.uid}">
				<p class="dname" style="overflow: hidden; text-overflow: ellipsis; white-space : nowrap;">${vo.nick}님의 요청서</p>
				<p>${vo.lesson_classification}</p>
				<p>${vo.lesson_goal}<p>
				<p>${vo.lesson_method}</p>
				<span>${vo.wish_local1}</span> <span>${vo.wish_local2}</span> 
				<br/><br/>
			</div>
		</c:forEach>
    </div>
</div>
</div>
<script>
	var check1 = $(".menu_box1").attr("brno");
	var check2 = $(".menu_box2").attr("crno");
	var check3 = $(".menu_box3").attr("lrno");

	if(check1 != null){
		$("#text1").css({display : "none"});
	}
	
	if(check2 != null){
		$("#text2").css({display : "none"});
	}
	
	if(check3 != null){
		$("#text3").css({display : "none"});
	}
	
	$(".menu_box1").on("click", function(){
		var brno = $(this).attr("brno");
		location.href="/service/bread?brno=" + brno;
	});
	
	$(".menu_box2").on("click", function(){
		var crno = $(this).attr("crno");
		location.href="/service/cread?crno=" + crno;
	});
	
	$(".menu_box3").on("click", function(){
		var lrno = $(this).attr("lrno");
		location.href="/service/lread?lrno=" + lrno;
	});
</script>
