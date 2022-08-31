<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="/resources/css/request.css" rel="stylesheet">
<style>
#tbl p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#tbl {
	width: 800px;
	overflow: hidden;
	float: left;
}

.modal_wrap {
	display: none;
	width: 500px;
	min-height: 400px;
	position: absolute;
	top: 40%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #FFFFFF;
	z-index: 2;
	border-radius: 30px;
	padding : 25px;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	background-color : skyblue;
	text-indent: -9999px;
}

.modal_wrap p{
	font-size : 15px;
}

.isDelete, .secheck, .choose_check {
	display : none;

}

textarea {
	margin-left : 0px;
}

.smallBox {
	margin-left : 30px;
	min-height : 256px;
}

.drprice {
	text-align : left;
} 
#sidemenu{
	margin-left: -100px;
}
</style>
<h1>홈 클리닝 견적서 목록</h1>
<div id="sidemenu">
	<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
</div>

	<h2 id="text" style="display:none;">작성된 견적서가 없습니다</h2>
<div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
	      {{#each .}}
			<div class="smallBox" crno={{crno}} scno={{scno}}>
		       <p style="text-align : center;" class="dname">{{nick}}님의 요청서</p>
			   <p>{{building_classification}}, {{house_size}}</p>
		       <span>{{wish_local1}}</span> <span>{{wish_local2}}</span> </br>
			   <p>견적설명 : {{description}}</p>
			   <p class="drprice">제시 가격 : {{printPrice price}}</p>
			   <p class="isDelete" isDelete="{{isDelete}}">마감</p>
			   <p class="secheck" secheck="{{secheck}}" >채택</p>
			   <p class="choose_check" choose_check="{{choose_check}}">채택</p>
			</div>
	      {{/each}}
	</script>
	<div class="black_bg" ></div> <!-- 창 띄웠을시 배경 -->
		<div class="modal_wrap" id="modal_wrap1"></div> <!-- 창 본체 -->
		<script id="temp2" type="text/x-handlebars-template">
			<div class="modal_close" id="modal_close1"><a href="javascript:void(0);">close</a></div>
			<h2 style="text-align : center;">{{nick}}님의 요청사항과 견적</h2>
			<p>건물 유형 : {{building_classification}}</p>
			<p>집 면적 : {{house_size}}</p>
			<p>희망 서비스일  : {{wish_date}}</p>
			<p>희망사항 : {{hope_matters}}</p>
			<h4 style="margin-bottom : 3px;">견적 설명</h4>
			<textarea cols="66.5" rows="13" readonly>{{description}}</textarea>
		</script>
</div>
<script>
Handlebars.registerHelper("printPrice", function(price){
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 });
 
var target = document.getElementsByClassName("isDelete");
var target1 = document.getElementsByClassName("secheck");
var target2 = document.getElementsByClassName("choose_check");
var text = document.getElementById("text");

getList();
	function getList(){
		$.ajax({
			type : "get",
			dataType : "json",
			url : "/service/ceslist.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				for(i=0; i <target.length; i++){
					var isDelete = target[i].getAttribute("isDelete");
					var secheck = target1[i].getAttribute("secheck");
					if(isDelete == 1 && secheck == 0){
						target[i].style.display = 'block';
					}
				}
				for(i=0; i <target1.length; i++){
					var secheck = target1[i].getAttribute("secheck");
					if(secheck == 1){
						target1[i].style.display = 'block';
					}
				}
			},
			error : function(xhr, ajaxSettings, thrownError) 
			   {
				text.style.display = 'block';
			   }

		});
	}
	$("#tbl").on("click", ".smallBox", function(){
		var crno = $(this).attr('crno');
		var scno = $(this).attr('scno');

		document.querySelector('.black_bg').style.display ='block';
    	document.querySelector('#modal_wrap1').style.display ='block';
    		$.ajax({
    			type : "get",
    			dataType : "json",
    			data :{crno:crno, scno:scno},
    			url : "cesread.json",
    			success:function(data){
    				var template = Handlebars.compile($("#temp2").html());
    				$("#modal_wrap1").html(template(data));
    				$('#modal_close1').click(function(){
    					offClick();
    				});
    			}
    		});
    	
	});
	    function offClick() {
	        document.querySelector('#modal_wrap1').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
	
</script>

