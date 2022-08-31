<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<link href="/resources/css/hoschool.css" rel="stylesheet" />
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://www.cssscript.com/demo/segmented-control-toggle-radio/toggle-radios.css" rel="stylesheet" />
	<script src="https://kit.fontawesome.com/e44146d80b.js" crossorigin="anonymous"></script>
<div class="page_hoschool">
	
  	<div class="ho_page_header">
      <form name="frm"id="searchbox">
        <input type="text" id="keyword" name="keyword" >
        <button id="search" name="search" type="submit" >검색</button>
      </form>
    
    <div id="sort" class="toggle-radio" data-style="rounded">
	  <input type="radio" name="sort" id="default_Option1" class="sort" value="rate">
	  <label for="default_Option1">등록순</label>
	  <input type="radio" name="sort" id="default_Option2" class="sort" value="rowPrice">
	  <label for="default_Option2">낮은가격순</label>
	  <input type="radio" name="sort" id="default_Option3" class="sort" value="higPrice">
	  <label for="default_Option3">높은가격순</label>
	</div>
<!--     <div id="sort">
      <input type="radio" name="sort"  class="sort" value="rate">별점높은순
      <input type="radio" name="sort"  class="sort" value="rowPrice">낮은가격순
      <input type="radio" name="sort"  class="sort" value="higPrice">높은가격순
	</div> -->
  </div>
  
  	<div class="ho_body">
	<!-- 좌측 색션(매뉴)	 -->
    <div class="ho_left_section">
    
			<div class="sideMenu_container"> 
	<!-- 	날짜 박스			 -->
			<div class="sideMenu_content_wrapper">
        <div class="date_box">
        	<div class="img_wrapper"><img src="	https://cdn-icons-png.flaticon.com/128/42/42446.png" alt='calendar_icon' id="icon_calendar"></div>
				<div class="datebox_heading">체크인</div>
				<span id="checkinArea"><input id="checkin" type="date" class="input_dates"></span>
				<div class="datebox_heading">체크아웃</div>
				<span id="checkoutArea"><input id="checkout" type="date" class='input_dates'></span>
        </div>
	<!--     태그 박스 부모     -->
				<div class="ho_tag_container">
          <div class="img_wrapper"><img src="	https://dylansmith.gallerycdn.vsassets.io/extensions/dylansmith/hash-and-cache/1.0.35/1631823901554/Microsoft.VisualStudio.Services.Icons.Default" id="hashtag" alt='hashtag'></div>
	<!--   태그 # 박스 자식       -->
	<div class="ho_tag_container_inner">
          <span class="tag" tag="산책">#산책</span>
          <span class="tag" tag="놀이터">#야외놀이터</span>
          <span class="tag" tag="수영장">#펫수영장</span>
          <span class="tag" tag="종일반">#종일반</span>
          <span class="tag" tag="1박">#1박2일</span>
          <span class="tag" tag="2박">#2박3일</span>
          <span class="tag" tag="3박">#3박4일</span>
          <span class="tag" tag="4박">#4박5일</span>
          <span class="tag" tag="장박">#장박</span>
          <span class="tag" tag="단독실">#단독실</span>
          <span class="tag" tag="대형">#대형</span>
          <span class="tag" tag="중형">#중형</span>
          <span class="tag" tag="소형">#소형</span>
          <span class="tag" tag="수의사">#수의사</span>
          <span class="tag" tag="cctv">#cctv</span>
          <span class="tag" tag="애견훈련">#애견훈련</span>
          <span class="tag" tag="애견카페">#애견카페</span>
          <span class="tag" tag="픽업">#픽업</span>
          <span class="tag" tag="당일 입실">#당일 입실</span>
          <span class="tag" tag="위생관리">#위생관리</span>
          <span class="tag" tag="목욕">#목욕</span>
          <span class="tag" tag="서울특별시">#서울특별시</span>
          <span class="tag" tag="인천광역시">#인천광역시</span>
          <span class="tag" tag="경기도">#경기도</span>
        </div>
        </div>
    </div>
   </div> 
	
  </div>
<!--   우측 색션     -->
    <div class="ho_section_right">
        <div class="ho_content_list">
          	<div id="bigPrame"></div>
			<script id="temp" type="text/x-handlebars-template">
			{{#each list}}
         	 <div class="prame" scno="{{scno}}">
           		 <div class="prame_content">
			  		 <!--  1열(상단) :  업체명/전화번호  -->
	           		 <div class="prame_row1">
		                 <div class="prame_name scname" placeholder="어바웃펫">{{scname}}</div>
	              	 </div>
              		 <!--  2열(중간)) :  업체명 상세정보  -->
	                 <div class="prame_row2">
	                   	 <div class="prame_description sctel">{{sctel}}</div>
	                 </div>
              		 <!--  3열(하단)) :  별점 / isDelete / 금액  -->
						<div class="prame_row3">
		              		<div class="icon-score">
						       <div class="rate" style="position: relative; left : 0px; bottom : 0px; font-size : 30px;">★</div>
							 	<span class="rating" style="position: relative; left : 120px; bottom : 40px; font-size : 30px;" avgRate="${avgRate}">${avgRate}</span>
					    	</div>
	                		<div><input class="isDelete" type="hidden" value={{isDelete}}></div>
	               			<div class="prame_price scprice">{{display scprice}}원</div>
               			</div>
              		</div>
            	</div>         
          </div>
          {{/each}}
         </script>
         <c:forEach items="${rlist}" var="rvo">
         	<div class="rvo" scno="${rvo.scno}" avg="${rvo.avgrate }" style="display:none;">
         		<span class="rvo_scno"></span>
         		<span class="rvo_avg">${rvo.avgrate }</span>
         	</div>
         </c:forEach>
    </div>
    
    
    </div>
  </div>
  	<script>
	Handlebars.registerHelper("display", function(scprice){
		return scprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	});
	</script>
  </div>
<script>
	var date=new Date().toISOString().slice(0, 10);
	var keyword=$(frm.keyword).val();
	var sort="";
	var checkin="";
	var checkout="";
	//체크인 체크아웃 오늘날짜로 설정
	document.getElementById('checkin').value = new Date().toISOString().substring(0, 10);
	document.getElementById('checkout').value = new Date().toISOString().substring(0, 10);
	
	
	checkin = document.getElementById('checkin').value;
	checkout = document.getElementById('checkout').value;
	
	getList();
	
	//체크인이 체인지 된 경우
	$(".date_box").on("change","#checkin",function(){
		checkin= $(this).val();
		checkout=$(this).closest(".date_box").find("#checkout");
		checkout.val(checkin);
		checkout=checkin;
		
		console.log("체크인이 첸지된 경우" + "\n 체크인" + checkin + "\n 체크아웃" + checkout)
		
		if(checkin < date){
			swal("체크인","당일보다 이전날짜는 선택할 수 없습니다.",'warning')
		}
		getList();
		
	});
	//체크아웃이 체인지 된 경우
	$(".date_box").on("change", "#checkout",function(e){
		e.preventDefault();
		checkin=$(this).closest(".date_box").find("#checkin").val();
		checkout=$(this).val();
		console.log("체크아웃이 첸지된 경우" + checkin +"/n" + checkout);
		if(checkout<checkin){
			swal("체크아웃","체크아웃은 체크인 이후로 입력가능합니다.",'warning')
			$(this).val(checkin);
		}
		getList();
		
	});
	//데이트 클릭할때 달력표시하고싶은데 ...........
	$("#checkinArea").on("click", function(){
		$(this).find("#checkin");
	});
		
	//소트를 체크한 경우
	$("#sort").on("click",".sort", function(){
		sort = $(this).val();
		
		getList();
	});
	function getList(){
		console.log('겟리스트가 받은 데이타'+"\n"+'키워드:'+keyword+"\n"+'소트:'+sort+"\n"+'체크인:'+checkin+"\n"+'체크아웃:'+checkout)
		$.ajax({
			type:"get",
			url:"/hoschool/list.json",
			dataType:"json",
			data:{keyword:keyword, sort:sort, checkin:checkin, checkout:checkout},
			success: function(data){
				console.log(data);
				var template = Handlebars.compile($("#temp").html());
				$("#bigPrame").html(template(data));
				
				
				  //scno에 맞춰서 별점 출력
				  $(".rvo").each(function(){
					  var scno = $(this).attr("scno");
					  var avg = $(this).attr("avg");
					  $(".prame").each(function(){
						 var conScno = $(this).attr("scno");
						 if(scno==conScno){
							$(this).find(".prame_content .prame_row3 .icon-score .rating").html(avg);
							var rate=$(this).find(".prame_content .prame_row3 .icon-score .rating").html();
							if(rate >= 4.5){
								$(this).find(".prame_content .icon-score .rate").html("⭐⭐⭐⭐⭐");
							}else if (rate >= 3.5){
								$(this).find(".prame_content .icon-score .rate").html("⭐⭐⭐⭐");
							}else if (rate >= 2.5){
								$(this).find(".prame_content .icon-score .rate").html("⭐⭐⭐");
							}else if (rate >= 1.5){
								$(this).find(".prame_content .icon-score .rate").html("⭐⭐");
							}else{
								$(this).find(".prame_content .icon-score .rate").html("⭐");
							}
						 }
					  })
				  })
				//별점에 색깔입히기
				$(".rating2").each(function(){
					var targetscore = $(this).parent().find(".rating").html();
					//var targetscore = $(this).parent().find("#rating").attr("avg");
					//$('#rating').html(targetscore);
					console.log(targetscore);
					var firstDigit = targetscore.split('.');	
						console.log(firstDigit);
						if(firstDigit.length > 1) {
							for(var i=0; i<firstDigit[0]; i++){
								$(this).find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
							}
							$(this).find('.star').eq(firstDigit[0]).css({width:firstDigit[1] + '0%', color : '#F08d28'});
						}else {
							for(var i=0; i<targetscore; i++){
								$(this).find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
							}
						}
				});
				
				  //업체별 백그라운드 적용 
				  $(".prame").each(function(){
						var scname=$(this).find(".prame_name").html();

						var bg=$(".image").html();
						//백그라운드 이미지 수만큼 반복하여 Prame마다 다른이미지 적용
						if(scname=="어바웃펫"){
							$(this).css({"background":"url(/resources/TBN/TBN01.jpg"}); //어바웃펫
							$(this).css({"background-size":"700px 200px"}); 
						}else if(scname=="사랑스럽개"){
							$(this).css({"background":"url(/resources/TBN/TBN04.png"});	//사랑스럽개
							$(this).css({"background-size":"700px 200px"}); 
						}else if(scname=="꽃피는견생(유치원)"){
							$(this).css({"background":"url(/resources/TBN/TBN05.png"});	//꽃피는견생(유치원)
							$(this).css({"background-size":"700px 200px"}); 
						}else if(scname=="꽃피는견생(호텔)"){
							$(this).css({"background":"url(/resources/TBN/TBN06.png"});	//꽃피는견생(호텔)
							$(this).css({"background-size":"700px 200px"}); 
						}
					
					//전화번호 포멧 적용
					var num = $(this).find(".sctel").html();
					var formatNum = '';
					
				    if(num.length==11){
				        formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				    }else if(num.length==8){
				        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
				    }else if(num.indexOf('02')==0){
				        formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
				    }else if(num.length==12){
				        formatNum = num.replace(/(\d{4})(\d{4})(\d{4})/, '$1-$2-$3');
				    }else{
				        formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
				    }
				    	$(this).find(".sctel").html(formatNum);
				});
			}
		});
	}
	
		//검색버튼을 클릭했을 때
	  $(frm).on("submit",function(e){
		  e.preventDefault();
		  keyword=$(frm.keyword).val();
		  getList();
	  });
		
	  //태그를 클릭한 경우
	  $(".tag").on("click", function(){
		  keyword=$(this).attr("tag");
		  
		  getList();
	  });
	  
	  //프레임을 클릭한 경우
	  $("#bigPrame").on("click",".prame",function(){
		 var scno=$(this).attr("scno");
		 var id="${id}";
		 var target = $(this).find('.prame');
		 var checkin = $("#checkin").val();
		 var checkout = $("#checkout").val();
		 	location.href="/hoschool/read?scno=" + scno + "&id=" + id + "&checkin=" + checkin + "&checkout=" + checkout;
		 
	  });
	  
</script>