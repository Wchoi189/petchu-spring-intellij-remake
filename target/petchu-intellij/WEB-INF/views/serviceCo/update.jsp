<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet" > 	

<div id="page">
	<h1>업체수정</h1>

	<form id="frm" action="update" method="post"
		enctype="multipart/form-data">
		<table id="update">
			
			<tr>
				<td class="title" width=100>ID<span id="nece"> *</span></td>
				<td width=500><input type="text" name="id" value="${id}" readonly></td>
			</tr>
			<tr>
				<td class="title" width=100>업체명<span id="nece"> *</span></td>
				<td width=500><input type="text" name="scname" value="${vo.scname}"></td>
			</tr>
			<tr>
				<td width=100>전화번호<span id="nece"> *</span></td>
				<td width=500>
					<input type="hidden" name="sctel" value="${vo.sctel }">
					<input type="number" id="tel1" value= name="tel1" style="width: 50px;"> -
					<input type="number" id="tel2"  style="width: 80px;"> -
					<input type="number" id="tel3"  style="width: 80px;">
		
				</td>
			</tr>
				<tr>
				<td class="title" width=100>면허<span id="nece"> * </span></td>
				<td width=500><input type="text" name="sclicense" value="${vo.sclicense}"></td>
			</tr>
			
			<tr>
				<td class="title" width=100>종류<span id="nece"> *</span></td>
				<td width=300>
					<input type="radio" name="sccate" value="레슨"  id="lesson"
								>
					<label for="lesson">레슨</label>
					<input type="radio" name="sccate" value="미용" id="beauty">
					<label for="beauty">미용</label>
					<input type="radio" name="sccate" value="유치원" id="kindergaden">
					<label for="kindergaden">유치원</label>
					<input type="radio" name="sccate" value="호텔" id="hotel">
					<label for="hotel">호텔</label>
					<input type="radio" name="sccate" value="홈클리닝" id="cleaning">
					<label for="cleaning">홈클리닝</label>
					</td>
			</tr>
			
			<tr>
				<td class="title" width=100>주소<span id="nece"> *</span></td>
				<td width=500><input type="text" name="sczipcode" size="5"
					value="${vo.sczipcode}">
					<button type="button" id="search" class="smallbtn">주소검색</button> <br> <input
					type="text" name="scaddress1" size="50" value="${vo.scaddress1}">
					<input type="text" name="scaddress2" size="50" value="${vo.scaddress2}"></td>
			</tr>
				<tr>
				<td class="title" width=100>오픈시간</td>
				<td width=500><input type="opentime" name="opentime" value="${vo.opentime}"></td>
			</tr>
			<tr>
				<td class="title" width=100>휴식시간</td>
				<td width=500><input type="breaktime" name="breaktime"value="${vo.breaktime}"></td>
			</tr>
			<tr>
				<td class="title" width=100>페점시간</td>
				<td width=500><input type="closetime" name="closetime" value="${vo.closetime}"></td>
			</tr>
			<tr>
				<td class="title" width=100>업체 설명 <span id="nece"> *</span></td>
				<td width=500><input type="text" name="sconeline" value="${vo.sconeline}"></td>
			</tr>
			<tr>
				<td class="title" width=100>상세설명 <span id="nece"> *</span></td>
				<td width=500><textarea name="scdetail_description" cols="100" span="350"  value="${vo.scdetail_description}"></textarea></td>
			</tr>
			<tr>
				<td class="title" width=100>이미지</td>
				<td>
				<img src="fileName?image='=${vo.scimage}'" width=150	id="image" width=150>
				 <input type="file" name="file" style="display:none">
				</td>
			</tr>
		</table>
		<div style="text-align: center;" id="submitbtn">
			<input type="submit" value="업체등록">
			<input type="reset" value="등록취소">
		</div>
	</form>
</div>
<script>
getTel();
function getTel(){
	var sctel= $(frm.sctel).val();

	var tel1=sctel.substr(0,3);
	var tel2=sctel.substr(4,4);
	var tel3=sctel.substr(7,4);
	
	$("#tel1").val(tel1);
	$("#tel2").val(tel2);
	$("#tel3").val(tel3);
	
}




	//서치버튼을 클릭한 경우
	$("#search").on("click", function() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				$(frm.scaddress1).val(data.address);
				$(frm.sczipcode).val(data.zonecode);
				$(frm.scaddress2).focus();
			}
		}).open();
	});

	

	//등록 버튼을 클릭한 경우
	

	$(frm).on("submit", function(e) {
		e.preventDefault();

		
		var time= $(frm.opentime).val();
		var name = $(frm.scname).val();
		var file = $(frm.file).val();
		var license=$(frm.sclicense).val();
		//checked 되어있을 때 가져와야함
		
	 var cate= $('input[name=sccate]:checked').val();
		
		
		var address=$(frm.sczipcode).val();
		var sconeline=$(frm.sconeline).val();
		var scdetail_description=$(frm.scdetail_description).val();
		
		
		
		//3개의 전화번호 텍스트박스를 병합하여 섭밋
		var strTel1= $(frm.tel1).val();
		var strTel2= $(frm.tel2).val();
		var strTel3= $(frm.tel3).val();
		
		var strTel=strTel1+strTel2+strTel3;
		
		alert(name+ " | " + file+ " | " +  strTel + " | " +license+ " | "+ cate+ " | "+ address+ " | "+time);
		
		
		if (name == "") {
			swal("이름을 입력하세요");
			$(frm.scname).focus();
			return;
		}else if(tel1==""){
			swal("전화번호를 입력하세요");
			$(frm.tel1).focus();
			
		}else if(tel2==""){
			swal("전화번호를 입력하세요");
			$(frm.tel2).focus();
			
		}else if(tel3==""){
			swal("전화번호를 입력하세요");
			$(frm.tel3).focus();
			
		} else if(license==""){
			swal("면허를 입력하세요");
			$(frm.sclicense).focus();
			
		} else if(cate==false){
			swal("종류를 선택하세요");
			
		} else if(address==""){
			swal("주소를 입력하세요");
			
		} else if(sconeline==""){
			swal("업체설명를 입력하세요");
			
		} else if(scdetail_description==""){
			swal("상세설명를 입력하세요");
			
			
		} else {
			if (!confirm("업체수정하실래요?"))
				return;
			

			$(frm.sctel).val(strTel);
			
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