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
	}
	td {
		padding: 20px;
		margin: 20px;
	}
</style>

<form name="frm" action="updatepass" method="post">
	<h1>비밀번호 변경</h1>
	<table>
		<tr>
			<td width=100>비밀번호</td>
			<td width=500>
				<input type="hidden" name="id" value="${vo.id }"> 
				<input type="password" name="pass">
			</td>
		</tr>
		<tr>
			<td width=100>비밀번호 확인</td>
			<td width=500>
				<input type="password" name="passchk">
			</td>
		</tr>
	</table>
	<div style="text-align: center; margin: 20px;">
		<input type="submit" value="비밀번호 수정">
	</div>
</form>
<script>
	$(frm).on("submit", function(e) {
		e.preventDefault();
		var id = $(frm.id).val();
		var pass = $(frm.pass).val();
		var passchk = $(frm.passchk).val();
		
		if(pass==""){
			swal("비밀번호를 입력하세요");
			$(frm.pass).focus();
			return;
			
		}else if(passchk==""){
			swal("비밀번호 확인을 입력하세요");
			$(frm.passchk).focus();
			return;
			
		}else if(pass!=passchk){
			swal("입력하신 비밀번호가 불일치합니다");
			$(frm.pass).focus();
			return;
			
		}else{
			alert(pass);
			if(!confirm("수정하시겠습니까?")) return;
			frm.submit();
			//location.href="/user/mypage?id="+id;
		}


	})

</script>