<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<div id="page">
	<h1>상품 상세정보</h1>
	<form name="frm" action="adminUpdate" method="post" encType="multipart/form-data">
		<table>
			<tr>
				<td class="title" width=100>상품코드</td>
				<td width=500>
					<input value="${vo.pno}" type="text" name="pno" size=5 readOnly/>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>상품수량</td>
				<td width=500>
					<input value="${vo.pqantity}" type="text" name="pqantity" size=5/>
					<input type="checkbox" name="quan" <c:out value="${vo.pqantity == 0 ? 'checked' : ''}"></c:out>/>품절상태
				</td>
			</tr>
			<tr>
				<td class="title" width=100>상품이름</td>
				<td width=500><input value="${vo.pname}" type="text" name="pname" size=80></td>
			</tr>
			<tr>
				<td class="title" width=100>상품가격</td>
				<td width=500><input value="${vo.pprice}" type="text" name="pprice" size=50>원</td>
			</tr>
			<tr>
				<td class="title" width=100>브랜드</td>
				<td width=500><input value="${vo.pbrand}" type="text" name="pbrand" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>메이커</td>
				<td width=500><input value="${vo.pmaker}" type="text" name="pmaker" size=50></td>
				
			</tr>
			<tr>
				<td class="title" width=100>소분류</td>
				<td width=500><input value="${vo.pcate3}" type="text" name="pcate3" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>세부분류</td>
				<td width=500><input value="${vo.pcate4}" type="text" name="pcate4" size=50></td>
			</tr>
			<tr>
				<td class="title" width=100>상품이미지</td>
				<td width=500>
					<img id="image" src="${vo.pimage}" width=200>
					<!-- 파일등록
					<input type="file" name="file" accept="image/*" style="display: none;">
					<input type="hidden" value="${vo.pimage}" name="pimage"/>
					 -->
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<textarea id="editor" rows="100" cols="80" name="pcontents">${vo.pcontents}</textarea>
		</div>
			<div id="button">
				<input class="button" type="submit" value="상품수정"/>
				<input class="button" type="reset" value="수정취소"/>
				<input class="button" type="button" onClick="location.href='/product/list'" value="목록이동"/>
			</div>
	</form>	
</div>

<script>

//ckEditor출력
var ckeditor_config = {
	 resize_enable : false, //editor 사이즈를 변경하지 못한다. 
	 enterMode : CKEDITOR.ENTER_BR, 
	 shiftEnterMode : CKEDITOR.ENTER_P, 
	 filebrowserUploadUrl : "/ckupload", 
	 height: 300
 };
	CKEDITOR.replace('editor', ckeditor_config)
 
//섭밋될때
$(frm).on("submit", function(e){
	e.preventDefault();
	var pname= $(frm.pname).val();
	var pprice= $(frm.pprice).val();

	
	if(pname=="") {
		alert("상품명을 입력하세요!");
		$(frm.pname).focus();
		return;
	}else if(pprice=="" || pprice.replace(/[0-9]/g,'')){
		alert("가격을 숫자로 입력하세요");
		$(frm.pprice).focus();
		return;
	}
	if(!confirm("상품을 수정하실래요?")) return;
	frm.submit();
});
/*
//이미지 미리보기
$(frm.file).on("change",function(){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src", URL.createObjectURL(file));
});

//이미지를 클릭한 경우
$("#image").on("click", function(){
	$(frm.file).click();
});
*/
</script>