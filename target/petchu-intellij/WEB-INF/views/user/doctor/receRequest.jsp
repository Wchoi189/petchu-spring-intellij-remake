<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/request.css" rel="stylesheet" > 
<div id="pagee" class="receRequest">
	<div id="request">
		<input style="display:none" value="${hospital}" id="dno"></input>
		<p class="title"><b>${vo.nick}</b>님이 보내주신 견적서</p>
		<input type="hidden" value="${vo.id}" id="id">
	
		<table id="petlist">
			<tr><td class="bigtitle" colspan=4>접 수 증</td></tr>
			<tr>
				<td class="title">아가 이름</td>
				<td>${vo.pname}</td>
			</tr>
			<tr>
				<td class="title" width=70>대 분 류</td>
				<td width=100>${vo.pcate}</td>
				<td class="title" width=60>etc</td>
				<td width=70>${vo.pcate_1}</td>
			</tr>
			<tr>
				<td class="title">품  종</td>
				<td>${vo.pbreed}</td>
			</tr>
			<tr>
				<td class="title">나  이</td>
				<td>${vo.page}</td>
			</tr>
			<tr>
				<td class="title">몸 무 게</td>
				<td>${vo.pweight}</td>
			</tr>
			<tr>
				<td class="title">성  별</td>
				<td>${vo.pgender}</td>
				<td class="title">중 성 화</td>
				<td>${vo.pspaying}</td>
			</tr>
		</table>
		
		<div class="diseSelect">
			<p class="title">증상</p>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d1}">checked</c:if>>
			<label for="d_1"><span>구토</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d2}">checked</c:if>>
			<label for="d_2"><span>식욕부진</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d3}">checked</c:if>>
			<label for="d_3"><span>절뚝거림</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d4}">checked</c:if>>
			<label for="d_4"><span>변비</span></label>
			<input type="checkbox" name="disease" onClick="return false;" <c:if test="${vo.d5}">checked</c:if>>
			<label for="d_5"><span>털빠짐</span></label>
		</div>
		<p class="title d_etc">상세 증상</p>
		<p id="d_etc">${vo.d_etc}</p>
		<p class="title">첨부사진</p>
		<div id="dimgbox">
			<c:if test="${vo.dimg1!=null}">
				<img src="/display?fileName=${vo.dimg1}"/>
			</c:if>
			<c:if test="${vo.dimg2!=null}">
				<img src="/display?fileName=${vo.dimg2}"/>
			</c:if>
			<c:if test="${vo.dimg3!=null}">
				<img src="/display?fileName=${vo.dimg3}"/>
			</c:if>
			<c:if test="${vo.dimg4!=null}">
				<img src="/display?fileName=${vo.dimg4}"/>
			</c:if>
		</div>
	</div>
	<hr>
	<form name="frm" action="/doctor/replyRequest" method="post" enctype="multipart/form-data">
		<p class="title">진단명</p>
		<input type="text" name="pno" value="${vo.pno}" style="display:none">
		<input type="text" name="dno" value="${hospital}" style="display:none">
		<input type="text" name="drdisease">
		<p class="title">설명</p>
		<textarea name="drcontent" rows="5" cols="80"></textarea><br>
		<!-- <input type="file" name="file" style="display:none"><br>
		<button type="button" id="btninputfile">첨 부 하 기</button><br> -->
		<div class="rece" id="inputfile">
			<button type="button" id="btninputfile">첨 부 하 기</button>
			<span>100MB 이하의 gif, jpg, png 파일만 가능합니다.</span>
			<input type="file" name="file" style="display:none">
			<div id="preview" style="display:none"></div>
		</div>
		<span class="title" style="float:right">예상청구금액
		<input type="number" name="drprice"></span>
	
		<div id="buttons2">
			<span id="alert"></span><br>
			<input type="button" id="pass" value="보류">
			<input type="submit" id="sendrequest" value="견적서 보내기">
		</div>
	</form>
	
</div>
<script>
	var rno = "${vo.rno}";
	$("#btninputfile").on("click", function(){
		$(frm.file).click();
	})
	 var fileCount = 0;
    var totalCount = 4;
    var fileNum = 0;
    var arr=new Array();
    
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      arr =Array.prototype.slice.call(files);

      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      if(fileCount + arr.length> totalCount){
    	  swal("파일은 " + totalCount + "개까지 업로드할 수 있습니다.");
    	  return;
      }else{
    	  fileCount = fileCount + arr.length;
      }
      $('#preview').show();
      preview(arr);
     
    });//file change
    
    function checkExtension(fileName,fileSize){
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      var fileEx = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
      
      if(fileEx!="png" && fileEx!="jpg" && fileEx!="gif"){
    	  alert("등록가능한 형식이 아닙니다.");
    	  return false;
      }
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;">';
       
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '<p>'+fileName+'</p>';
            str += '</div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
	$("#pass").on("click", function(){
		/* $.ajax({
			type: "post",
			url: "/doctor/ischecked",
			data: {rno:rno},
			success:function(){
				swal("보류되었습니다.");
				location.href="/request/list";
			}
		}) */
	})

	$(frm).on("submit", function(e){
		e.preventDefault();
		var drdisease = $(frm.drdisease).val();
		var drcontent = $(frm.drcontent).val();
		var drprice = $(frm.drprice).val();

		if(drdisease==""){
			swal("진단명을 입력하세요");
			$(frm.drdisease).focus();
			return;
		}else if(drcontent==""){
			swal("설명을 입력하세요");
			$(frm.drcontent).focus();
			return;
		}else if(drprice=="" || isNaN(drprice)){
			swal("예상청구금액을 입력하세요");
			$(frm.drprice).focus();
			return;
		}else{
// 			$.ajax({
// 				type: "post",
// 				url: "/doctor/ischecked",
// 				data: {rno:rno},
// 				success:function(){
					
// 				}
// 			})
			frm.submit();
		}
	})
</script>