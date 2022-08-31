<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판관리</title>
</head>
<body>
	<h1>게시글등록</h1>
	<form action="insert" method="post">
		<input name="title" placeholder="제목"><hr/>
		<textarea name="contents" rows="5" cols="50" placeholder="내용"></textarea>
		<hr/>
		<input type="submit" value="등록"> 
		<input type="reset" value="취소">
	</form>
</body>
</html>