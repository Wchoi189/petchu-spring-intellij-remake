<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link href="/resources/css/request.css" rel="stylesheet">
<div id="page">
	<p class="title"><b>${vo.nick}</b>님 견적서를 작성하세요</p>
	<input type="hidden" value="${vo.id}" id="id">

	<div id="selectPet"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="row">
				<span class="pno" style="display:none">{{pno}}</span>
				<button class="btnpno">{{pname}}</button>
			</div>
		{{/each}}
	</script>
	<p id="nopet"></p>

	<table id="petlist" style="display:none">
		<tr><td class="bigtitle" colspan=4>접 수 증</td></tr>
		<tr>
			<td class="title">아가 이름</td>
			<td id="pname"></td>
		</tr>
		<tr>
			<td class="title" width=70>대 분 류</td>
			<td id="pcate" width=100></td>
			<td class="title" width=60>etc</td>
			<td id="pcate_1" width=70></td>
		</tr>
		<tr>
			<td class="title">품  종</td>
			<td id="pbreed"></td>
		</tr>
		<tr>
			<td class="title">나  이</td>
			<td id="pagee"></td>
		</tr>
		<tr>
			<td class="title">몸 무 게</td>
			<td id="pweight"></td>
		</tr>
		<tr>
			<td class="title">성  별</td>
			<td id="pgender"></td>
			<td class="title">중 성 화</td>
			<td id="pspaying"></td>
		</tr>
	</table>
	<p class="title">반려견 반려묘가 보이는 증상을 체크해주세요</p>
	<form name="frm" method="post" action="/request/send" enctype="multipart/form-data">
		<input type="text" name="pno" style="display: none">
		<div class="diseSelect">
			<input type="checkbox" value=0 name="d1">
			<label for="d1"><span>구토</span></label>
			<input type="checkbox" value=0 name="d2">
			<label for="d2"><span>식욕부진</span></label>
			<input type="checkbox" value=0 name="d3">
			<label for="d3"><span>절뚝거림</span></label>
			<input type="checkbox" value=0 name="d4">
			<label for="d4"><span>변비</span></label>
			<input type="checkbox" value=0 name="d5">
			<label for="d5"><span>털빠짐</span></label>
		</div>
		<p class="title">선택사항에 없거나 설명이 더 필요한 증상에 대해 작성해주세요</p>
		<textarea rows="8" cols="90" name="d_etc"
			placeholder="증상에 대해 설명해주세요"></textarea>
		<p class="title">증상을 촬영한 사진을 첨부해주세요</p>
		<div id="inputfile">
			<button type="button" id="btninputfile">첨 부 하 기</button>
			<span>100MB 이하의 gif, jpg, png 파일만 가능합니다.(최대 4개까지)</span>
			<input type="file" name="uploadFile" id="uploadFile" multiple style="display: none">
			<div id="preview" style="display:none"></div>
		</div>

		<div id="buttons">
			<span id="alert"></span><br>
			<input type="reset" id="reset" value="작성취소">
			<input type="submit" id="sendrequest" value="견적서 요청">
		</div>
	</form>
</div>
<script>
	var id = $("#id").val();
	var pno=0;
	
	//반려동물 선택
	$("#selectPet").on("click", ".row .btnpno", function(){
		var row = $(this).parent();
		 pno = row.find(".pno").html();

		$.ajax({
			type: "get",
			dataType: "json",
			data : {pno:pno},
			url: "/pet/readpet",
			success:function(data){


				
 				$.ajax({
 					type: "get",
					dataType:"json",
					data: {pno:pno},
					url: "/request/regdatechk",
 					success:function(dataa){
 						if(dataa!=""){
 							swal("3일 이내에 같은 반려동물의 견적서를 작성할 수 없습니다.");
 							pno=0;
 							return;
 						}else{
 							$("#petlist").show();
 							$("#pname").html(data.pname);
 							$("#pcate").html(data.pcate);
 							$("#pcate_1").html(data.pcate_1);
 							$("#pbreed").html(data.pbreed);
 							$("#pagee").html(data.page+ "살");
 							$("#pweight").html(data.pweight + "kg"); 
 							$("#pgender").html(data.pgender);
 							$("#pspaying").html(data.pspaying);
 						}
 					}
 				})
				
			}
		})
	})
	
	//반려동물 리스트 출력
	$.ajax({
		type: "get",
		dataType: "json",
		data : {id:id},
		url: "/pet/petlist",
		success:function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#selectPet").html(template(data));
			if(data==""){
				$("#nopet").html("반려동물을 등록하세요");
			}
			
		}
	})



	//리퀘스트 보내기
	$(frm).on("submit", function(e){
		e.preventDefault();
		if($(frm.d1).is(":checked")){
			$(frm.d1).val(1);
		}
		if($(frm.d2).is(":checked")){
			$(frm.d2).val(1);
		}
		if($(frm.d3).is(":checked")){
			$(frm.d3).val(1);
		}
		if($(frm.d4).is(":checked")){
			$(frm.d4).val(1);
		}
		if($(frm.d5).is(":checked")){
			$(frm.d5).val(1);
		}
		
		$(frm.pno).val(pno);

		var d_etc = $(frm.d_etc).val();
		if(d_etc==""){
			$("#alert").html("증상에 대한 설명을 작성해주세요");
			return;
		}
		if(pno==0){
			$("#alert").html("반려동물을 선택해주세요");
			return;
		}
		
		swal({
				title : '',
				text : '요청서를 보내시겠습니까?',
				type : "info",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				confirmButtonColor: "#A7CA37",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					swal({
						title : '',
						text : '',
						type: 'success',
						confirmButtonColor: "#A7CA37",	
						timer:3000
					});
					frm.submit();
				}else{
					swal({
							title : '',
							text : '취소되었습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
						});
				}
			});
		


		
		
	})
	
	//첨부하기 버튼 클릭
	$("#btninputfile").on("click", function(){
		$("#uploadFile").click();
	});

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
</script>