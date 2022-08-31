<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	form{
		margin: 300px;
	}
	table {
		width: 700px;
		margin-top: 200px;
	}
	td {
		padding: 20px;
		margin: 20px;
	}
	h1{
		margin-top: -200px;
	}
	#sidemenu{
		margin-left: -400px;
		margin-top: -50px;
	}
</style>

<form name="frm" action="changepass" method="get">
	<h1>비밀번호 확인</h1>
	<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
	</div>
	<table>
		<tr>
			<td width=100>비밀번호</td>
			<td width=500>
				<input type="hidden" name="id" value="${vo.id }"> 
				<input type="password" name="pass">
				<input type="submit" id="passchk" value="비밀번호 확인">
			</td>
		</tr>
	</table>
</form>
<script>
	
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var pass = $(frm.pass).val();

		
		if(pass==""){
			swal("비밀번호를 입력하세요");
			return;
		}

		$.ajax({
			type : "post",
			url : "/user/login",
			data : {
				id : id,
				pass : pass
			},
			success : function(data) {
				if (data == 2) {
					swal("비밀번호가 일치하지 않습니다.");
				}else {
					frm.submit();
					}
				}
		})
	})

</script>