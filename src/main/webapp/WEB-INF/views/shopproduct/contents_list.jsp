<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/temp_page.css" rel="stylesheet">
<link href="/resources/css/content_list.css" rel="stylesheet">

<div id="content_page">
	<!-- <div class="contents_box">
			<span><button class="goAll">전체</button></span> 
			<select
				name="animal_type" class="animal_type">
				<option>전체</option>
				<option>강아지</option>
				<option>고양이</option>
			</select> 
			<select name="item_type" class="item_type" >
				<option>전체</option>
				<option>사료</option>
				<option>간식</option>
				<option>용품</option>
			</select> <input type="text" name="keyword" id="search_text"> <input
				type="button" value="검색" class="btn_search">
		</div> -->

	<div class="top_nav_bar">
		<div class="btn_all_container">
			<a href="#" class="btn_show_all">전체보기</a>
		</div>


		<div class="menu_container_main">
			<div class="menu_container1">

				<div class="menu-options">
					<input type="radio" name="main_category" id="menu_dog" value="강아지"
						class="main_category"> <label for="menu_dog"> 강아지
					</label>
				
					<input type="radio" name="main_category" id="menu_cat" value="고양이"
						class="main_category"> <label for="menu_cat"> 고양이
					</label>
				
				</div>
			</div>
			<div class="menu_container2">
				<div class="menu_title" style="color:white">구분 </div>
				<div class="select_wrapper">
					<div class="select_container">
						<select name="item_type" class="item_type"
							style="width: 100px; height: 30px; border-radius: 5px;">
							<option class="none_type" value="">전체</option>
							<option class="i_type" value="사료">사료</option>
							<option class="i_type" value="간식">간식</option>
							<option class="i_type" value="용품">용품</option>
						</select>
					</div>
				</div>
			</div>
			<div class="menu_container3">
				<div class="menu_item1"></div>
				<div class="menu_item2">
					<div class="searchfield">
						<input type="text" name="keyword" id="search_text">
						<div class="btn_search">
							<img src="/resources/icon_menu/icon_navbar_loupe.png"
								alt='search icon' width=20>
						</div>

					</div>
				</div>

			</div>
		</div>

		<!--   <div class="menu_option_icon"><img src="/resources/icon_menu/navbar_list.png" width=40></div> -->
	</div>

	<div class="content_container">
		<div class="content_item_container_row"></div>

		<script id="temp" type="text/x-handlebars-template">

	{{#each list}}
      <div class="content_item_box_container" pno="{{pno}}">
		<div class="img_container" style="position:relative;" onclick='getLocation(this)' pno="{{pno}}" quantity="{{pqantity}}">
        	<img src="{{pimage}}" class="content_img" alt="https://via.placeholder.com/200x200/d3d3d3">
			<img class="soldout" src="/resources/soldout.png" width=170>
		</div>
        	<div class="content_item_title" pno="{{pno}}" data-price="{{pprice}}" data-pno="{{pno}}">{{pname}}</div>
        	<div class="content_rating_container">
				<div class="rating rating2"><!--
		--><a href="#5" title="Give 5 stars">★</a><!--
		--><a href="#4" title="Give 4 stars">★</a><!--
		--><a href="#3" title="Give 3 stars">★</a><!--
		--><a href="#2" title="Give 2 stars">★</a><!--
		--><a href="#1" title="Give 1 star">★</a>
				</div>
			</div>
			<div class="content_item_price">
          		<div class="price_item1">{{comma pprice}}원</div> <div class="cart_add1"><img src="/resources/icon_menu/cart_add.png" id="cart_add1"></div>
       		</div>
        	<div class="content_item_title_row" pno="{{pno}}">
				<div class="content_item_title">{{replace pbrand}}</div>   
       		</div>
		</div>
	{{/each}}
        </script>
	</div>
</div>
<div class="pagination"></div>
<script>
	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		frm.page.value = page;
	});
</script>
<script>
	/*Brand명이 없으면 'House Brand를 러턴 */
	Handlebars.registerHelper("replace", function(pbrand) {
		var replace = 'House Brand';
		if (pbrand == '') {
			return replace;
		} else {
			return pbrand;
		}
	});
	Handlebars.registerHelper("comma", function(pprice) {
		return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	})
</script>

<script>
	var selectCate = "${cate}";	//건식
	var selectCate2 = "${cate2}";	//사료
	var selectCate3 = "${cate3}";	//고양이
// 	alert(selectCate+"\n"+selectCate2+"\n"+selectCate3);
	
	var keyword = "";
	var page = 1;
	var type = "";
	getContentsList();
	//한 번 로딩된 이후로는 최하위 카테고리 제외
	selectCate="";

	//카테고리가 ""이 아닐 경우 펫타임 radi 선택되어 있도록
	if(selectCate3!=""){
		$(".main_category").each(function(){
			if($(this).val()==selectCate3){
				$(this).attr("checked", true);
			}
		});
	}
	
	//하위 카테고리가 ""이 아닐 경우 아이템타임 select 선택되어 있도록
	if(selectCate2!=""){
		$(".i_type").each(function(){
			if($(this).val()==selectCate2){
				$(this).attr("selected", true);
			}
		});
	}
	

	//펫메뉴 라디오박스 체크시
	$(".main_category").on("change", function() {
		selectCate3 = $(this).val();
		getContentsList();
	});

	//선택 셀렉트박스 선택시
	$(".item_type").on("change", function() {
		type = $(this).val();
		selectCate2 = type;
		getContentsList();
	});

	//상품 클릭시 리드페이지로 이동
	function getLocation(e) {
		var pno = $(e).attr("pno");
		location.href = "read?pno=" + pno + "&selectCate=" + selectCate
				+ "&selectCate2=" + selectCate2 + "&selectCate3=" + selectCate3;
	}

	/* 장바구니 버턴 - 바구니에 추가 (update/insert) */
	$(".content_item_container_row").on("click", ".cart_add1", function() {
		var pno = $(this).closest(".content_item_box_container").attr("pno");
		//장바구니 버튼을 클릭한 경우 session에 저장된 id를 읽어서 장바구니DB에 등록
		var uid = "${id}";
		var amount = 1;

		$.ajax({
			type : "post",
			url : "/shopproduct/insert",
			data : {
				pno : pno,
				uid : uid,
				amount : amount
			},
			success : function(data) {
				if (data == 1) {
					//장바구니 등록 완료
				 	swal({
					  	 title:"",
					 	 text: "장바구니 등록완료!",
					 	 type: "success"
			 		});
					return;
				} else {
					//장바구니 등록 실패
				 	swal({
					  	 title:"",
					 	 text: "이미 장바구니에 등록된 상품입니다.",
					 	 type: "error"
			 		});
				}
			}
		});
	});

	function getContentsList() {
		$.ajax({
			type : "get",
			dataType : "json",
			data : {
				page : page,
				keyword : keyword
			},
			url : "/shopproduct/contents_list.json?selectCate=" + selectCate
					+ "&selectCate2=" + selectCate2 + "&selectCate3="
					+ selectCate3,
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$(".content_item_container_row").html(template(data));
				$(".pagination").html(getPagination(data));
				window.scroll({
					top : 0,
					left : 0,
					behavior : "smooth"
				})
				//상품 재고가 소진되었을 경우 soldOUt 표기
				$(".img_container").each(
						function() {
							if ($(this).attr("quantity") != 0) {

								$(this).find(".soldout").attr("style",
										"display:none;");
							}
						});
			}
		});
	}

	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getContentsList();
	});

	//검색버튼을 클릭했을 경우
	$(".btn_search").on("click", function() {
		keyword = $("#search_text").val();

		getContentsList();
	});

	//엔터 프레스 => click()
	$("#search_text").on("keypress", function(e) {
		if (e.key === "Enter") {
			$(".btn_search").click();
		}
	});

	//전체 버튼 클릭시 
	$(".btn_show_all").on("click", function() {
		location.href = "/shopproduct/contents_list";
	});
</script>