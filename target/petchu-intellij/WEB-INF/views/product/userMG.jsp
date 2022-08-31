<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
	.list{
		margin: 80px;
	}
	.title{
		font-size: 12px;
		font-weight: bold;
		text-align: center;
	}
	.info{
		font-size: 12px;
		text-align: center;
	}
	#keword{
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
	.getOut{
		width: 80px;
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
	<form name="frm">
		<div>
			<input type="text" name="keyword" id="keword" placeholder="검색어를 입력하세요" value="${param.keyword}">
			<input type="button" id="search" value="검색">
		</div>
	</form>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
			<tbody class="list" isDel={{isDelete}}>
				<tr class="row1">
					<td width=50 class="title">아이디</td>
					<td width=50 class="info id">{{id}}</td>
				
					<td width=50 class="title">생년월일</td>
					<td width=300 class="info birthday">{{birthday}}</td>

					<td width=70 class="title">타입</td>
					<td width=70 class="info type">{{type}}</td>
				</tr>
				<tr class="row2">
					<td class="title">이름</td>
					<td class="info">{{name}}</td>
				
					<td class="title">이메일</td>
					<td class="info">{{email}}</td>

					<td class="title">닉네임</td>
					<td class="info">{{nick}}</td>
				</tr>
				<tr class="row3">
					<td class="title">성별</td>
					<td class="info">{{gender}}</td>
				
					<td class="title">주소</td>
					<td class="info address">{{address1}}{{address2}}</td>

					<td class="title">탈퇴여부</td>
					<td class="info isDel">{{isDelete}}</td>
				</tr>
				<tr>
					<td colspan=6 style="border-left: hidden;border-right: hidden; text-align:right;"><button class="getOut">강제탈퇴</button></td>
				</tr>
			</tbody>
		{{/each}}
	</script>
	<div class="pagination"></div>
</div>



<script>
	var page = "${param.page==null ? 1: param.page}";
	var keyword = "${param.keyword == null ? '': param.keyword}"
	
	getList();
	
	

	//강제탈퇴 버튼 클릭시 
	$("#tbl").on("click", ".getOut", function(){
		var target=$(this).closest(".list").find(".id");
		var id=target.html();
		
		var admin = $(this).closest(".list").find(".type").html();
		if(admin == "관리"){
			alert("관리자는 강제탈퇴가 불가능합니다.");
			return;
		}
		
		if(!confirm("회원을 강제탈퇴 하시겠습니까?")) return;
		$.ajax({
			type:"post",
			url:"/product/userdelete",
			data:{id:id},
			success: function(){
				alert("삭제가 완료되었습니다.")
				getList();
			}
		});
	});
	function getList(){
		$.ajax({
			type: "get",
			url: "/product/userList.json",
			data:{page:page, keyword:keyword},
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
				
				//탈퇴여부 체크 
				$(".list").each(function(){
					var target = $(this);
					var isDel = $(this).attr("isDel");
					if(isDel==1){
						target.find(".isDel").html("탈퇴")
						target.find(".isDel").css({"color":"red"})
					}else{
						target.find(".isDel").html("정상")
					}
					
					//생년월일 섭스트링
					target = target.find(".birthday");
					var birth = target.html().substring(0,11);
					target.html(birth);
				});
			}
		});
	}
	//페이지 클릭한 경우
	$(".pagination").on("click","a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	//검색버튼을 클릭한 경우
	 $("#search").on("click", function(){
	      keyword = $("#keyword").val();
	      page = 1;
	      getList();
	   });
	//키워드 입력 후 엔터를 친 경우
	   $("#keyword").on("keypress", function(e){
	      if(e.keyCode==13){
	         $("#search").click();
	      }
	   });
	
	
</script>