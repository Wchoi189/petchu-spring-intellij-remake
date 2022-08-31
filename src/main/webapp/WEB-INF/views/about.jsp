<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/about.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="sweetalert2.all.min.js"></script>

<div id="imgslider">
	<div id="slider-div">
		<div>
			<img src="/resources/banner1.png" />
		</div>
		<div>
			<img src="/resources/banner2.png"  />
		</div>
		<div>
			<img src="/resources/banner3.png" />
		</div>
	</div>
</div>
<div id="about">
<c:if test="${id==null}">
	<div class="menu_box">
		<div class="menu_img">
			<img src="/resources/icon_shopping.png" width=100>
		</div>
		<p>쇼핑몰</p>
	</div>
	<div class="menu_box" id="disease"
		 >
		<div class="menu_img">
			<img src="/resources/icon_hospital_2.png" width=100>
		</div>
		<p>병원 견적</p>
	</div>
	<div class="menu_box" >
		<div class="menu_img">
			<img src="/resources/icon_wash.png" width=100>
		</div>
		<p>서비스 견적</p>
	</div>
	<div class="menu_box"  >
		<div class="menu_img">
			<img src="/resources/icon_joy.png" width=100>
		</div>
		<p>유치원 예약</p>
	</div>
	<div class="menu_box" >
		<div class="menu_img">
			<img src="/resources/icon_dog_food.png" width=100>
		</div>
		<p>쇼핑몰</p>
	</div>
	
</c:if>
<c:if test="${id!=null}" >
	<c:if test="${type=='일반'}">
		<div class="menu_box" onClick="location.href='/shopproduct/main'">
		<div class="menu_img">
			<img src="/resources/icon_shopping.png" width=100>
		</div>
		<p>쇼핑몰</p>
		</div>
		<div class="menu_box" id="disease"
			onClick="location.href='/user/sendpage?id=${id}'">
			<div class="menu_img">
				<img src="/resources/icon_hospital_2.png" width=100>
			</div> 
			<p>병원 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/service/request'">
			<div class="menu_img">
				<img src="/resources/icon_wash.png" width=100>
			</div>
			<p>서비스 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/hoschool/list'">
			<div class="menu_img">
				<img src="/resources/icon_joy.png" width=100>
			</div>
			<p>유치원 예약</p>
		</div>
		<div class="menu_box" onClick="location.href='#'">
			<div class="menu_img">
				<img src="/resources/icon_dog_food.png" width=100>
			</div>
			<p>내 정보</p>
		</div>
	</c:if>
	<c:if test="${type=='의사'}">
		<div class="menu_box" onClick="location.href='/shopproduct/main'">
		<div class="menu_img">
				<img src="/resources/icon_shopping.png" width=100>
			</div>
			<p>쇼핑몰</p>
		</div>
		<div class="menu_box" id="disease"
			onClick="location.href='/request/list'">
			<div class="menu_img">
				<img src="/resources/icon_hospital_2.png" width=100>
			</div> 
			<p>받은 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/service/request'">
			<div class="menu_img">
				<img src="/resources/icon_wash.png" width=100>
			</div>
			<p>서비스 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/hoschool/list'">
			<div class="menu_img">
				<img src="/resources/icon_joy.png" width=100>
			</div>
			<p>유치원 예약</p>
		</div>
		<div class="menu_box" onClick="location.href='#'">
			<div class="menu_img">
				<img src="/resources/icon_dog_food.png" width=100>
			</div>
			<p>내 병원 관리</p>
		</div>
	</c:if>
	<c:if test="${type=='업체'}">
		<div class="menu_box" onClick="location.href='/shopproduct/main'">
		<div class="menu_img">
				<img src="/resources/icon_shopping.png" width=100>
			</div>
			<p>쇼핑몰</p>
		</div>
		<div class="menu_box" id="disease"
			onClick="location.href='/user/sendpage?id=${id}'">
			<div class="menu_img">
				<img src="/resources/icon_hospital_2.png" width=100>
			</div> 
			<p>병원 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/service/request'">
			<div class="menu_img">
				<img src="/resources/icon_wash.png" width=100>
			</div>
			<p>받은 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/hoschool/list'">
			<div class="menu_img">
				<img src="/resources/icon_joy.png" width=100>
			</div>
			<p>유치원 예약</p>
		</div>
		<div class="menu_box" onClick="location.href='#'">
			<div class="menu_img">
				<img src="/resources/icon_dog_food.png" width=100>
			</div>
			<p>내 업체 관리</p>
		</div>
	</c:if>
		<c:if test="${type=='관리'}">
		<div class="menu_box" onClick="location.href='/shopproduct/main'">
		<div class="menu_img">
				<img src="/resources/icon_shopping.png" width=100>
			</div>
			<p>쇼핑몰</p>
		</div>
		<div class="menu_box" id="disease"
			onClick="location.href='/user/sendpage?id=${id}'">
			<div class="menu_img">
				<img src="/resources/icon_hospital_2.png" width=100>
			</div> 
			<p>병원 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/service/request'">
			<div class="menu_img">
				<img src="/resources/icon_wash.png" width=100>
			</div>
			<p>서비스 요청서</p>
		</div>
		<div class="menu_box" onClick="location.href='/hoschool/list'">
			<div class="menu_img">
				<img src="/resources/icon_joy.png" width=100>
			</div>
			<p>유치원 예약</p>
		</div>
		<div class="menu_box" onClick="location.href='#'">
			<div class="menu_img">
				<img src="/resources/icon_dog_food.png" width=100>
			</div>
			<p>관리</p>
		</div>
	</c:if>
</c:if>		
</div>

<script>
	$(".menu_box").on("click", function(e) {
		e.preventDefault();
		var id = "${id}"
		if (id == "") {
		
			swal({
				icon:"error",
				title:"  로그인후 이용가능합니다 . ",
				button:"로그인하기"
				  
			}).then(function(result){
				console.log(result);
		         
		        if(result){
		        	location.href = "/user/login"; 
		        }
		        
			})
			
		}
	});
	
	
	$(function() {
		$('#slider-chart-div').slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션     
							slidesToShow : 3, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 300, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : false, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 

							responsive : [ // 반응형 웹 구현 옵션
							{ 
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
									slidesToShow : 3
								}
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
									slidesToShow : 2
								}
							} ]

						});
	})
			
	$(function() {
		$('#slider-div')
				.slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션     
							slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 300, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : false, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 

							responsive : [ // 반응형 웹 구현 옵션
							{ 
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
									slidesToShow : 3
								}
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
									slidesToShow : 2
								}
							} ]

						});
	})
</script>