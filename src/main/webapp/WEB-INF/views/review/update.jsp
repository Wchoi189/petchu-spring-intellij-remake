<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<link href="/resources/css/insert.css" rel="stylesheet"/>
	<link rel="shortcut icon" href="#">
	<script src="https://kit.fontawesome.com/21038295a9.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
</head>
	<div id="page">
	  <form name="frm" method="post" enctype="multipart/form-data">
	  
	  <div class="insert_page">
	   <div class="page_title">
				<h2>REVIEW</h2>
			</div>
	     <div class="page_info"><!--helpcount까지-->
	        <div class="inin_page"><!--한줄요약까지-->
	          <div class="r_q">
	          <h3>상품품질리뷰</h3>
	          <p>상품에 대해서 얼마나 만족하시나요?</p>
	          </div><!--r_q--> 
	         <div class="p_info">
	            <div class="rid">
	         		<div id="rid" style="display:none;">${vo.rid}</div>
	         		
	         	</div>
	           <div id="p_img">
							 <img src="${vo.pimage}" width=200 height=200/>
						</div>
	           <div class="p_ns">
	             <div id="pname">
	               <div>${vo.pname}</div>
	             </div>
	             <div class="star">
	              <div class="make_star">
	              <input type="hidden" value="${vo.star}" style="dispaly:hidden;">
	               	<select id="makeStar" name="star" >
						<option  value="0" <c:out value="${vo.star=='0' ? 'selected' : ''}"/>>0</option>
						<option  value="1" <c:out value="${vo.star=='1' ? 'selected' : ''}"/>>1</option>				
						<option  value="2" <c:out value="${vo.star=='2' ? 'selected' : ''}"/>>2</option>
						<option  value="3" <c:out value="${vo.star=='3' ? 'selected' : ''}"/>>3</option>
						<option  value="4" <c:out value="${vo.star=='4' ? 'selected' : ''}"/>>4</option>
						<option  value="5" <c:out value="${vo.star=='5' ? 'selected' : ''}"/>>5</option>
					</select>
					
						<br/>
		               	<div class="rate" style="display:inline;">
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i> &nbsp;
							<div style="display :inline" id="evaluation"></div>
						</div> 
	              </div>
	             </div>
	           </div><!--p_ns-->
	          </div>
	          <div class="review_e">
	            <div class="d_review">
	              <h2>상세리뷰<h2>
	            </div>
	            <div class="textarea">
	              <textarea name="review" rows="10" cols="80"
						placeholder="리뷰는 10자 이상 작성부탁드립니다">${vo.review}</textarea>
						</div>
	          </div>
	          <div class="r_photo">
	            <div class="photo_a">
	              <p>사진첨부</p>
	            </div>
	            <div class="box1"></div>
	            <div class="file">
	            	<button type="button" id="btn_file">사진첨부</button>
	            	<input type="file" name="uploadFile" id="uploadFile" multiple style="display:none;">
	            	<div id="preview" style="display:none"></div>
	            </div>
	          </div>
	          <div class="rtitle">
	            <div><p>한줄요약</p></div>
	            <div id="rtitle">
	              <div class="textarea">
	                <textarea name="rtitle" rows="3" cols="80"
						placeholder="한 줄 요약을 입력해주세요">${vo.rtitle}</textarea>
	              </div>
	            </div>
	          </div><!--rtitle-->
	         </div><!--inin_page-->
	            <div class="h_info">
	              <div class="satis"><p>만족도</p></div>
	              <div>
	              </div>
	            </div>
	        </div><!--page_info-->
	          <div id="button">
	            <input class="button" type="reset" value="등록취소">
	            <div class="box"></div>
	             <input class="button" type="submit" value="리뷰등록">
	          </div>
	      </div><!--insert_page-->
	    </form>
  </div>
<script>
	//별점
	/* var rating = $('.rating');
	
	
	rating.each(function(){ 
		var tagetscore = $(this).attr('data-rate');
		console.log(tagetscore);
		$(this).find('.fa-solid').css({color:'#D3D3D3'});
		$(this).find('.fa-solid:nth-child(-n+' + tagetscore + ')').css({color:'#F08d28'});
	}); */

	
	var userScore = $('#makeStar');
	userScore.change(function(){
		var userScoreNum = $(this).val();
		switch(userScoreNum){
		case "1":
			$("#evaluation").html("별로에요");
			break;
		case "2":
			$("#evaluation").html("조금 별로에요");
			break;
		case "3":
			$("#evaluation").html("보통이에요");
			break;
		case "4":
			$("#evaluation").html("좋아요");
			break;
		case "5":
			$("#evaluation").html("아주 좋아요");
			break;
	}
		$('.make_star .fa-solid').css({color:'#D3D3D3'})
		$('.make_star .fa-solid:nth-child(-n+' + userScoreNum + ')').css({color:'#F08d28'});
	});
	
	$('.make_star .fa-solid').click(function(){
		var targetNum = $(this).index()+1;
		$('#makeStar').val(targetNum);
		switch(targetNum){
		case 1:
			$("#evaluation").html("별로에요");
			break;
		case 2:
			$("#evaluation").html("조금 별로에요");
			break;
		case 3:
			$("#evaluation").html("보통이에요");
			break;
		case 4:
			$("#evaluation").html("좋아요");
			break;
		case 5:
			$("#evaluation").html("아주 좋아요");
			break;
	}
		
		$('.make_star .fa-solid').css({color:'#D3D3D3'})
		$('.make_star .fa-solid:nth-child(-n+' + targetNum + ')').css({color:'#F08d28'});
		
	});
	
	//사진첨부 버튼클릭
	$("#btn_file").on("click", function(){
		$("#uploadFile").click();
	});
	
	var fileCount = 0;
    var fileNum = 0;
    var arr=new Array();
	
	$(document).ready(function(e){
		$("input[type='file']").change(function(e){
			
			//div 내용 비워주기
			if(file == null){
				$('#preview').empty();
			}
			var files = e.target.files;
		      arr =Array.prototype.slice.call(files);
			
			//업로드 가능 파일인지 체크
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name,files[i].size)){
				return false;
				}	
			}
			$("#preview").show();
			preview(arr);
			
		});//filechange
		
			
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
					
					//파일명이 길면 파일명 ...으로 처리
					var fileName = f.name;
					if(fileName.length > 10){
						fileName = fileName.substring(0,7)+"..";
					
				}
					//div에 이미지 추가
					var str = '<div style = "display: inline-flex; padding : 10px;">'
					
					//이미지 파일 미리보기
					if(f.type.match('image.*')){  //파일을 읽기 위한 FileReader객체 생성
						var reader = new FileReader(); //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
						reader.onload = function(e){
							str +='<img src="'+e.target.result + '" title ="'+f.name+'" width=200 height=200/>';
							str +='<p>' + fileName+'</p>';
							str += '</div>';
							$(str).appendTo('#preview');
						}
						reader.readAsDataURL(f);
					}else{
						str += '<img src ="/resources/img/fileImg.png" title"'+f.name+'" width=100 height=100 />';
						$(str).appendTo("#preview");
					}
				}); 
			}
	});
	
	//submit 버튼을 클릭한 경우
	$(frm).on("submit", function(e){
		e.preventDefault();
		var review=$(frm.review).val();
		var rtitle=$(frm.rtitle).val();
		var star = $(frm.makeStar).val();
		alert(star);
		//var file = $(frm.uploadFile).val();


		
		
		if(review==""){
			alert("리뷰를 입력해주세요");
			$(frm.review).focus();
			return;
		}
		else if(rtitle ==""){
			alert("한줄요약을 입력해주세요");
			$(frm.rtitle).focus();
			return;
		}
		
		if(!confirm("리뷰를 수정하실래요?")) return;
		alert(star);
		frm.submit();
		alert("수정완료");
		

	});
	
	
	
	
	
</script>