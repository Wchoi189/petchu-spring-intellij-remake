<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<html>
<head>
<title>PET-CHU</title>
<link href="/resources/css/home.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/pagination.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/chart.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!-- PG사 결제API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
</style>
</head>
<body>
<fmt:formatNumber type="number" maxFractionDigits="3" value="${point}" var="commaPoint"/>
	<div id="home_body">
	<header id="header">
		<a href="/"> <img id="logotxt" src="/resources/logo.png"> <img
			id="logoimg" src="/resources/logo_img.png">
		</a>
		<div id="menu">
			<c:if test="${id==null}">
				<a href="/user/login"><button id="login">로그인</button></a>
			</c:if>
			<c:if test="${id!=null}">
				<c:if test="${type=='관리'}">
					<a href="/product/list">쇼핑몰관리</a>
					<span>
						<span><img src="/resources/icon/user.png" style="width: 30px; position: relative; top:2px"/></span>
						<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					</span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
				<c:if test="${type=='일반'}">

						<span class="menu-span"><a href="/user/pointRead"><span id="pointarea"><img src="/resources/coin.png" width=15> ${commaPoint}</a></span>
						<span class="menu-span">
							<span><img src="/resources/icon/estimate.png" style="width: 20px; position: relative; top:2px"/></span><!-- 아이콘으로 -->
							<span><a href="/request/result">받은 견적서</a></span>
						</span>

					<span class="menu-span">
						<span style="height: 100%"><img src="/resources/icon/cart.png" style="width: 20px; position: relative; top:2px"/></span>
						<span><a href="/shopproduct/cart_read">장바구니</a></span>
					</span>


					<span class="menu-span">
						<span><img src="/resources/icon/speech-bubble.png" style="width: 20px; position: relative; top:2px"/></span>
						<span><a href="#" id="chat">채팅</a></span>
					</span>

						<span class="menu-span">
							<span id="bell">
								<small id="count">0</small>
								<script id="countdata" type="text/x-handlebars-template">
									{{data}}
								</script>
							</span>
						</span>

					<span class="menu-span">
						<span><img src="/resources/icon/user.png" style="width: 33px; position: relative; top:7px"/></span>
						<span><a href="/user/mypage?id=${id}">${nick}님</a></span>

					</span>
					<span><a href="/user/logout"><button id="login">로그아웃</button></a></span>
				</c:if>
				<c:if test="${type=='의사'}">
					<a href="/user/pointRead"><span id="pointarea"><img src="/resources/coin.png"> ${commaPoint}</span></a>
					<a href="/request/list">요청서</a>
					<a href="/shopproduct/main">쇼핑몰</a>
							<span class="menu-span">
								<span><a href="#" id="chat">채팅</a></span>
								<span><img src="/resources/icon/speech-bubble.png" style="width: 20px; position: relative; top:2px"/></span><!-- 아이콘으로 -->
							</span>
							<span id="bell">
								<small id="count">0</small>
								<script id="countdata" type="text/x-handlebars-template">
									{{data}}
								</script>
							</span>
						</span>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
				<c:if test="${type=='업체'}">
					<a href="/user/pointRead"><span id="pointarea"><img src="/resources/coin.png"> ${commaPoint}</span></a>
					<a href="/request/servicelist">서비스 요청서</a>
					<span>
						<span id="bell2">
							<small id="count2">0</small>
							<span id="requestCount"></span>
						</span>
					</span>
					<a href="/shopproduct/main">쇼핑몰</a>
					<a href="#" id="chat">채팅</a>
					<span><a href="/user/mypage?id=${id}">${nick}님</a></span>
					<a href="/user/logout"><button id="login">로그아웃</button></a>
				</c:if>
			</c:if>

		</div>
	</header>
	<div id="page">
		
		<div id="content">
			<jsp:include page="${pageName}" />
		</div>
		<hr>
		<div id="footer">

			<div class="bottom">
				상호명 및 호스팅 서비스 제공 : PETCHU<br> 팀장 : 박효진<br> 팀원 : 조현식 | 김보하 | 지하영 | 김준엽 | 최웅비 | 김선광 | 오소희<br> 진짜팀장은조현식<br> 다들수고하셨습니다
			</div>
			<div class="bottom">
				365고객센터담당 | 귀염둥이마스코트보하<br>
				선생님 감사드립니다❤
				 <br> 인천광역시 미추홀구 매소홀로
				488<br> email : help@petchu.com
			</div>
			<div class="bottom" id="bottom3">
				<span>자주묻는질문(FAQ)</span><br>
				<a href="/faq/list"> <img id="faqbtn" src="/resources/icon/icon_faq.png" width=130></a>
			</div>
		</div>
	</div>
	</div> 
</body>
<script>
	$("#chat").on(
			"click",
			function(e) {
				e.preventDefault();
				window.open("/chat/main", "chat",
						"width=450, height=700, top=200, left=900");
			});
	getNC();
	function getNC(){
		$.ajax({
			type: "get",
			url: "/chat/notreadall",
			success:function(data){
				if(data==0){
					$("#bell").hide();
				}
				var template = Handlebars.compile($("#countdata").html());
				$("#count").html(data);
			}
		})
	}
	getRC();
	function getRC(){
		$.ajax({
			type: "post",
			url: "/request/servicecount",
			success:function(totalCount){
				if(totalCount==0){
					$("#bell2").hide();
				}
				$("#count2").html(totalCount);
			}
		})
	}
</script>
</html>