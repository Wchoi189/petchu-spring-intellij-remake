<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>

.middlePrame{
	margin: 10px;
	padding: 10px;
	background-color: A7CA37;
	font-size: 20px;
	font-weight: bold;
	margin-left: 150px;
}
.btnPrame{
	color: navy;
	font-size: 15px;
	cursor: pointer;
}
.smallPrame{
	display: none;
	margin: 10px;
	padding: 10px;
	margin-left: 140px
}
#myList{
	margin-left: 100px;
}
#sidemenu{
	margin-left: -100px;
}
#cke_editor46{
	width: 740px;
}
input[type=text]{

}
input[type=checkbox]{
	width: 20px;
	height: 20px;
}
.button, button, input[type=button], input[type=submit], input[type=reset]{
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
</style>


<div id="page">
	<h1>내 업체목록</h1>
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<div id="myList">
	
		<c:forEach items="${list}" var="vo"  varStatus="roop">
			<div class="bigPrame">
				<div class="middlePrame">
					<p class="scname" style="color: white;">${vo.scname }</p>
					<p class="btnPrame" scno="${vo.scno }" data-scno="${vo.scno}">상세보기</p>
				</div>
			
				<form name="frm"  action="serviceUpdate" method="post" enctype="multipart/form-data">
					<div class="smallPrame" >	
						<table style="width: 740px;">
							
							<tr style="display:none;">
								<td width=150>scno</td>
								<td width=600>
									<input name = "scno" type="text" value="${vo.scno}"readonly>
									<input type="text" class="isDelete" value="${vo.isDelete }">
								</td>
								
							</tr>
							<tr>
								<td width=150>아이디</td>
								<td width=600><input name = "id" type="text" value="${id}"readonly></td>
							</tr>
							<tr>
								<td width=150>업체명</td>
								<td width=600><input name = "scname" type="text" value="${vo.scname }"></td>
							</tr>
								<tr>
								<td width=100>사업자등록번호	</td>
								<td width=600><input name = "sclicense" type="text" value="${vo.sclicense }"></td>
							</tr>
								<tr>
								<td width=100>업체 연락처</td>
								<td width=600>
									<input type="hidden" id="sctel${vo.scno}" class="sctel" name="sctel" value="${vo.sctel}">
									<input type="number" class="sctel1" name="tel1"  style="width: 50px;"> -
									<input type="number" class="sctel2" name="tel2" style="width: 80px;"> -
									<input type="number" class="sctel3" name="tel3" style="width: 80px;">
								</td>
							</tr>
							<tr>
								<td width=100>업체 분류</td>
								<td width=600>
									<select name = "sccate" value="${vo.sccate }">
										<option value="미용" <c:out value="${vo.sccate=='미용' ? 'selected' : ''}"/>>미용</option>
										<option value="홈크리닉" <c:out value="${vo.sccate=='홈크리닉' ? 'selected' : ''}"/>>홈크리닉</option>
										<option value="레슨" <c:out value="${vo.sccate=='레슨' ? 'selected' : ''}"/>>레슨</option>
										<option value="호텔" <c:out value="${vo.sccate=='호텔' ? 'selected' : ''}"/>>호텔</option>
										<option value="유치원" <c:out value="${vo.sccate=='유치원' ? 'selected' : ''}"/>>유치원</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width=100>업체주소</td>
								<td width=600>
									<input type="text" name="sczipcode" size="5" value="${vo.sczipcode }">
									<button type="button" class="search" class="smallbtn">주소검색</button> <br> 
									<input type="text" name="scaddress1" size="50" value="${vo.scaddress1 }">
									<input type="text" name="scaddress2" size="50" value="${vo.scaddress2 }">
								</td>
							</tr>
							<tr>
								<td width=100>영업시간</td>
								<td width=600>
									오픈시간: <input type="text" name="opentime" size="5" value="${vo.opentime }">
									브레이크타임: <input type="text" name="breaktime" size="10" value="${vo.breaktime }">
									마감시간: <input type="text" name="closetime" size="5" value="${vo.closetime }">
								</td>
							</tr>
							<tr>
								<td width=100>서비스 최저가</td>
								<td width=600>
									<input type="number" name="scprice" size="20" value="${vo.scprice }">원
								</td>
							</tr>
							<tr>
								<td width=100 >업체이미지</td>
								<td width=500>
									<input type="file" name="file" id="file"  accept="image/*" style="display:none" value="${vo.scimage }">
									<img id="image" width=100 style="display:none">			
									<input type="button" id="btnFile" value="사진등록">		
								</td>
							</tr>
							<tr>
								<td width=100 >백그라운드</td>
								<td width=500>
									<input type="file" name="backfile" id="backfile"  accept="image/*" style="display:none" value="${vo.bgimage }">
									<img id="backimage" width=640 height="200" style="display:none">
									<input type="button" id="btnBackFile" value="사진등록">						
								</td>
							</tr>
							<tr>
								<td width=100>한줄소개</td>
								<td width=600>
									<input type="text" name="sconeline" size="50" value="${vo.sconeline }">
								</td>
							<tr>
							<td width=100>태그</td>
							<td width=600> 
								<input type="hidden" class="strTag" value="${vo.tag }">
								<input type="checkbox" class="tag" name="tag" value="#산책 ">#산책 
								<input type="checkbox" class="tag" name="tag" value="#야외놀이터 ">#야외놀이터 
								<input type="checkbox" class="tag" name="tag" value="#펫수영장 ">#펫수영장 
								<input type="checkbox" class="tag" name="tag" value="#종일반 ">#종일반 
								<input type="checkbox" class="tag" name="tag" value="#1박2일" >#1박2일 
								<input type="checkbox" class="tag" name="tag" value="#2박3일 ">#2박3일 
								<input type="checkbox" class="tag" name="tag" value="#3박4일 ">#3박4일 
								<input type="checkbox" class="tag" name="tag" value="#4박5일 ">#4박5일 
								<input type="checkbox" class="tag" name="tag" value="#장박 ">#장박 
								<input type="checkbox" class="tag" name="tag" value="#단독실 ">#단독실 
								<input type="checkbox" class="tag" name="tag" value="#대형 ">#대형 
								<input type="checkbox" class="tag" name="tag" value="#중형 ">#중형 
								<input type="checkbox" class="tag" name="tag" value="#소형 ">#소형 
								<input type="checkbox" class="tag" name="tag" value="#수의사 ">#수의사 
								<input type="checkbox" class="tag" name="tag" value="#cctv ">#cctv 
								<input type="checkbox" class="tag" name="tag" value="#애견훈련 ">#애견훈련 
								<input type="checkbox" class="tag" name="tag" value="#애견카페 ">#애견카페 
								<input type="checkbox" class="tag" name="tag" value="#픽업 ">#픽업 
								<input type="checkbox" class="tag" name="tag" value="#당일 입실">#당일 입실
								<input type="checkbox"class="tag"  name="tag" value="#위생관리 ">#위생관리 
								<input type="checkbox" class="tag" name="tag" value="#목욕 ">#목욕 
								 
								<input type="checkbox" class="tag" name="tag" value="#서울특별시 ">#서울특별시 
								<input type="checkbox" class="tag" name="tag" value="#인천광역시 ">#인천광역시 
								<input type="checkbox" class="tag" name="tag" value="#경기도">#경기도
							</td>
							</tr>
					
						</table>
						<div style="margin-top:20px;">
							<textarea id="editor${vo.scno}" class="ckeditor-area" rows="100" cols="60" name="scdetail_description">${vo.scdetail_description}</textarea>
						</div>
						<div id="button">
							<input class="submit" type="submit" value="수정하기"/>
							<input class="reset" type="reset" value="수정취소"/>
							<!-- <a href="/hoschool/servicedelete?scno=${vo.scno }">--><input class="delete" type="button" value="삭제"/>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>
</div>
	

<script>
$(function(){
	var isDelete=$(".bigPrame").find(".smallPrame").find(".isDelete");
	isDelete.each(function(){
		var del=$(this).val();
		if(del==1){
			var target = $(this).closest('.bigPrame');
			console.log(target)
			target.hide();
		}
	});
	
});


//삭제버튼

$(".delete").on("click",function(e){
	var scno=$(this).closest('.bigPrame').find(".middlePrame").find(".btnPrame").attr("scno");
	e.preventDefault();
	if(!confirm("삭제합니다")) return;
	$.ajax({
		type:"post",
		url:"/hoschool/servicedelete",
		data:{scno:scno},
		success:function(){
			swal({
				  icon: "success",
				});
			alert("삭제완료 ");
			
			location.reload(true);
		}
		
	});
})

//버튼클릭시 파일열기
$("#btnFile").on("click", function(){
	$("#file").click();
});
$("#btnBackFile").on("click", function(){
	$("#backfile").click();
});

//image file select
$(frm.file).on("change",function(e){
	var file=$(frm.file)[0].files[0];
	$("#image").attr("src",URL.createObjectURL(file));
	if($("#image").css("display")=="none"){
		$("#image").show();
		$(frm.file).hide();
		$("#btnFile").hide();
	}
});
//back image select
$(frm.backfile).on("change",function(e){
	var file=$(frm.backfile)[0].files[0];
	$("#backimage").attr("src",URL.createObjectURL(file));
	if($("#backimage").css("display")=="none"){
		$("#backimage").show();
		$(frm.backfile).hide();
		$("#btnBackFile").hide();
	}
});

//image click file
$("#image").on("click", function(){
	$(frm.file).click();
});

//back image click file
$("#backimage").on("click", function(){
	$(frm.backfile).click();
});

//address search
$(".search").on("click", function() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				$(frm.scaddress1).val(data.address);
				$(frm.sczipcode).val(data.zonecode);
				$(frm.scaddress2).focus();
			}
		}).open();
	});

	//섭밋될 때
	$(".submit").on("submit", function(e){
		e.preventDefault();
		if(!confirm("수정하실래요? ")) return;
		//3개의 전화번호 텍스트박스를 병합하여 섭밋
		var strTel1= $(frm.tel1).val();
		var strTel2= $(frm.tel2).val();
		var strTel3= $(frm.tel3).val();
		
		var strTel=strTel1+strTel2+strTel3;

	});
	

	//상세보기 클릭했을 때
	   $(".middlePrame").on("click",".btnPrame", function(){
	      var target = $(this).closest('.bigPrame').find('.smallPrame');
//	       target.toggleClass("hidden")
	      if(target.css("display") == "none"){
	         target.show();
	      }else {
	         target.hide();
	      }
	      
	    
	     
	      
	      
	      var strTag=$(this).closest(".bigprame").find(".smallPrame").find(".strTag").val();   //DB의 저장된 tag값을 찾음(얘가 가지고있는 시설물,체크박스에 체크할 대상)
	      var haveTag=[]                                          //실제 가지고있는 시설물을 스플릿하여 넣기위한 배열 변수선언
	      haveTag = strTag.split(",");                                 //실제 가지고있는 시설물을 스플릿하여 배열 변수에 넣음
	      haveTagLength = haveTag.length;                                       //실제 가지고있는 시설물을 반복 비교하기 위해 갯수를 확인하여 leng변수에 넣음
	      
	      var allTag = $(this).parent().parent().find(".smallPrame").find(".tag");   //클래스 "태그"를 찾음 (전체 시설물 체크박스 값)
	      allTag.each(function(){                                       //클래스 태그 반복

	         for(var i=0; i < haveTagLength; i++){                                 
	            var strTag = haveTag[i];                              
	            var allTag= $(this).val();                              //this는 모든태그 체크박스 
// 				console.log("strTag:"+strTag);
// 				console.log("allTag:"+allTag);
	            if(allTag==strTag){
	               $(this).prop("checked",true);

	            }
	         }
			
	      });
	      
	      
	      //전화번호 잘라서 3개 텍스트박스에 출력
	      var strTel = $(this).closest(".bigprame").find(".smallPrame").find(".sctel").val();

	      var tel1=strTel.substring(0,3);
	      var tel2=strTel.substring(3,7);
	      var tel3=strTel.substring(7,11);
	   
	      $(".sctel1").val(tel1);
	      $(".sctel2").val(tel2);
	      $(".sctel3").val(tel3);
	      });
	
	//ckEditor출력
	var ckeditor_config = {
		 resize_enable : false, //editor 사이즈를 변경하지 못한다. 
		 enterMode : CKEDITOR.ENTER_BR, 
		 shiftEnterMode : CKEDITOR.ENTER_P, 
		 filebrowserUploadUrl : "/ckupload", 
		 height: 300
	 };
	$('.ckeditor-area').each(function(){
		CKEDITOR.replace($(this).prop('id'), ckeditor_config)
	});
	//CKEDITOR.replace('editor', ckeditor_config)
 
</script>