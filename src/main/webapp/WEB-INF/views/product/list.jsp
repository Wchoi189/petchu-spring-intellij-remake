<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#tbl{
		overflow: hidden;
		width: 960px;
		margin: 0px auto;
	}
	.name{
		width: 80px;
	}
	.pname{
		 width: 300px;
		 white-space: nowrap;
		 overflow: hidden;
		 text-overflow: ellipsis;  /* 말줄임 적용 */
	}
	.qnt{
		width: 50px;
	}
	.btnUpdate{
		width: 50px;
		height: 35px;
		background-color: #A7CA37;
		color: white;
		border: none;
		border-radius: 10px;
		cursor: pointer;
	}
</style>
<div id="page">
	<div id="menu">
		<jsp:include page="${submenu}"/>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td width=50>코드</td>
			<td width=100>이미지</td>
			<td width=300>제품명</td>
			<td width=100>가격</td>
			<td width=100>브랜드</td>
			<td width=50>재고</td>
			<td width=50>수정</td>
		</tr>
	{{#each list}}
		<tr class="row">
			<td class="pno">{{pno}}</td>
			<td><img src="{{pimage}}" width=70></td>
			<td class="pname"><p class="pname">{{pname}}<p></td>
			<td>{{display pprice}}원</td>
			<td>{{pbrand}}</td>
			<td><input type="number" class="qnt" value="{{pqantity}}"></td>
			<td><button class="btnUpdate">수정</button></td>
		</tr>
	{{/each}}
	</script>
	<div class="pagination"></div>
</div>
<script>
		Handlebars.registerHelper("display", function(pprice){
			return pprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		});
</script>
<script>
	var page=1;
	getList();
	
	$("#tbl").on("click", ".row .pname", function(){
		var row=$(this).parent();
		var pno=row.find(".pno").html();
		location.href="/product/read?pno=" + pno;
	});
	
	$("#tbl").on("click",".row .btnUpdate", function(e){
		var row=$(this).parent().parent();
		var code=row.find(".pno").html();
		var qnt=row.find(".qnt").val();

		if(qnt<0 || qnt.replace(/[0-9]/g,'')){
			alert("변경 수량은 숫자로 입력하세요!");
			row.find(".qnt").focus();
			return;
		}
		
		if(!confirm(code + "번 상품의 수량을 " + qnt + "개로 수정하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/product/qntUpdate",
			data: {code:code, qnt:qnt},
			success: function(){
				alert("수량변경 완료!");
				getList();
			}
		});
	});
	
	function getList(){
		$.ajax({
			type: "get",
			url:"/product/list.json",
			data:{page:page},
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
		
	}
	$(".pagination").on("click","a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	})
</script>