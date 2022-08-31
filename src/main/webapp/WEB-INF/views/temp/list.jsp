<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/wb.css" rel="stylesheet" >
    <div id="page">
    	<h1>상품 목록</h1>
    	<div id="tbl"></div>
    	<script id="temp" type="text/x-handlebards-template">
		{{#each list}}
			<div class="list_box">
				<div style="margin:0px auto;text-align:center;"><img src="/display?fileName={{pimage}}" width=150></div>
				<div class="pname">{{pname}}</div>
				<div class="price">{{pprice}}</div>
			</div>
		{{/each}}
		</script>
    </div>
    
    <div class="pagination"></div>
    
    <script>
    	var page=1;
    	getList();
    	function getList(){
    		$.ajax({
    			type:"get",
    			url:"/product/dlist.json",
    			data:{page:page},
    			dataType:"json",
    			success:function(data){
    				var template = Handlebars.compile($("#temp").html());
    				$("#tbl").html(template(data));
    				var total=parseInt(data.total);
    			}   			
    		});
    	}
    	
    	/*Page Buttons  */
    	$(".pagination").on("click","a",function(a){
    		e.preventDefault();
    		page=$(this).attr("href");
    		getList();
    	});
    </script>