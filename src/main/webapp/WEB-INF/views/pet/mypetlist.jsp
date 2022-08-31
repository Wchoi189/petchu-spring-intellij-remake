<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link href="/resources/css/mypage.css" rel="stylesheet" > 

<style>
	h1{
		margin-left: 250px;
	}
	#slider-div{
		margin-left: 200px;
	}
	.naming{
		text-align: center;
	}
	#petcontent{
		margin-left: 305px;
	}
	#btnCombi{
		margin-left: 627px;
	}
	#nameBox{
	margin: 23px;
	margin-top: 35px;
	}
</style>

<div id="page">
	<h1>마이펫 리스트</h1>
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<div id="box">
		<form name="frm">
			<div style="padding:50px; width:960px; height:300px; background-color:white; margin-top: -100px;">
			    <div id="slider-div">
				
					<c:forEach items="${list}" var="vo">
						<div class="myPetBox" >
							<c:if test="${vo.pimage != null}">
								<img src="/display?fileName=${vo.pimage}" width=227 height="190">
							</c:if>
							<c:if test="${vo.pimage == null}">
								<div id="nameBox"><p class="naming" width=150>${vo.pname}</p></div>
							</c:if>
							<div id="viewdiv"><button class="view" pno="${vo.pno}">상세보기</button></div>
						</div>
					</c:forEach>
				</div>
			</div>
		</form>
	</div>
<div id="petcontent" style="display:none">
<table id="tbl" ></table>
	<script id="temp" type="text/x-handlebars-template">
	
		<tr pno={{pno}}>
			<td width=100>pno</td>
			<td width=500 class="pno">
				<p class="trans">{{pno}}</p>
				<input type="text" class="change" id="pno" value="{{pno}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>이름</td>
			<td width=500 class="pname">
				<p class="trans centerName">{{pname}}</p>
				<input type="text" class="change" id="pname" value="{{pname}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>종류</td>
			<td width=500 class="pcate">
				<p class="trans">{{pcate}}</p>
				<input type="text" class="change" id="pcate" value="{{pcate}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>품종</td>
			<td width=500 class="pbreed">
				<p class="trans">{{pbreed}}</p>
				<input type="text" class="change" id="pbreed" value="{{pbreed}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>나이</td>
			<td width=500 class="page">
				<p class="trans">{{page}}</p>
				<input type="text" class="change"  id="petage" value="{{page}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>성별</td>
			<td width=500 class="pgender">
				<p class="trans">{{pgender}}</p>
				<span class="change" style="display:none" pgender={{pgender}}>
					<input type="radio" class="gender" id="pgender" value="남">남
					<input type="radio" class="gender" id="pgender" value="여">여
				</span>
			</td>
		</tr>
		<tr>
			<td width=100>몸무게</td>
			<td width=500 class="pweight">
				<p class="trans">{{pweight}}</p>
				<input type="text" class="change" id="pweight" value="{{pweight}}" style="display:none">
			</td>
		</tr>
		<tr>
			<td width=100>중성화여부</td>
			<td width=500 class="pspaying">
				<p class="trans">{{pspaying}}</p>
				<span class="change" style="display:none" pspaying={{pspaying}}>
					<select class=pspaying1>
						<option value="Y" class="spaying">함</option>
						<option value="N" class="spaying">안함</option>
					</select>
				</span>
			</td>
		</tr>
		<tr class="change" style="display:none;">
			<td width=100 >사진</td>
			<td width=500>
				<input type="file" id="file" style="display:none" accept="image/*">
				<img id="image" class="change" src="/display?fileName={{pimage}}" width=300 style="display: none">	
				<input type="hidden" id="strImage" value="{{pimage}}">
			</td>
		</tr>
	
	</script>
	</div>
		<div id="btnCombi">
			<button id="btnUpdate" style="display: none;" class="smallbtn">수정하기</button>
			<button id="btnInsert" class="smallbtn" style="display: none;" class="smallbtn">저장하기</button>
		</div>
	</div>


<script>
	apply();

	 function destroy() {
	       if ($('#slider-div').hasClass('slick-initialized')) {
	           $('#slider-div').slick('unslick');
	       }
	   }
	 
	//저장하기 버튼을 클릭한 경우
	$("#btnInsert").on("click", function(){

		var pno=$("#pno").val();
		var pname=$("#pname").val();
		var pcate=$("#pcate").val();
		var pbreed=$("#pbreed").val();
		var page=$("#petage").val();
		var pgender=$("#pgender").val();
		var pweight=$("#pweight").val();
		var pspaying=$(".pspaying1").val();
		var file = $("#file")[0].files[0];
		alert(pspaying)
		alert(file)
		if(file == null) {
			file=$("#strImage").val();
			alert(file)
		}
		alert(page)
		
		 var formData = new FormData();
		 
		 formData.append("pno", pno);
		 formData.append("pname", pname);
		 formData.append("pcate", pcate);
		 formData.append("pbreed", pbreed);
		 formData.append("page", page);
		 formData.append("pgender", pgender);
		 formData.append("pweight", pweight);
		 formData.append("pspaying", pspaying);
		 formData.append("file", file);
		 
		if(!confirm("정보를 수정하실래요?")) return;

		
		$.ajax({
			type:"post",
			url:"/mypet/updatePet",
			processData:false, 
			contentType:false, 
			data:formData,
			success: function(){
				$("#btnInsert").hide();
				$("#tbl").css({
					"display": "none"
				});
				alert("수정되었습니다.");
				location.href="/mypet/mypetlist?id=${id}";
			}
		});
	});
	//수정하기 버튼을 클릭한 경우
	$("#btnUpdate").on("click",function(){
		//tbl 토글
		if($(".change").css("display") == "none"){
			$(".change").show();
			$(".trans").hide();
			$("#btnUpdate").hide();
			$("#btnInsert").show();
			
			$(".gender").each(function(){
				var gender= $(this).parent().attr("pgender");
				if(gender==$(this).val()){
					$(this).attr("checked","checked");
				}
			});
			
			$(".spaying").each(function(){
				var spaying= $(this).parent().parent().attr("pspaying");
				if(spaying == $(this).val()){
					$(this).attr("selected","selected");
				}
			});
				
			
		}else{
			$(".change").hide();
			$(".trans").show();
			$("#btnUpdate").show();
			$("#btnInsert").hide();
		}
	});

	//상세보기버튼을 클릭한 경우	
	$(".myPetBox").on("click","button", function(e){
		e.preventDefault();
		var pno=$(this).attr("pno");

			$.ajax({
				type:"get",
				url:"/mypet/mypetRead.json",
				dataType:"json",
				data:{pno:pno},
				success: function(data){
					var template = Handlebars.compile($("#temp").html());
					$("#tbl").html(template(data));
					$("#btnInsert").hide();
					
					
				}
			});

		//tbl 토글
		if($("#tbl").css("display") == "none"){
			$("#btnUpdate").show();
			$("#tbl").show();
			$("#petcontent").show();

		}else{
			$("#tbl").hide();
			$("#btnUpdate").hide();
			$("#petcontent").hide();
		}
	});
	

	    function apply() {
	        $('#slider-div').slick({
	            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
	            infinite : false,  //무한 반복 옵션
	            slidesToShow :3,  // 한 화면에 보여질 컨텐츠 개수
	            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
	            speed : 100,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	            arrows : false,  // 옆으로 이동하는 화살표 표시 여부
	            dots : true,  // 스크롤바 아래 점으로 페이지네이션 여부
	            autoplay : true,  // 자동 스크롤 사용 여부
	            autoplaySpeed : 10000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	            vertical : false,  // 세로 방향 슬라이드 옵션
	            prevArrow : "<button type='button' class='slick-prev'>Previous</button>",  // 이전 화살표 모양 설정
	            nextArrow : "<button type='button' class='slick-next'>Next</button>",  // 다음 화살표 모양 설정
	            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
	            draggable : true,  //드래그 가능 여부 

	            // 반응형 웹구현 옵션
	            responsive : [
	                {
	                    breakpoint : 960,  //화면 사이즈 960px
	                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                },
	                {
	                    breakpoint : 768,  //화면 사이즈 768px
	                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                }
	            ]
	        });
	    }
		
		//이미지 미리보기
		$("#tbl").on("click","#image", function(){
			$("#file").click();
		});
		
		$("#tbl").on("change","#file", function(e){
			var file=$("#file")[0].files[0];
			$("#image").attr("src", URL.createObjectURL(file));
			
		});

</script>