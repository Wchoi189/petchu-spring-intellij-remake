<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	<h1>FAQ</h1>
			<c:if test="${type=='관리'}">
			<a href="/faq/insert">글등록</a>
			</c:if>
	<hr/>
	<table id="tbl">
		<tr >
			<td rowspan=2>번호</td>
			<td style="text-align: center;">제목</td>
			<td colspan=2 width=200 style="text-align: center;">등록일</td>
		</tr>
			<td style="text-align: center;" colspan=3 width=1500>내용</td>
			
			
		<c:forEach items="${list}" var="vo">
		<tr class="tr1" fno="${vo.fno}">
			<td rowspan=2>${vo.fno}</td>
			
		<c:if test="${type=='관리'}">
			<td ><input class="title" type="text" value="${vo.title}"> </td>
		</c:if>
			
		<c:if test="${type!='관리'}">
			<td >${vo.title} </td>
		</c:if>
			
			<td colspan=2 ><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr class="tr2">
		
		<c:if test="${type=='관리'}">
			<td colspan=2 width=1500><input class="contents" type="text" value="${vo.contents}"></td>
		</c:if>
		<c:if test="${type!='관리'}">
			<td colspan=2 width=1500>${vo.contents}</td>
		</c:if>
		<c:if test="${type=='관리'}">
				<td><button class="update">수정</button>
				<button class="delete">삭제</button></td>
		</c:if>
		</tr>
		</c:forEach>
	</table> 
</body>


<script>
	$(".delete").on("click", function(){
		var row = $(this).parent().parent().parent();
		var fno = row.find(".tr1").attr("fno");
		alert(fno);
		if(!confirm("삭제합니다")) return;
		$.ajax({
			type:"post",
			url:"/faq/delete",
			data:{fno:fno},
		success:function(){
			alert("삭제성공")
		}	
		})		
	})
	 
	$(".update").on("click", function(){
		var row = $(this).parent().parent().parent();
		var fno = row.find(".tr1").attr("fno");
		var title = row.find(".title").val();
		var contents = row.find(".contents").val(); 
		alert(fno + title + contents);
		if(!confirm("수정하시겠습니까?")) return;
		$.ajax({
			type : "post",
			url : "/faq/update",
			data : {fno:fno, title:title, contents:contents},
			success:function(){
				alert("수정 성공!");
			}
		});
	});
</script>
