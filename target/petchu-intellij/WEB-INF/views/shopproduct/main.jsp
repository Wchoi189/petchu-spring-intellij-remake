<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link href="http://kenwheeler.github.io/slick/slick/slick.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link href="/resources/css/shopproduct_main.css" rel="stylesheet">

</head>

<body>
	<div class="page">
		<div class="banner" style="display: flex; justify-content:center; width: 100%; height:300px; overflow: hidden; /* margin-left: 143px; */">
			<img src="/resources/shoppingmall.png">
		</div>

			<!-- 주 카타고리 -->
		<div class="categoryBody">
			<div class="category_select">
				<div><button class="goAll">전체</button></div>

				<!-- 1. 공양이 -->
				<div class="category_cat select">
					<input type="radio" name="animal" value="고양이" id="cat"><label
						for="cat"><img
						src="/resources/icon/icon_cat_food.png"
						style="margin-right: 20px; width:150"id="cat_img" ></label>
				</div>

				<!--메뉴 간격(space)-->
				<div>
					<span><img
						src="/resources/icon_menu/content_select_middle_icon.png"
						style="width: 37px; height: 97px; position: relative;"></span>
				</div>

				<!-- 2. 강아지 -->
				<div class="category_dog select">
					<input type="radio" name="animal" value="강아지" id="dog"><label
						for="dog"><img
						src="/resources/icon_dog_food2.png"
						style="margin-left: 20px;" id="dog_img" width=150></label>
				</div>
			</div>
			<hr style="width: 960px; margin-top: 20px; margin-bottom: 20px;" />

			<div id="menu"></div>
		<!--주 매뉴 : 고양이/강아지 이미지 선택   -->
			<div id="category1" class="category1">
				<!-- 사료 / 간식 / 용품 -->
				<!-- 		<div class="category_list none_show" id="pet_foods">사료</div> -->
				<!-- 		<div class="category_list none_show" id="pet_snack">간식</div> -->
				<!-- 		<div class="category_list none_show" id="pet_supplies">용품</div> -->
				
				<!-- 고양이 선택할 경우 매뉴 나타나기(JS) -->
				<div class="cat">
				<input type="radio" name="item_type" value="사료" id="petFoods"
					class="menu_item"> <label for="petFoods"> 고양이 사료</label> <input
					type="radio" name="item_type" value="간식" id="petSnack"
					class="menu_item"> <label for="petSnack">간식</label> <input
					type="radio" name="item_type" value="용품" id="petSupplies"
					class="menu_item"> <label for="petSupplies">용품</label>
				 </div>		                                                         
				
				<!-- 강아지 선택할 경우 매뉴 나타나기(JS) -->
				<div class="dog">
				<input type="radio" name="item_type" value="사료" id="petFoods2"
					class="menu_item menu_item2"> <label class = "label" for="petFoods2">강아지 사료</label> <input
					type="radio" name="item_type" value="간식" id="petSnack2"
					class="menu_item menu_item2"> <label class = "label" for="petSnack2">간식</label> <input
					type="radio" name="item_type" value="용품" id="petSupplies2"
					class="menu_item menu_item2"> <label class = "label" for="petSupplies2">용품</label>
				</div>
			</div>
			
			
			<div id="category2" class="category2">
				<!-- 하위 카테고리 목록 -->
				<section>
					<ul class="category_list2 category_foods" selectCate2="사료">
						<li class="category_item">
							<div class="category_box">건식</div>
						</li>
						<li class="category_item">
							<div class="category_box">습식</div>
						</li>
						<li class="category_item">
							<div class="category_box">수제</div>
						</li>
						<!-- <li class="category_item">
							<div class="category_box">테스트 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리7</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리13</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 카테고리16</div>
						</li> -->
					</ul>
					<!-- -------------------------- -->
					<ul class="category_list2 category_snack" selectCate2="간식">
						<li class="category_item">				
						<div class="category_box">동결건조</div>
						</li>
						<li class="category_item">
							<div class="category_box">수제</div>
						</li>
						<li class="category_item">
							<div class="category_box">캔</div>
						</li>
						<li class="category_item">
							<div class="category_box">스낵</div>
						</li>
						<%-- <!-- 	<li class="category_item">
							<div class="category_box">테스트 간식 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리7</d<!-- iv>
						</li>
						<li  -->class="category_item">
							<div class="category_box">테스트 간식 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="cate<!-- gory_box">테스트 간식 카테고리13</d -->iv>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 간식 카테고리16</div>
						</li> --> --%>
					</ul>
					<!-- -------------------------- -->
					<ul class="category_list2 category_supplies" selectCate2="용품">
						<li class="category_item">
							<div class="category_box">모래</div>
						</li>
						<li class="category_item">				<div class="category_box">이동장</div>
						</li>
						<li class="category_item">
							<div class="category_box">장난감</div>
						</li>
						<li class="category_item">
							<div class="category_box">목걸이</div>
						</li>
						<!-- <li class="category_item">
							<div class="category_box">테스트 용품 카테고리6</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리7</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리8</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리9</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리10</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리11</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리12</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리13</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리14</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리15</div>
						</li>
						<li class="category_item">
							<div class="category_box">테스트 용품 카테고리16</div>
						</li> -->
					</ul>
				</section>
			</div>
		</div>
		<div class="best_container">
			  <h2>BEST 상품</h2>
			    <div class="best_container_top">
			     <c:forEach items="${blist}" var="bvo">
			      <div class="best_item_box">      
			        <div class="best_item_img" pno = "${bvo.pno}" onclick='locationPno(this)'><img src="${bvo.pimage}" alt='best' class="img_best"><img src="/resources/icon_menu/best_1.png" class="best_icon"></div>
			        <div class="best_item_content">
			          <div class="best_item_title">
			          	${bvo.pname}
			          </div>
			           <div class="best_item_price"><span class="price">${bvo.pprice}</span><span>원</span></div>
			        </div>
			      </div>
			       </c:forEach>
			</div>
			    <div class="best_container_bottom">
				 <c:forEach items="${blist2}" var="b2vo">
   			      <div class="best_item_box">      
			        <div class="best_item_img" pno = "${b2vo.pno}" onclick='locationPno(this)'><img src="${b2vo.pimage}" alt='best' class="img_best"><img src="/resources/icon_menu/best_4.png" class="best_icon"></div>
			        <div class="best_item_content">
			          <div class="best_item_title">
			         	${b2vo.pname}
			          </div>
			          <div class="best_item_price"><span class="price">${b2vo.pprice}</span><span>원</span></div>
			        </div>
			      </div>
				</c:forEach>
			</div><!-- best container bottom  -->
		</div><!-- best container(top and bottom)  -->

		
		<!--출력 내용 필요함. 현제 중복 내용 출력  -->
		<!--특가 상품  -->
		<div class="slider_component">
			<div style="text-align:center;">
				<h2 style="font-size: 30px; margin-bottom:0px;">주간 상품</h2>
			</div>
			<div
				style="padding: 50px 0px; width: 1000px; height: 270px; background-color: white;">
				
				<!-- AJAX -->
				<div class="slick-slider-best"></div>
				<script id="temp" type="text/x-handlebars-template">
				{{#each best1}}
					<div class="slider_item_card" pno={{pno}} onclick='locationPno(this)'>
						<div class="item_img">
							<img src="{{pimage}}" alt="img" width=180>
						</div>
						<div class="ellipsis ptitle">
						<a href="">{{pname}}</a>
						</div>
						<div class="row_price">
						<span class="price">{{pprice}}</span><span>원</span>
						</div>
					</div>
				{{/each}}
			</script>
			</div>
		</div>
		
		
		
		<!-- 오늘의 상품 -->
		<div class="slider_component">
			<div style="text-align:center;">
				<h2 style="font-size: 30px; margin-bottom:0px;">오늘의 상품</h2></div>
			<div
				style="padding: 50px 0px; width: 1000px; height: 270px; background-color: white;">
				
				<!-- AJAX -->
				<div class="slick-slider-today"></div>
				<script id="temp2" type="text/x-handlebars-template">
				{{#each today1}}
					<div class="slider_item_card" pno={{pno}} onclick='locationPno(this)'>
						<div class="item_img">
					<img src="{{pimage}}" alt="img" width=180>
					</div>
					<div class="ellipsis ptitle">
					<a href="">{{pname}}</a>
					</div>
					<div class="row_price">
					<span class="price">{{pprice}}</span><span>원</span>
					</div>
					</div>
				{{/each}}
			</script>
		</div>
	</div>
	
		<div class="banner_box" style="display: flex; justify-center;">
			<img src="/resources/icon_menu/banner_left.png" alt='banner' style="height: 50%;width: 50%"><img src="/resources/icon_menu/banner_right.png" alt='banner' style="height: 50%;width: 50%">
		</div>
	
	</div><!-- page tag -->
</body>

<script>

// 	swal({
//  	 title:"",
// 	 text: "내용을 입력해주세요.",
// 	 type: "warning"
// 	});

	/* 오늘의 상품 출력 */
	getToday();
	function getToday() {
		$.ajax({
			type : "get",
			url : "/shopproduct/main.json",
			dataType : "json",
			success : function(data1) {
				console.log("오늘의..")
				console.log(data1)
				destroyToday();
				var template = Handlebars.compile($("#temp2").html());
				$(".slick-slider-today").html(template(data1));
				applyToday();
				getNumberFormat();
			}
		})
	}
/* Best 상품 출력 */
	getBest();
	function getBest() {
		$.ajax({
			type : "get",
			url : "/shopproduct/main.json",
			dataType : "json",
			success : function(data) {
				destroyBest();
				var template = Handlebars.compile($("#temp").html());
				$(".slick-slider-best").html(template(data));
				applyBest()
				getNumberFormat()
			}
		})
	}
	function destroyToday() {
		if ($('.slick-slider-today').hasClass('slick-initialized')) {
			$('.slick-slider-today').slick('unslick');
		}
	}
	function applyToday() {
		$('.slick-slider-today')
				.slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션
							slidesToShow : 5, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 5, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : true, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 
							// 반응형 웹구현 옵션
							responsive : [ {
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									slidesToShow : 3
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									slidesToShow : 2
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							} ]
						});
	}
	
	function destroyBest() {
		if ($('.slick-slider-best').hasClass('slick-initialized')) {
			$('.slick-slider-best').slick('unslick');
		}
	}
	function applyBest() {
		$('.slick-slider-best')
				.slick(
						{
							slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
							infinite : true, //무한 반복 옵션
							slidesToShow : 5, // 한 화면에 보여질 컨텐츠 개수
							slidesToScroll : 5, //스크롤 한번에 움직일 컨텐츠 개수
							speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
							arrows : true, // 옆으로 이동하는 화살표 표시 여부
							dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
							autoplay : true, // 자동 스크롤 사용 여부
							autoplaySpeed : 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
							pauseOnHover : true, // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
							vertical : false, // 세로 방향 슬라이드 옵션
							prevArrow : "<button type='button' class='slick-prev'>Previous</button>", // 이전 화살표 모양 설정
							nextArrow : "<button type='button' class='slick-next'>Next</button>", // 다음 화살표 모양 설정
							dotsClass : "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
							draggable : true, //드래그 가능 여부 
							// 반응형 웹구현 옵션
							responsive : [ {
								breakpoint : 960, //화면 사이즈 960px
								settings : {
									slidesToShow : 3
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							}, {
								breakpoint : 768, //화면 사이즈 768px
								settings : {
									slidesToShow : 2
								}
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							} ]
						});
	}
</script>
<script>
	var cate3val = "";
	var cate2val = "";
	//카테고리 선택시 해당 카테고리의 정보를 담아서 페이지 이동
	$(".category_box").on(
			"click",
			function() {
				var cateval = $(this).text(); //필터링할 카테고리 분류 
				location.href = "/shopproduct/contents_list?selectCate="
						+ cateval + "&selectCate2=" + cate2val
						+ "&selectCate3=" + cate3val;
			});
	//하위 카테고리 display:none;
	function removeCate_2() {
		$(".category_foods").hide();
		$(".category_supplies").hide();
		$(".category_snack").hide();
	}
	   $("input[name='animal']:radio").change(function () {
          //라디오 버튼 값을 가져온다.
          cate3val = this.value;
          $(".category1").attr("class", "category1");
	      $(".category_list2").attr("style", "display:none");       
	      $("input[name='item_type']:radio").prop("checked",false);;
	   });
	   

	$("input[name='item_type']:radio").change(function() {
		//2번 선택지
		//체크드가 라벨이 아닌 라디오에서 되기 때문에 라벨에 클래스 style을 주기 어려움. 생각해 볼 것
		$(".menu_item").attr("class", "menu_item");
		$(this).attr("class", "menu_item checked");
		console.log($(this).attr("class"));
		
		
		cate2val = this.value;
		//value값이 무엇이냐에 따라 다르게 출력  '
		if (cate2val == '사료') {
			removeCate_2();
			$(".category_foods").show();
		} else if (cate2val == '간식') {
			removeCate_2(); //보이게 하기 전에 열려있는 하위 카테고리 값 display:none으로 설정.
			$(".category_snack").show();
		} else {
			removeCate_2();
			$(".category_supplies").show();
		}
	});// 펑션 끝
	/* 강아지 하위 매뉴 보여주기/숨기기 */
	$(document).ready(function() {
		$('.category_select > .category_cat').click(function(e) {
			$('.category1 > .cat').addClass('active');
			 $('.category1 > .dog').removeClass('active'); 			
		});
	});
	/* 고양이 하위 매뉴 보여주기/숨기기 */
	$(document).ready(function() {
		$('.category_select > .category_dog').click(function(e) {
			$('.category1 > .dog').addClass('active');
			 $('.category1 > .cat').removeClass('active'); 
		});
	});
	
	//상품 클릭시 해당 페이지로 이동
	function locationPno(e){
		var pno = $(e).attr("pno");
		location.href="/shopproduct/read?pno="+pno;
	}
	
	//가격포맷
	function getNumberFormat(){
		$(".price").each(function(){
			var price = $(this).html();
			price=price.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(price);
		});
	}
		
	//아이콘 숫자 지정
	var i = 0;
	$(".best_icon").each(function(){
		i++;
		$(this).attr("src", "/resources/icon_menu/best_"+i+".png")
	});
	
	//전체버튼 클릭한 경우
	$(".goAll").on("click", function(){
		location.href = "/shopproduct/contents_list";
	});
</script>