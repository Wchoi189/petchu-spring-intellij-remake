<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<div id="page">
	<h1>상품목록</h1>
	<table id="tbl"></table>
	
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
				<span>({{pno}}){{pname}}</span><br>
		{{/each}}
	</script>
</div>

<script>
	getList();
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/shopproduct/list.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
</script>