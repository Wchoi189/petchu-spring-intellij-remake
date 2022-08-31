<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

<style>
input[type=checkbox]{
	width: 20px;
	height: 20px;
}
#cke_editor{
	margin-left: 180px;
}
#button{
	margin: 30px;
	margin-left: 460px;
}
.button, button, input[type=button]{
	border: none;
    padding: 8px 12px 8px 12px;
    background-color: A7CA37;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 900px;
    color: white;
    cursor: pointer;
}
input[type=text],input[type=number],select{
	height: 35px;
	margin: 5px;
	border-radius:5px;
	border: 0.5px solid gray;
}
#page{
	text-align: center;
	margin: 0px auto;
}
#cke_editor{
	width: 800px;
	margin-left: 150px;
	margin-bottom: 30px;
}
#sidemenu{
	margin-left: -100px;
}
</style>


<div id="page">
	
	<h1>업체 등록</h1>
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<form name="frm"  action="serviceInsert" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<td width=150>아이디</td>
				<td width=600><input name = "id" type="text" value="${id}" readonly></td>
			</tr>
			<tr>
				<td width=150>업체명</td>
				<td width=600><input name = "scname" type="text"></td>
			</tr>
				<tr>
				<td width=100>사업자등록번호	</td>
				<td width=600><input name = "sclicense" type="text"></td>
			</tr>
				<tr>
				<td width=100>업체 연락처</td>
				<td width=600>
					<input type="hidden" name="sctel">
					<input type="number" id="sctel1" name="tel1" placeholder="010" style="width: 50px;"> -
					<input type="number" id="sctel2" placeholder="1234" style="width: 80px;"> -
					<input type="number" id="sctel3" placeholder="1234" style="width: 80px;">
				</td>
			</tr>
			<tr>
				<td width=100>업체 분류</td>
				<td width=600>
					<select name = "sccate">
						<option value="미용">미용</option>
						<option value="홈클리닉">홈클리닉</option>
						<option value="레슨">레슨</option>
						<option value="호텔">호텔</option>
						<option value="유치원">유치원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width=100>업체주소</td>
				<td width=600>
					<input type="text" name="sczipcode" size="5">
					<button type="button" id="search" class="smallbtn">주소검색</button> <br> 
					<input type="text" name="scaddress1" size="50">
					<input type="text" name="scaddress2" size="50">
				</td>
			</tr>
			<tr>
				<td width=100>영업시간</td>
				<td width=600>
					오픈시간: <input type="text" name="opentime" size="5" value="오전 9시">
					브레이크타임: <input type="text" name="breaktime" size="10" value="오후 12시~1시">
					마감시간: <input type="text" name="closetime" size="5" value="오후 8시">
				</td>
			</tr>
			<tr>
				<td width=100>서비스 최저가</td>
				<td width=600>
					<input type="number" name="scprice" size="20" placeholder="숫자로만 입력하세요">원
				</td>
			</tr>
			<tr>
				<td width=100 >업체이미지</td>
				<td width=500>
					<input type="file" name="file"  accept="image/*" style="display:none">
					<img id="image" width=100 style="display:none">			
					<input type="button" id="btnFile" value="사진등록">	
				</td>
			</tr>
			<tr>
				<td width=100 >백그라운드</td>
				<td width=500>
					<input type="file" name="backfile"  accept="image/*" style="display:none">
					<img id="backimage" width=640 height="200" style="display:none">		
					<input type="button" id="btnBackFile" value="사진등록">		
				</td>
			</tr>
			<tr>
				<td width=100>한줄소개</td>
				<td width=600>
					<input type="text" name="sconeline" size="50" placeholder="업체를 한줄로 소개 해주세요">
				</td>
			</tr>
			<tr>
				<td width=100>태그</td>
				<td width=600> 
					<input type="checkbox" name="tag" value="#산책 ">#산책 
					<input type="checkbox" name="tag" value="#야외놀이터 ">#야외놀이터 
					<input type="checkbox" name="tag" value="#펫수영장 ">#펫수영장 
					<input type="checkbox" name="tag" value="#종일반 ">#종일반 
					<input type="checkbox" name="tag" value="#1박2일" >#1박2일 
					<input type="checkbox" name="tag" value="#2박3일 ">#2박3일 
					<input type="checkbox" name="tag" value="#3박4일 ">#3박4일 
					<input type="checkbox" name="tag" value="#4박5일 ">#4박5일 
					<input type="checkbox" name="tag" value="#장박 ">#장박 
					<input type="checkbox" name="tag" value="#단독실 ">#단독실 
					<input type="checkbox" name="tag" value="#대형 ">#대형 
					<input type="checkbox" name="tag" value="#중형 ">#중형 
					<input type="checkbox" name="tag" value="#소형 ">#소형 
					<input type="checkbox" name="tag" value="#수의사 ">#수의사 
					<input type="checkbox" name="tag" value="#cctv ">#cctv 
					
					<input type="checkbox" name="tag" value="#애견훈련 ">#애견훈련 
					<input type="checkbox" name="tag" value="#애견카페 ">#애견카페 
					<input type="checkbox" name="tag" value="#픽업 ">#픽업 
					<input type="checkbox" name="tag" value="#당일 입실">#당일 입실
					<input type="checkbox" name="tag" value="#위생관리 ">#위생관리 
					<input type="checkbox" name="tag" value="#목욕 ">#목욕 
						 
					<input type="checkbox" name="tag" value="#서울특별시 ">#서울특별시 
					<input type="checkbox" name="tag" value="#인천광역시 ">#인천광역시 
					<input type="checkbox" name="tag" value="#경기도">#경기도
				</td>
			</tr>
			
		</table>
		<div style="margin-top:20px; margin-left: 30px;">
			<textarea id="editor" rows="100" cols="60" name="scdetail_description" >상세설명을 입력해 주세요</textarea>
		</div>
		<div id="button">
			<input class="button" type="submit" value="업체 등록"/>
			<input class="button" type="reset" value="등록 취소"/>
		</div>
	</form>
</div>

<script>
	//섭밋버튼을 클릭한 경우
	$(frm).on("submit",function(e){
		e.preventDefault();
		var scname=$(frm.scname).val();
		var strTel1= $(frm.sctel1).val();
		var strTel2= $(frm.sctel2).val();
		var strTel3= $(frm.sctel3).val();
		var sclicense = $(frm.sclicense).val();
		var sccate=$(frm.sccate).val();
		var file = $(frm.file).val();
		var backfile = $(frm.backfile).val();
		var sconeline = $(frm.sconeline).val();
		var sczipcode= $(frm.sczipcode).val();
		var scaddress1= $(frm.scaddress1).val();
		var scaddress2= $(frm.scaddress2).val();
		
		if(scname==""){
			swal('업체명을 입력 해주세요')
			$(frm.scname).focus();
			return;
		}else if(strTel1=="" || strTel2==""|| strTel3=="") {
			swal('전화번호를 입력 해주세요')
			$(frm.sctel1).focus();
			return;
		}else if(sclicense=="") {
			swal('사업자번호를 입력 해주세요')
			$(frm.sclicense).focus();
			return;
		}else if(file=="") {
			swal('업체 이미지를 등록 해주세요')
			return;
		}else if(backfile=="") {
			swal('업체 백그라운드 이미지를 등록 해주세요')
			return;
		}else if(sconeline=="") {
			swal('한줄메세지를 등록 해 주세요')
			$(frm.sconeline).focus();
			return;
		}else if(sczipcode == "" || scaddress1 == "" || scaddress2 == ""){
			swal('주소지를 등록 해 주세요')
			
		}else{
			if(!confirm(scname+" 을(를) "+sccate+" 로 등록 하실래요? ")) return;
			
			//3개의 전화번호 텍스트박스를 병합하여 섭밋
				var strTel=strTel1+strTel2+strTel3;
				
				$(frm.sctel).val(strTel);
	
				frm.submit();
			}
		});
		
		
	//이미지 파일 선택시
	$(frm.file).on("change", function(e){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
		if($("#image").css("display") == "none"){
			$("#image").show();
			$(frm.file).hide();
			$("#btnFile").hide();
		}
	});
	//백그라운드이미지 파일 선택시
	$(frm.backfile).on("change", function(e){
		var file=$(frm.backfile)[0].files[0];
		$("#backimage").attr("src", URL.createObjectURL(file));
		if($("#backimage").css("display") == "none"){
			$("#backimage").show();
			$(frm.backfile).hide();
			$("#btnBackFile").hide();
		}
	});
	//버튼클릭시 파일열기
	$("#btnFile").on("click", function(){
		$(frm.file).click();
	});
	$("#btnBackFile").on("click", function(){
		$(frm.backfile).click();
	});
	//이미지 클릭시 파일열기
	$("#image").on("click", function(){
		$(frm.file).click();
	});
	//백그라운드 이미지 클릭시 파일열기
	$("#backimage").on("click", function(){
		$(frm.backfile).click();
	});
	//ckEditor출력
	var ckeditor_config = {
		 resize_enable : false, //editor 사이즈를 변경하지 못한다. 
		 enterMode : CKEDITOR.ENTER_BR, 
		 shiftEnterMode : CKEDITOR.ENTER_P, 
		 filebrowserUploadUrl : "/ckupload", 
		 height: 300
	};
	CKEDITOR.replace('editor', ckeditor_config)
	
	//주소검색 버튼을 클릭한 경우
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
</script>


