<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/css/chat.css" rel="stylesheet" >
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<div id="chatmain">
<c:forEach items="${chatList}" var="vo">
	<div id="chatbox" onclick="location.href='/chat/room?crno='+${vo.crno}">
		<input type="text" value="${vo.crno}" style="display:none" id="crno">
		<p id="dname">
			<c:if test="${type=='ÀÇ»ç'}">${vo.nick}</c:if>
			<c:if test="${type=='ÀÏ¹Ý'}">${vo.dname}</c:if>
		</p>
		<!-- 
		<small id="bell">
			<small id="count">¾å</small>
			<script id="temp" type="text/x-handlebars-template">
				{{data}}
			</script>
		</small>
		 -->
		<p id="fmessage">${vo.message}</p>
		<p id="fregdate">${vo.regdate}</p>
	</div>
</c:forEach>
</div>
<script>
var chatList = new Array();

<c:forEach items="${chatList}" var="chat" varStatus="status">
	chatList.push("${chat.crno}");
</c:forEach>

getNC();
function getNC(){
	for(var i=0; i<chatList.length; i++){
		$.ajax({
			type: "get",
			url: "/chat/notread",
			async: false,
			data: {crno:chatList[i]},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#count").html(data);
			}
		})
	}
}
</script>
<script>
	var vo="${vo.message}";
</script>