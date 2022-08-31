<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h1>등록 업체</h1>
<div>
		<table id="tbl"></table>
		 <script id="temp" type="text/x-handlebars-template">
			<tr class="row" uid={{id}}>
				
				<td>등록번호</td>
				<td>업체명</td>
				<td colspan=2><a href="/serviceCo/insert"><button>업체등록</button></a></td>
			</tr>
		{{#each .}}
			<tr class="row" uid={{id}} scno={{scno}}>
				
				<td>{{scno}} </td>
				<td>{{scname}}</td>
				<td><button scno={{scno}} class="update">수정</button></td>
				<td><button scno={{scno}} class="delete">삭제</button></td>
				
				
			</tr>
		{{/each}}
		</script>
</div>

		
<script>
$("#tbl").on("click",".row .update",function(){
	var row=$(this).parent();
	var scno=row.find(".update").attr("scno");
	
	location.href="/serviceCo/update?scno="+scno;
})
$("#tbl").on("click",".update",function(){
	var scno=$(this).attr("scno");
	$.ajax({
		type:"get",
		url:"/serviceCo/update", 
		data:{scno:scno}, 
		success:function(){
			
		}
		})
});
getList();
$("#tbl").on("click",".delete", function(){
	var scno=$(this).attr("scno");
	if(!confirm("삭제합니다"))return;
	$.ajax({
		type:"post",
		url:"/serviceCo/delete", 
		data:{scno:scno}, 
		success:function(){
			alert("삭제성공");
			getList();
		}
		})

})
function getList(){
$.ajax({
	type:"get",
	url:"/serviceCo/list.json",
	dataType:"json",
	success:function(data){
		var template = Handlebars.compile($("#temp").html());
        $("#tbl").html(template(data));
	}
});
}


</script>
