<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
h1 {
	text-align : left;
}
input::placeholder {
  font-size : 30px;
}
input[type=text]{
	height :50px;
	font-size : 30px;
	width : 200px;
	line-height:100px;
	border : none;
	border-bottom : 1px dotted gray;
	outline : none;
	
}
textarea {
	padding : 10px;
	resize : none;
}

#send {
    /* left: 40%; */
    border-radius: 10px;
    border: #A7CA39 2.5px solid;
    color: #799c08;
    font-weight: 1300;
    background-color: white;
    padding: 5px 10px 5px 10px;
    cursor: pointer;
    width: 95%;
    font-size : larger;
}

#send:hover{
	background-color: #A7CA37;
	color:white;
}
</style>
<div style="float : right; text-align : left; margin-right : 120px;">
	<h1>견적 보내기</h1><span style="display:none;" scno="${sc.scno}" scname="${sc.scname}" id="scinfo"></span>
	<% String brno = request.getParameter("brno"); %>
	<% String crno = request.getParameter("crno"); %>
	<% String lrno = request.getParameter("lrno"); %>
	<div style="display:none;" id="info" brno="<%=brno %>" crno="<%=crno %>" lrno="<%=lrno %>"><%=brno %><%=crno %><%=lrno %></div>
	<input type="text" id="price" style="text-align : right" placeholder="0" numberOnly><span style="font-size : 30px;" >원</span>
	<br/>
	
	<h2 style="margin-bottom : 5px;">견적 설명</h2>
	<div class="textLengthWrap" style="float : right; margin-bottom : 5px;"> 
		<span class="textCount">0</span> <span class="textTotal"> /500</span> 
	</div>
	<div>
		<textarea id="description" cols="100%" rows="10"></textarea>
	</div>
	<br/>
	<div style="text-align : center;">
		<button id="send">견적 보내기</button>
	</div>
	<br/><br/>
</div>
<script>


/*
 var price = document.querySelector('#price');
 
 price.addEventListener('keyup', function(e){
	 var value = e.target.value;
	 value = Number(value.replaceAll(',', ''));
	 if(isNaN(value)){
		 price.value = '';
	 }else{
		 const formatValue = value.toLocaleString('ko-KR');
		 price.value = formatValue;`
	 }
 });*/
	$("input:text[numberOnly]").on("keyup", function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	 });


 $("#description").keyup(function(e){
	 //글자수
	 var content = $(this).val();
	 if(content.length == 0 || content == ''){
		 $('.textCount').text('0');
	 }else{
		 $('.textCount').text(content.length);
	 }
	 //글자수 제한
	 if(content.length > 500){
		 $(this).val($(this).val().substring(0, 500));
		 swal("500자까지 입력 가능합니다");
	 }
 });
 
 $('#send').on("click", function(){
	 var scno = $("#scinfo").attr("scno");
	 var scname = $("#scinfo").attr("scname");
	 var brno = $("#info").attr("brno");
	 var crno = $("#info").attr("crno");
	 var lrno = $("#info").attr("lrno");
	 var price= $("#price").val();
	 var description =$("#description").val();
	 
	 
 
		if(!confirm("견적서를 작성하시겠습니까?")) return;	
 		
		if(brno != null && crno == 'null' && lrno == 'null' && scno ==""){
			swal("미용 업체 등록 후 견적서 작성이 가능합니다!");
			return;
		}
		
		if(crno != null && brno == 'null' && lrno == 'null' && scno ==""){
			swal("홈 클리닝 업체 등록 후 견적서 작성이 가능합니다!");
			return;
		}
		
		if(lrno != null && brno == 'null' && crno == 'null' && scno ==""){
			swal("레슨 업체 등록 후 견적서 작성이 가능합니다!");
			return;
		}
		
		if(brno != null){
			 if(crno == 'null' && lrno == 'null'){
				 $.ajax({
						type: "post",
						url : "beinsert",
						data : {scno:scno, scname:scname, brno:brno, price:price, description:description},
						success:function(overlapCheck){
							if(overlapCheck == 0){
								swal({
								  	 title:"",
								 	 text: "견적서 작성완료!",
								 	 type: "success"
						 		});
								setTimeout(function() {
									location.href="/request/servicelist"
								}, 1000);
								
							}else if(overlapCheck ==1){
								swal("견적서 작성은 요청서별  1회만 가능합니다!");
							}
							 
						}
					});
			 
			 }
		 }
		
		if(crno != null){
			if(brno == 'null' && lrno == 'null'){
				$.ajax({
					type: "post",
					url : "ceinsert",
					data : {scno:scno, scname:scname, crno:crno, price:price, description:description},
					success:function(overlapCheck){
						if(overlapCheck == 0){
							alert("견적서 작성완료");
							location.href="/request/servicelist";
						}else if(overlapCheck ==1){
							swal("견적서 작성은 요청서별  1회만 가능합니다!");
						}
					}
				});
			}
		}
		
		if(lrno != null){
			if(brno == 'null' && crno == 'null'){
				$.ajax({
					type: "post",
					url : "leinsert",
					data : {scno:scno, scname:scname, lrno:lrno, price:price, description:description},
					success:function(overlapCheck){
						if(overlapCheck == 0){
							alert("견적서 작성완료");
							location.href="/request/servicelist";
						}else if(overlapCheck ==1){
							swal("견적서 작성은 요청서별  1회만 가능합니다!");
						}
					}
				});
			}
		}
		
 });
 
</script>
