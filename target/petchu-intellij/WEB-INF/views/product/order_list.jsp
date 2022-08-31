<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#tbl{
		overflow: hidden;
		width: 960px;
		margin: 0px auto;
		text-align:center;
	}
	.name{
		width: 80px;
	}
	.blank{
		border-right: hidden;
	    border-left: hidden;
	    height: 60px;
	}
	.state{
		width: 100px;
		height: 35px;
	}
	.title{
		font-size: 12px;
		font-weight: bold;
		text-align: center;
	}
	.row{
		font-size: 12px;
		text-align: center;
	}
</style>
<div id="page">
	<div id="menu">
		<jsp:include page="${submenu}"/>
	</div>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<tbody>
			<tr>
				<td class="title">주문번호</td>
				<td class="row">{{uono}}</td>
				<td class="title">구매일</td>
				<td colspan=3 class="row">{{paydate}}</td>
			</tr>
			<tr>
				<td class="title">구매자</td>		
				<td class="row">{{uid}}</td>
				<td class="title">가격</td>
				<td class="row">{{display sum}}원</td>		
				<td class="title">전화번호</td>
				<td class="row">{{tel}}</td>
			</tr>
			<tr>
				<td class="title">주소</td>		
				<td class="row">({{zipcode}}) {{address1}} {{address2}}</td>
				<td class="title">포인트사용</td>
				<td class="row">{{display point}}</td>		
				<td class="title">배송현황</td>
				<td>
					<select name="state" class="state" state="{{state}}" uono="{{uono}}">
						<option value=0>배송준비중</option>
						<option value=1>배송중</option>
						<option value=2>배송완료</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="title">요청사항</td>		
				<td colspan=5 class="row">{{omessage}}</td>
			</tr>

			<tr class="blank"><td colspan=6></td></tr>
		</tbody>
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
	
	
	function getList(){
		$.ajax({
			type: "get",
			url:"/product/order_list.json",
			data:{page:page},
			dataType:"json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
				
// 				배송현황 출력
				$(".state").each(function(){
					var state = $(this).attr("state");
					$(this).val(state).prop("selected", true);
				});
			}
		});
		
	}
	$(".pagination").on("click","a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
	//배송현황 변경시 DB 업데이트
	$("#tbl").on("change", ".state", function() {
		var change_state = $(this).val();
		var uono = $(this).attr("uono");
// 		alert(change_state);
		$.ajax({
			type: "post",
			url: "/product/order_state_update",	
			data: {uono:uono, state:change_state},
			success: function(){
				alert("변경완료!");
			}
		});
	});
</script>