<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" > 	

<div id="page">
	<h1>글정보</h1>
<table id="tbl">
	<c:if test="${vo.id==id }">
		<h2>[${vo.bno }]
			<input type="text" value="${vo.contents }"></h2>
	</c:if>


	<c:if test="${vo.id!=id }">
		<h2>[${vo.bno }]${vo.contents }</h2>
	</c:if>
	<h4>
		<fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/>
		[${vo.id}]
	</h4>

	</table>
</div>
<hr/>
<div id="reply"></div>
<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<h2>[{{rno}}]{{regdate}}</h2>
		<h3>{{id}}</h3>

	<p>{{reply}}</p>
	{{/each}}
</script>

<script>

var bno="${vo.bno}";
getList();



function getList(){
	$.ajax({
		type:"get",
		url:"/recruitReply/list.json",
		data:{bno:bno},
		success:function(data){

			var template = Handlebars.compile($("#temp").html());
			$("#reply").html(template(data));
		}
		 ,error:function(request,status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
	});
}


 
$("#tbl").on("click","#update", function(){
	var row = $(this).parent();
	
	var bno = Number($(this).attr("bno"));
	var contents = $(".contents").val();
	alert(bno);
	if(!confirm("수정하시겠습니까?")) return;
	$.ajax({
		type : "post",
		url : "/recruit/update",
		data : {bno:bno, contents:contents},
		success:function(){
			swal("수정 성공!");
			location.reload();
		}
	});
});
</script>