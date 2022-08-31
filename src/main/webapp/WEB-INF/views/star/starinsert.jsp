<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<link rel='stylesheet' href="/resources/home.css">
	<link rel="shortcut icon" href="#">
	<script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
</head>
<style>
	/*.rating .fa-star:nth-child(-n+3){
	 	color:#F05522
	}*/
	/*#makeStar {
	display:none;
	}*/
	.fa-solid{
	cursor:pointer;
	color : #D3D3D3
	}
</style>
<body>
	<div id="page">
		<div id="header">
			<img src='/resources/back.jpg' width=960/>
			<h1>별점  페이지</h1>
		</div>
		<div id="menu">
		</div>
		<div id="content">
			<h2>별점 표시하기</h2>
				<div class="review">
					<div class="rating" data-rate="3">
						<i class="fa-solid fa-star fa-lg"></i>
						<i class="fa-solid fa-star fa-lg"></i>
						<i class="fa-solid fa-star fa-lg"></i>
						<i class="fa-solid fa-star fa-lg"></i>
						<i class="fa-solid fa-star fa-lg"></i>
					</div>
					<div class="rating" data-rate="1">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</div>
					<div class="rating" data-rate="2">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</div>
				</div>
				<hr/>
			<h2>별점주기</h2>
				<div class="make_star">
					<select name="" id="makeStar">
						<option value="0">0</option>
						<option value="1">1</option>				
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br/>
				title : <input type="text" class="rtitle" placeholder="한줄평">
				delivery_review : <input type="text" class="delivery_review" placeholder="배달리뷰">
				review : <input type="text" id="review" placeholder="리뷰"> <br/>
				<br/>
				<span style="font-weight : bold;">만족도</span>
				<br/>
					<input type="radio" name="satisfaction" class="rdetailrate1" value=1> <small>예상보다 좋아요</small>
					<input type="radio" name="satisfaction" class="rdetailrate2" value=2> <small>괜찮아요</small>
					<input type="radio" name="satisfaction" class="rdetailrate3" value=3> <small>예상보다 별로에요</small>
				<br/><br/>
				rimage1 : <input type="text" class="rimage1" placeholder="이미지1"> 
				rimage2 : <input type="text" class="rimage2" placeholder="이미지2"> 
				rimage3 : <input type="text" class="rimage3" placeholder="이미지3"> 
				<br/><br/>
					<div class="rate" style="display:inline;">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> &nbsp;
						<div style="display :inline" id="evaluation"></div>
					</div> 
					 <button id="btnEvaluation">평가</button>
					 <div id="alert"></div>
				</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
<script>
	var rating = $('.rating');
	
	rating.each(function(){ 
		var tagetscore = $(this).attr('data-rate');
		console.log(tagetscore);
		$(this).find('.fa-solid').css({color:'#D3D3D3'});
		$(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color:'#F08d28'});
	});
	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		switch(userScoreNum){
		case "1":
			$("#evaluation").html("별로에요");
			break;
		case "2":
			$("#evaluation").html("조금 별로에요");
			break;
		case "3":
			$("#evaluation").html("보통이에요");
			break;
		case "4":
			$("#evaluation").html("좋아요");
			break;
		case "5":
			$("#evaluation").html("아주 좋아요");
			break;
	}
		$('.make_star .fa-solid').css({color:'#D3D3D3'})
		$('.make_star .fa-solid:nth-child(-n+' + userScoreNum + ')').css({color:'#F08d28'});
	});
	
	$('.make_star .fa-solid').click(function(){
		var targetNum = $(this).index()+1;
		$('#makeStar').val(targetNum);
		switch(targetNum){
		case 1:
			$("#evaluation").html("별로에요");
			break;
		case 2:
			$("#evaluation").html("조금 별로에요");
			break;
		case 3:
			$("#evaluation").html("보통이에요");
			break;
		case 4:
			$("#evaluation").html("좋아요");
			break;
		case 5:
			$("#evaluation").html("아주 좋아요");
			break;
	}
		
		$('.make_star .fa-solid').css({color:'#D3D3D3'})
		$('.make_star .fa-solid:nth-child(-n+' + targetNum + ')').css({color:'#F08d28'});
		
	});
	$("#btnEvaluation").on("click", function(){
		if(!confirm("평점을 등록하시겠습니까?")) return;
		var rtitle = $(".rtitle").val();
		var delivery_review = $(".delivery_review").val();
		var review = $("#review").val();
		var rdetailrate1 = $(".rdetailrate1:checked").val();
		var rdetailrate2 = $(".rdetailrate2:checked").val();
		var rdetailrate3 = $(".rdetailrate3:checked").val();
		var rimage1 = $(".rimage1").val();
		var rimage2 = $(".rimage2").val();
		var rimage3 = $(".rimage3").val();
		var star = $('#makeStar').val();
		var pno = 127;
		
		if(star == 0) {
			alert("별점은 1점 이상!!") 
			return;
		}else if(rtitle == ""){
			alert("한줄평을 입력하세요!");
			$(".rtitle").focus();
			return;
		}else if(delivery_review == ""){
			alert("배달 리뷰를 입력하세요!");
			$(".delivery_review").focus();
			return;
		}else if(review == ""){
			alert("리뷰를 입력하세요!");
			$(".review").focus();
			return;
		}else if(rdetailrate1 == null && rdetailrate2 == null && rdetailrate3 == null){
			alert("맛 만족도를 선택해주세요!");
			return;
		}
		
		$.ajax({
			type: "post",
			url : "/star/insert",
			data : {pno:pno, rtitle:rtitle, delivery_review:delivery_review, review:review, rdetailrate1:rdetailrate1, rdetailrate2:rdetailrate2, rdetailrate3:rdetailrate3, rimage1:rimage1, rimage2:rimage2, rimage3:rimage3, star:star},
			success:function(){
				 alert("등록성공!");
				 $("#alert").html("등록완료!");
				 location.href="/star/list"
			}
		});
	});
</script>
</html>