<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" > 	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	<h1>구인 & 광고</h1>
			
			<a href="/recruit/insert">글등록</a>
		
	<hr/>
	<table id="tbl">
		<tr >
			<td width=30px style="text-align: center;">번호</td>
			<td width=150px style="text-align: center;">ID</td>
			<td width=150px style="text-align: center;">등록일</td>
			<td width=150px style="text-align: center;">종류</td>
			<td style="text-align: center;" colspan=2 width=800>내용</td>
		</tr>
			
			
		<c:forEach items="${list}" var="vo">
		<tr class="tr1"  >
			<td  onclick="location.href='read?bno=${vo.bno}'">${vo.bno}</td>
			<td onclick="location.href='read?bno=${vo.bno}'">${vo.id}</td>
			
			<td  onclick="location.href='read?bno=${vo.bno}'"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
			<td onclick="location.href='read?bno=${vo.bno}'">${vo.type}</td>
			
			
		
		<c:if test="${id==vo.id }">
			<td ><input type="text" value="${vo.contents}"></td>
		</c:if>
		<c:if test="${id!=vo.id }">
			<td  onclick="location.href='read?bno=${vo.bno}'" colspan=2>${vo.contents}</td>
		</c:if>
							
			<c:if test="${id==vo.id }">
				<td ><button bno="${vo.bno}" contents="${vo.contents}" class="update">수정</button>
				<button bno="${vo.bno}" class="delete">삭제</button>
				</td>
			</c:if>
		</tr>
		</c:forEach>
	</table> 
	
</body>


<script>

	$("#tbl").on("click",".delete", function(){
		//var row = $(this).parent().parent();
		var bno = Number($(this).attr("bno"));
		if(!confirm("삭제합니다")) return;
		$.ajax({
			type:"post",
			url:"/recruit/delete",
			data:{bno:bno},
		success:function(){
			swal("삭제성공")
			location.reload();
		}	
		 ,error:function(request,status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
		
		})		
	})
	 
	$("#tbl").on("click",".update", function(){
		var row = $(this).parent();
		var bno = Number($(this).attr("bno"));
		var contents = $(".contents").val();
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