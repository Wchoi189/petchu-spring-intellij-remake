<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" > 	

<div id="page">
	<h1>회원가입</h1>

	<form id="frm" action="insert" method="post"
		enctype="multipart/form-data">
		<table id="regi">
	 		<tr>
				<td class="title" width=120>구분</td>
				<td width=500><input type="text" name="type" value="일반">
				</td>

			</tr>
			<tr>
				<td class="title" width=100>아이디<span id="nece"> *</span></td>
				<td width=500><input type="text" name="id">
					<button type="button" id="check" class="smallbtn">중복체크</button></td>

			</tr>
			<tr>
				<td class="title" width=100>패스워드<span id="nece"> *</span></td>
				<td width=500><input type="password" name="pass">
			</tr>
			<tr>
				<td class="title" width=100>패스워드확인<span id="nece"> *</span></td>
				<td width=500><input type="password" name="passchk"></td>
			</tr>
			<tr>
				<td class="title" width=100>이름<span id="nece"> *</span></td>
				<td width=500><input type="text" name="name"></td>
			</tr>
			<tr>
				<td class="title" width=100>닉네임<span id="nece"> *</span></td>
				<td width=500><input type="text" name="nick"></td>
			</tr>
			<tr>
				<td width=100>전화번호<span id="nece"> *</span></td>
				<td width=500>
					<input type="hidden" name="tel">
					<input type="number" id="tel1" name="tel1" placeholder="010" style="width: 50px;"> -
					<input type="number" id="tel2" placeholder="1234" style="width: 80px;"> -
					<input type="number" id="tel3" placeholder="1234" style="width: 80px;">
		
				</td>
			</tr>
			<tr>
				<td class="title" width=100>생년월일</td>
				<td width=500><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<td class="title" width=100>성별</td>
				<td width=300>
					<input type="radio" name="gender" value="남"  id="male">
					<label for="male">남자</label>
					<input type="radio" name="gender" value="여" id="female">
					<label for="female">여자</label>
					</td>
			</tr>
			<tr>
				<td class="title" width=100>이메일</td>
				<td width=300><input type="text" name="email"></td>
			</tr>
			<tr>
				<td class="title" width=100>주소</td>
				<td width=500><input type="text" name="zipcode" size="5"
					value="${vo.zipcode}">
					<button type="button" id="search" class="smallbtn">주소검색</button> <br> <input
					type="text" name="address1" size="50" value="${vo.address1}">
					<input type="text" name="address2" size="50" value="${vo.address2}"></td>
			</tr>
			<tr>
				<td class="title" width=100>이미지</td>
				<td>
				<img src="/resources/icon/icon_in_user_img.png" width=150	id="image" width=150>
				 <input type="file" name="file" style="display:none">
				</td>
			</tr>
		</table>
		<div style="text-align: center;" id="submitbtn">
			<input type="submit" value="회원가입">
			<input type="reset" value="가입취소">
		</div>
	</form>
</div>
<script>
	var check = false;

	//서치버튼을 클릭한 경우
	$("#search").on("click", function() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				$(frm.address1).val(data.address);
				$(frm.zipcode).val(data.zonecode);
				$(frm.address2).focus();
			}
		}).open();
	});

	//중복체크 버튼을 클릭한 경우
	$("#check").on("click", function() {
		var id = $(frm.id).val();
		if (id == "") {
			swal("아이디를 입력하세요");
			$(frm.id).focus();
			return;
		}
		$.ajax({
			type : "post",
			url : "/user/login",
			data : {
				id : id
			},
			success : function(data) {
				if (data == 0) {
					swal("사용가능한 아이디 입니다.");
					check = true;
				} else {
					swal("이미 가입된 아이디 입니다.")
				}
			}
		});
	});

	//회원가입 버튼을 클릭한 경우
	$(frm.id).on("change", function() {
		check = false;
	});

	$(frm).on("submit", function(e) {
		e.preventDefault();

		if (!check) {
			swal("아이디 중복체크를 하세요");
			return;
		}
		var name = $(frm.name).val();
		var file = $(frm.file).val();
		var email= $(frm.email).val();
		var pass = $(frm.pass).val();
		var passchk = $(frm.passchk).val();
		var regPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
		var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		//3개의 전화번호 텍스트박스를 병합하여 섭밋
		var strTel1= $(frm.tel1).val();
		var strTel2= $(frm.tel2).val();
		var strTel3= $(frm.tel3).val();
		
		var strTel=strTel1+strTel2+strTel3;
		
		alert(name+ " | " + file+ " | " + email+ " | " + pass+ " | " + passchk + " | " + strTel);
		
		if (pass == "") {
			swal("비밀번호를 입력하세요");
			$(frm.pass).focus();
			return;
		} else if (false === regPass.test(pass)) {
			swal("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요");
			$(frm.pass).focus();
			return;
		}else if (email== "") {
			swal("이메일을 입력하세요!");
			$(frm.email).focus();
			return;
		} else if (false==regEmail.test(email)) {
			swal("이메일 형식이 맞지 않습니다");
			$(frm.email).focus();
			return;
		} else if (name == "") {
			swal("이름을 입력하세요");
			$(frm.name).focus();
			return;
		} else if (pass != passchk) {
			swal("비밀번호 확인이 일치하지않습니다");
			$(frm.pass).focus();
			return;
	
			
		} else {
			if (!confirm("회원가입하실래요?"))
				return;
			

			$(frm.tel).val(strTel);
			
			frm.submit();
		}
	});
	//이미지 미리보기
	$(frm.file).on("change", function(e) {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
	//이미지 클릭시 파일열기
	$("#image").on("click", function() {
		$(frm.file).click();
	});
</script>