<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" >

<div id="loginfrm">
	<form name="frm" method="post">
				<p id="title">로그인</p>
				<input type="text" name="id"  placeholder="아이디"><br>
				<input type="password" name="pass"  placeholder="비밀번호"><br>
		
				<input type="submit" value="로그인"><br>
				<button id="kakaologin">Kakao 로그인</button><br>
					<span id="idcontrolbox">
						<a href="/user/usertype">회원가입</a>
						<a href="#">ID찾기</a>	
					</span>
	
	</form>
</div>



<script>

	
	function kakaoLoginPro(response) {
		var data = {
			id : response.id,
			email : response.kakao_account.email
		}
		$.ajax({
			type : 'POST',
			url : '/user/kakaoLoginPro.do',
			data : data,
			dataType : 'json',
			success : function(data) {
				console.log(data)
				if (data.JavaData == "YES") {
					alert("로그인되었습니다.");
					location.href = '/user/usermain.do'
				} else if (data.JavaData == "register") {
					$("#kakaoEmail").val(response.kakao_account.email);
					$("#kakaoId").val(response.id);
					$("#kakaoForm").submit();
				} else {
					alert("로그인에 실패했습니다");
				}

			},
			error : function(xhr, status, error) {
				alert("로그인에 실패했습니다." + error);
			}
		});
	}
	
	$(frm).on("submit", function(e) {
		e.preventDefault();
		
		var id = $(frm.id).val();
		var pass = $(frm.pass).val();

		if (id == "") {
			swal("아이디를 입력하세요");
			return;
		} else if (pass == "") {
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
				if (data == 0) {
					swal("아이디가 존재하지 않습니다.");
				} else if (data == 2) {
					swal("비밀번호가 일치하지 않습니다.");
				}else {
					if(data == 3){
						swal("탈퇴한 회원입니다.")
					}else{
					var dest = "${dest}";
					if (dest == null || dest == "") {
						location.href = "/";
					} else {
						location.href = dest;
					}
				}
			}
		}
	});
})
</script>
