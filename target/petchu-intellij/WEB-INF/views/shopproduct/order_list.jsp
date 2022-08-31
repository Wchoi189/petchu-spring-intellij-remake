<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  
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
.sa-button-container{
	text-align:center;
}
#page {
	margin: 0px auto;
}
	.order_read{
		cursor:pointer;
	}
	#tbl{
		overflow:hidden;
		border: none;
		padding: 10px;
		margin: 10px;
		text-align: center;
		margin:0px auto;
	}
	tr, td{
		border:none;
	}
	.tbody{
		margin: 20px;
	}
	.border{
		border-top:50px solid white;
		border-left: 2px solid #ededed;
		border-right: 2px solid #ededed;
		background: #ededed;
	}
	.image{
		cursor:pointer;
	}
	.gray_line {
		border-top: 2px solid white;
 		border-left: 2px solid #ededed; 
 		border-right: 2px solid #ededed; 
		background: #ededed;
	}
	.date_td {
		height:5px;
	}
	.order_read{
		color:blue;
	}
	.delState{	/* 	이놈 어떻게 해도 가운데정렬 안됨ㅅㅂ */
		font-size: 20;
 	  	margin-left: 30%;
	}
</style>
<div id="page">
	<h1>구매목록</h1>
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each olist}}	
		<tbody class="tbody" orno="{{orno}}" pno="{{pno}}">
		<tr class="date_tr" style="text-align:right;">
			<td colspan="3"><span class="date_td">{{odate}}</span>
				<span class="delState"></span>
				<span class="order_read date_td" orno="{{orno}}" style="float: right;">주문 상세보기</span>
			</td>
			
		</tr>
		<tr>
			<td rowspan="2"><img class="image" src="{{pimage}}" width=100></td>
			<td>{{pname}} · <span class="oamount">{{amount}}개</span></td>
			<td width=150 style="text-align:right;">총 <span class="price" pprice="{{pprice}}" amount="{{amount}}"></span>원</td>
		</tr>
		</tbody>
		{{/each}}
	</script>
	  <div class="footer">
	    <div class = "pagination"></div>
	  </div>
</div>
    
<script>	
var uid = "${id}";
var page = 1;

// $(".date_box_righgt").on("click", "span", function(){
// 	alert("리드이동");
// });


//상세보기 클릭시 이동
$("#tbl").on("click", ".order_read", function(){
	var orno = $(this).attr("orno");
	location.href="/shopproduct/order_read?orno="+orno;
});

//order list 불러오기
getList();
function getList() {
	$.ajax({
		type : "get",
		dataType : "json",
		data : {
			page : page,
			uid : uid
		},
		url : "/shopproduct/order_list.json",
		success : function(data) {
// 			console.log(data);
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
			$(".pagination").html(getPagination(data));
			
// 			//가격 계산
// 			$(".price").each(function(){
// 				var pprice = $(this).attr("pprice");
// 				var amount = $(this).attr("amount");
// 				var final_price = Number(pprice) * Number(amount);
// 				$(this).html(final_price);
// 			});
			
			//orno별 구분선 등록
			var tno = "";
			var orno = "";
			var i = 0
			$(".tbody").each(function(){
				orno = $(this).attr("orno");
// 				console.log(orno);
				var test = document.getElementsByClassName('tbody')[i];
// 				console.log(test);
				i++;
				if(tno==""||tno!=orno){
// 					alert("tno=" + tno + "\norno=" + orno);
					test.classList.add('border');
					$(this).find(".date_tr").find(".date_td").attr("date_only", "date_only");
				}
				tno=orno;
// 				console.log(tno);
			});	
			$(".date_td").each(function(){
				if(!$(this).attr("date_only")){
					$(this).html("");
				}else{
					$(this).parent().attr("style", "background:#A7CA37;");
				}
			});
			
			getState();

			getGrayLine();//구분선 긋기
			
			//날짜포맷
			$(".date_td").each(function(){
				if($(this).attr("date_only")!="date_only") return;
				var str = $(this).html();
				var strDate = str.substring(0, 10);
				strDate = strDate.replace("-", ".");
				strDate = strDate.replace("-", ".");
				$(this).html(strDate);
			});
		
		}
	});
}

//상품 이미지 클릭시 해당 페이지로 이동
$("#tbl").on("click", "img", function(){
	var pno = $(this).parent().parent().parent().attr("pno");
	location.href="/shopproduct/read?pno="+pno;
});


//만약 class명이 "tbody"라면

function getGrayLine(){
	$(".tbody").each(function(){
		if($(this).attr("class")=="tbody"){
			$(this).attr("class", "tbody gray_line");
		}
	});
}

//메뉴바 css 정렬
$(".sideMenu").css("margin-left", "0px");

//페이지네이션 클릭시 페이지 이동
$(".pagination").on("click", "a", function(e){
	e.preventDefault();
	page=$(this).attr("href");
	getList();
});

//상품 배송정보 불러오기 
function getState(){
// 	alert("tq");
	var state=0;
	$(".delState").each(function(){
		var onthis = $(this);
		var orno = $(this).closest(".tbody").attr("orno");
	//		alert(orno);
		$.ajax({
			type : "post",
			dataType : "json",
			data : {
				orno:orno
			},
			url : "/shopproduct/state_read",
			success : function(data){
				state = data.vo.state;
// 				console.log(data.vo.state);
// 				console.log(data.sum);
// 				console.log(data.qnt);
				if(state==0){
					state='배송 준비중';
					onthis.css("color", "blue");
				}else if(state==1){
					state='배송중';
					onthis.css("color", "red");
				}else{
					state='배송완료';
					onthis.css("font-weight", "bold");
				}
				onthis.html(state);
// 				+"\n"+data.sum+"\n"+data.qnt
				var tbody = onthis.parent().parent().parent();
				tbody.find(".price").html(data.sum);
// 				var qnt = dadta.qnt;
// 				qnt = Number(qnt)-1;
				if(data.qnt!=1){
					tbody.find(".oamount").html("외 " + data.qnt + "개");
					tbody.find(".oamount").css("font-weight", "bold");
				}
				
				//가격포맷
				$(".price").each(function(){
					var fprice = $(this).html();
// 					console.log(fprice);
					fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					$(this).html(fprice);
				});
			}
			});//ajax 끝
	});
}
	//스왈 컨펌창
// 	showSwal();
	function showSwal(){
		swal({
			title : "111",
			text : "test",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			confirmButtonColor: "#A7CA37",
			closeOnConfirm : false,
			closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal({
						title : '',
						text : '수정이 완료되었습니다.',
						type: 'success',
						confirmButtonColor: "#A7CA37",	
					});
				}else{
					swal({
							title : '',
							text : '수정이 취소되었습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
						});
				}
			});
	}
</script>