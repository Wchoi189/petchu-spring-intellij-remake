<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
<html> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" > 	

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판관리</title>
</head>
<body>
	<h1>게시글등록</h1>
	<form  name="frm" action="insert" method="post">
	<tr>
		<td><input type="hidden" value="${id}" name="id"></td>
		<td class="title" width=100>종류</td>
				<td width=300>
					<input type="radio" name="type" value="광고"  id="ads">
					<label for="ads">광고</label>
					<input type="radio" name="type" value="구인" id="people">
					<label for="people">구인</label>
					</td>
	</tr>
		<textarea name="contents" rows="5" cols="50" placeholder="내용"></textarea>
		<hr/>
		<input type="submit" value="등록"> 
		<input type="reset" value="취소">
	</form>
	
</body>
<script>
$(frm).on("submit",function(e){
	
		e.preventDefault();
		 var type= $('input[name=type]:checked').val();
		var contents=$(frm.contents).val();
		if(type==null){
			swal("종류를 선택하세요");
		}else if(contents==""){
			swal("내용을 입력하세요");
		}else{
			frm.submit();
		}
			
		
});
</script>
</html>


