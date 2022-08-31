<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<link rel='stylesheet' href="/resources/home.css">
	<link rel="shortcut icon" href="#">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
</head>
<style>
* {
	box-sizing: border-box;
	
}

.icon-score{
	position: relative;
	display: left;
}

.icon-score .rating2{
	position: absolute;
}

.rating2 .star {
	width: 100;
	overflow: hidden;
}

.rating2 .star-wrap {
	width: 36px;
	display: inline-block;
	color : #D3D3D3;
}

.rating3 .star-wrap{
	width: 36px;
	display: inline-block;
}

.rating3 .fa-solid{
	color : #D3D3D3;
}

.fa-thumbs-up{
	cursor:pointer;
}
</style>
<body >
<div id="page">
	<h1>리뷰 목록</h1>
	<h2>별점 표시하기</h2>

	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
				<div style="display : none;" class="ratingAvg" data-rate="{{ratingAvg}}">{{ratingAvg}}</div>
				<div id="rid" rid="{{rid}}">{{rid}}</div>
				<div class="pno" pno="{{pno}}">{{pno}}</div>
				title : <input type="text" class="rtitle" value="{{rtitle}}">
				delivery_review : <input type="text" class="delivery_review" value="{{delivery_review}}">
				review : <input type="text" class="review" value="{{review}}"> <br/>
				rdetailrate1 : <input type="text" class="rdetailrate1" value="{{rdetailrate1}}">
				rdetailrate2 : <input type="text" class="rdetailrate2" value="{{rdetailrate2}}">
				rdetailrate3 : <input type="text" class="rdetailrate3" value="{{rdetailrate3}}"> <br/>
				rimage1 : <input type="text" class="rimage1" value="{{rimage1}}">
				rimage2 : <input type="text" class="rimage2" value="{{rimage2}}">
				rimage3 : <input type="text" class="rimage3" value="{{rimage3}}"> <br/>
				<div class="make_star">
					<select name="" id="makeStar">
						<option value="1">1</option>				
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br/>
					<div class="rate" style="display:inline; cursor : pointer;" data-rate="{{star}}">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> &nbsp;
						<div style="display :inline" id="evaluation"></div>
					</div> 
					<br/>
				</div> &nbsp;
				<span><i rid="{{rid}}" id="help" class="fa-solid fa-thumbs-up"></i></span>
 				<span>{{helpcount}}</span>
				<button class="btnUpdate">수정</button>
				<button class="btnDelete">삭제</button>
				<br/><br/>
		{{/each}}
		<br/><br/>
		<div class="icon-score">
	        <div class="rating2">
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	         </div>
	         <div class="rating3" data-rate="5">
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	            <div class="star-wrap"><div class="star"> <i class="fa-solid fa-star fa-2x"></i></div></div>
	         </div>
			 <span id="rating" style="position: relative; left : 220px; bottom : 41px; font-size : 36px;">{{ratingAvg}}</span>
	    </div>
	</script>
	
</div>


</body>
<script>
	getList();

	var uid ="admin1";
	
	
	
	$("#tbl").on("click", ".btnDelete", function(){ //리뷰삭제
		if(!confirm("삭제하시겠습니까?")) return;
		var rid= $(this).parent().find("#rid").attr("rid");
		var pno = $(".pno").attr('pno');
		$.ajax({
			type: "post",
			url: "/star/delete",
			data : {rid:rid, pno:pno},
			success:function(){
				getList();
			}
		});
	});
	
	$("#tbl").on("click", ".btnUpdate", function(e){ //리뷰수정
		e.preventDefault();
		if(!confirm("수정하시겠습니까??")) return;
		pno = $(".pno").attr('pno');
		var rid= $(this).parent().find("#rid").attr("rid");
		var rtitle = $(".rtitle").val();
		var delivery_review = $(".delivery_review").val();
		var review = $(".review").val();
		var rdetailrate1 = $(".rdetailrate1").val();
		var rdetailrate2 = $(".rdetailrate2").val();
		var rdetailrate3 = $(".rdetailrate3").val();
		var rimage1 = $(".rimage1").val();
		var rimage2 = $(".rimage2").val();
		var rimage3 = $(".rimage3").val();
		var star = $('#makeStar').val();
		alert(pno + "\n" + rid + "\n" + star + "\n" + rtitle + "\n" + delivery_review
				+ "\n" + review + "\n" + rdetailrate1 + "\n" + rdetailrate2 + 
				"\n" + rdetailrate3 + "\n" + rimage1 + "\n" + rimage2+ "\n" + rimage3);
		$.ajax({
			type: "post",
			url: "/star/update",
			data : {pno:pno, rid:rid, rtitle:rtitle, delivery_review:delivery_review, review:review, rdetailrate1:rdetailrate1, rdetailrate2:rdetailrate2, rdetailrate3:rdetailrate3, rimage1:rimage1, rimage2:rimage2, rimage3:rimage3, star:star},
			success:function(){
				getList();
			}
		});
		
	});
	
	function getList(){ //리뷰 목록 출력
		$.ajax({
			type: "get",
			url: "/star/list.json",
			dataType: "json",
			success: function(data){
				 var template = Handlebars.compile($("#temp").html());
				 $("#tbl").html(template(data));
				 
				 var rate = $('#tbl .rate');
				 var rating2 = $('#tbl .rating2');
					rate.each(function(){
						var tagetscore = $(this).attr("data-rate");
						var row= $(this).parent();
						row.find("#makeStar").val(tagetscore);
						$(this).find('.fa-solid').css({color:'#D3D3D3'});
						$(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color:'#F08d28'});
					});
					
					rating2.each(function(){
						var $this = $(this);
						var tbl = $this.parent().parent();
						var targetscore = tbl.find('.ratingAvg').attr('data-rate');
						$('#rating').html(targetscore);
						console.log(targetscore);
						var firstDigit = targetscore.split('.');	
							console.log(firstDigit);
							if(firstDigit.length > 1) {
								for(var i=0; i<firstDigit[0]; i++){
									$this.find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
								}
								$this.find('.star').eq(firstDigit[0]).css({width:firstDigit[1] + '0%', color : '#F08d28'});
							}else {
								for(var i=0; i<targetscore; i++){
									$this.find('.star').eq(i).css({width:'100%', color: '#F08d28'}); //인덱스 번호에 해당하는 요소 찾기
								}
							}
							
					});
			}
		});
	}
	$(document).ready(function(){ //댓글 추천
		$("#tbl").on("click", ".fa-thumbs-up", function(){
			var rid=$(this).attr("rid");
			alert(rid);
			$.ajax({
				type: "post",
				url: "/help/updateHelp",
				data: {rid:rid, uid:uid},
				success:function(helpCheck){
					alert("helpCheck= " + helpCheck);
					$("#helpCheck").html("helpCheck");
					if(helpCheck == 0){ //중복체크
						alert("추천성공!");
						getList();
						
					}
					else if(helpCheck == 1){
						alert("추천취소!");
						getList();
						
					}
					
				}
				
			});
		});
	});
</script>
</html>