<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#keyword{
	width: 300px;
	height: 50px;
	margin-bottom: 40px;
	border-radius: 10px;
	border: 5px solid #A7CA37;
}
#search{
	width: 80px;
	height: 50px;
	background-color: #A7CA37;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
#insert{
	width: 120px;
	height: 35px;
	background-color: #A7CA37;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
input[type=checkbox]{
	width: 20px;
	height: 20px;
	border: 2px solid #A7CA37;
	border-radius: 10px;
}
</style>
<div id="page">
	<div id="menu">
		<jsp:include page="${submenu}"/>
	</div>
	<form name="frm" width=960>
		<input type="text" name="query" id="keyword">
		<button type="submit" id="search">검 &nbsp;&nbsp;색</button>
		검색건수: <span id="total"></span>건
	</form>
	<table id="tbl" style="width: 960px;"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td>
				<input type="checkbox" id="allchk">
			</td>
			<td colspan="2">
				<button id="insert">선택상품 저장</button>
			</td>
		</tr>	
		{{#each items}}
			<tr>
				<td style="text-align:center;">
					<input type="checkbox" class="chk">
				</td>
				<td width=100><img src={{image}} width=100></td>
				<td>
					<div class="image">{{image}}</div>		
					<div class="title">{{{title}}}</div>
					<div class="brand">{{{brand}}}</div>
					<div class="maker">{{maker}}</div>
					<div class="price">{{lprice}}</div>
					<div class="category2">{{category2}}</div>
					<div class="category3">{{category3}}</div>
					<div class="category4">{{category4}}</div>
				</td>
			<tr>
		{{/each}}
	</script>
	<div id = "button">
		<button id="prev">이전</button>
		<span id = "curpage"></span>
		<button id = "next">다음</button>
	</div>
		
</div>
<script>	
	var query="강아지 장난감";
	var page=1;
	getList();

	//이전버튼 클릭시
	$("#prev").on("click",function(){
		page--;
		getList();
	});
	//다음버튼 클릭시
	$("#next").on("click",function(){
		page++;
		getList();
	});
	
	//전체체크박스 선택시
	$("#tbl").on("click","#allchk", function(){
		if($('#allchk').prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	// 개별 체크박스 클릭 시 전체 체크박스 선택
	$("#tbl").on('click','.chk',function(){
    if($('input[class=chk]:checked').length==$('.chk').length){
        $('#allchk').prop('checked',true);
    }else{
       $('#allchk').prop('checked',false);
    }
});
	//저장버튼 클릭시
	$("#tbl").on("click", "#insert", function(){
		if(!confirm("저장하실래요?")) return;
		
		$("#tbl tr .chk:checked").each(function(){
			var chk=$(this);
			var row = $(this).parent().parent();
			var title=row.find(".title").text();
			var pid=row.find(".pid").html();
			var image=row.find(".image").html();
			var price=row.find(".price").html();
			var intPrice = parseInt(price);
			var category2=row.find(".category2").text();
			var category3=row.find(".category3").text();
			var category4=row.find(".category4").text();
			var brand=row.find(".brand").text();
			var maker=row.find(".maker").text();
			var animal=category3.substring(0,3);
				if(animal=="고양이"||"강아지"){
					var animal="기타"
				}
				
		
			//alert(pid + "\n" + image + "\n" + title + "\n" + price);
			
			$.ajax({
				type: "post",
				url: "/product/insert",
				data: {pname:title, pimage:image, pprice:intPrice, pcate2:animal, pcate3:category3, pcate4:category4, pbrand:brand, pmaker:maker},
				success: function(){
					alert("에이작 넘어감")
					chk.prop("checked", false);
				}
				 ,error:function(request,status,error){
		                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
			});
		});
	});
	//검색버튼 클릭시
	$(frm).on("submit", function(e){
		e.preventDefault();
		query=$(frm.query).val();
		getList();
		page=1;
	});
	
	function getList(){
		$.ajax({
			type:"post",
			url:"/product/shop.json",
			dataType:"json",
			data: {query:query, page:page},
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				var total=data.total;
		         $("#total").html(total);
		         var lastPage=Math.ceil(total/10);
				$("#curpage").html(page + " / " + lastPage);
			
				if(page==1) {
					$("#prev").attr("disabled",true);
				}else {
					$("#prev").attr("disabled",false);
				}
				if(page==lastPage) {
					$("#next").attr("disabled",true);
				}else {
					$("#next").attr("disabled",false);
				}
			}
		});
	}
</script>


