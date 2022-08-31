<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
.sa-button-container{
	text-align: center;
}
.swal-button, .confirm {
  padding: 7px 19px;
  border-radius: 2px;
  width:100px;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
  background-color: #A7CA37;
}
#tbl{
	border: none;
	width: 800px;
	margin-top: 20px;
}
#tbl2{
	border: none;
	width: 800px;
	display: none;
	margin-left: 175px;
}
.title{
	font-weight: bold;
	font-size: 13px;
}
.row, .row2{
	font-size: 12px;
}
.hiddenArea{
	display: none;
	text-align: center;
	border-left: hidden;
	border-right: hidden;
}
.row {
	cursor: pointer;
}
#company .scname{
	cursor: pointer;
	font-size: 12px;
 	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 60px;
}

#company .scname:hover{
	cursor: pointer;
	color:A7CA37;
	font-weight: bold;
	font-size: 12px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	width: 60px;
}
#oldList{
	cursor: pointer;
	font-weight: bold;
	position: relative;
	margin-left: 427px;
}
   #sidemenu{
  	margin-left: -100px;
  }
  .btnYes, .btnNo{
  	text-align:center;
  	width: 40px;
  	height: 35px;
	background-color: #A7CA37;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
  } 
  .btnYes:hover, .btnNo:hover{
  	text-align:center;
  	width: 40px;
  	height: 35px;
	background-color: 7F9730;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
  }    
  .btnYes:disabled, .btnNo:disabled{
  	text-align:center;
  	width: 40px;
  	height: 35px;
	background-color: #d1dcac;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
  }
</style>
<div id="page">
	<p style="text-align: center; font-weight: bold">업체를 선택하세요</p>

	<div id="sidemenu">
		<jsp:include page="${sideMenu}" />
	</div>
	
	<table id = "company" width=800></table>
	<script id="temp3" type="text/x-handlebars-template">
		<tr width=800>
		{{#each company}}
			<td title="클릭하시면 해당업체의 예약정보를 확인 할 수 있습니다."><span class="scname">{{scname}}</span></td>
		{{/each}}
		</tr>
	</script>
	
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
	<tbody class="list">
		<tr class="title">
			<tdstyle="display:none;">업체번호</td>
			<tdstyle="display:none;">업체명</td>
			<td width=25>예약번호</td>
			<td width=60>입실일</td>
			<td width=60>퇴실일</td>
			<td width=50>예약자</td>
			<td width=80>예약자 연락처</td>
			<td width=110>예약일</td>
			<td width=70>특이사항</td>
			<td width=80>승인/거절</td>
		</tr>

		{{#each list}}
			<tbody class="clicker">
				<tr class="row">
					<td class="scno click" style="display:none;">{{scno}}</td>
					<td class="scname click" style="display:none;">{{scname}}</td>
					<td class="rno click">{{rno}}</td>
					<td class="checkin click">{{checkin}}</td>
					<td class="checkout click">{{checkout}}</td>
					<td class="userName click">{{userName}}</td>
					<td class="userTel click">{{userTel}}</td>
					<td class="reserveDate click">{{reserveDate}}</td>
					<td><span class="msg click"></span></td>
					<td class="isEdit" style="display:none;">{{isEdit}}</td>
					<td class="isDel" style="display:none;">{{isDel}}</td>
					<td class="request" style="display:none;">{{request}}</td>
					<td class="buttons"><button class="btnYes" disabled>승인</button> <button class="btnNo" disabled>거절</button></td>
				</tr>
				<tr class="hidden">
					<td colspan=9 class="hiddenArea"><p>{{request}}</p></td>
				</tr>
			
			</tbody>
		
		{{/each}}
	</tbody>
	</script>
	
	<p id="oldList" title="클릭하시면 지난예약 리스트를 볼 수 있습니다.">지난 예약 리스트<p>
	
	<table id="tbl2"></table>
	<script id="temp2" type="text/x-handlebars-template">
	<tbody class="oldlist">
		<tr class="title">
			<td width=25 style="display:none;">업체번호</td>
			<td width=70 style="display:none;">업체명</td>
			<td width=25>예약번호</td>
			<td width=60>입실일</td>
			<td width=60>퇴실일</td>
			<td width=50>예약자</td>
			<td width=70>예약자 연락처</td>
			<td width=110>예약일</td>
			<td width=200>요청사항</td>
			
		</tr>
		
		{{#each oldlist}}
		
		<tr class="row2">
			<td class="scno" style="display:none;">{{scno}}</td>
			<td  style="display:none;">{{scname}}</td>
			<td class="rno">{{rno}}</td>
			<td class="checkin">{{checkin}}</td>
			<td class="checkout">{{checkout}}</td>
			<td class="userName">{{userName}}</td>
			<td class="userTel">{{userTel}}</td>
			<td class="reserveDate">{{reserveDate}}</td>
			<td class="request">{{request}}</td>
		</tr>
		
		
		{{/each}}
	</tbody>
	</script>
</div>
<script>
	var id="${id}";
	var keyword="";
	
	getComList();
	
	//예약변경 거절버튼을 클릭한 경우
	$("#tbl").on("click",".btnNo",function(){
		var isEdit= $(this).closest(".clicker").find(".isEdit").html();
		var isDel= $(this).closest(".clicker").find(".isDel").html();
		var rno= $(this).closest(".clicker").find(".rno").html();

		if(isEdit == 1){
			swal({
				title : '변경거절',
				text : '예약변경요청을 거절하시겠습니까?',
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				confirmButtonColor: "#A7CA37",
				closeOnConfirm : false,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					isEdit = 2;

					$.ajax({
						type: "post",
						url: "/reserve/ReserveEdit",
						data: {isEdit:isEdit, isDel:isDel, rno:rno},
						success: function(){
							swal({
								title : '',
								text : '',
								type: 'success',
								confirmButtonColor: "#A7CA37",
								
							});
							getList();
						}
					});
					
				}

			});
				}else{
					swal({
							title : '',
							text : '취소되었습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
							showConfirmButton : false,
						});
				}
			});
			
	//승인버튼을 클릭한 경우
	$("#tbl").on("click",".btnYes",function(){
		var isEdit= $(this).closest(".clicker").find(".isEdit").html();
		var isDel= $(this).closest(".clicker").find(".isDel").html();
		var rno= $(this).closest(".clicker").find(".rno").html();

		
		if(isEdit == 1){

			swal({
				title : '예약변경',
				text : '예약변경을 승인하시겠습니까?',
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				confirmButtonColor: "#A7CA37",
				closeOnConfirm : false,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					isEdit = 0;

					$.ajax({
						type: "post",
						url: "/reserve/ReserveEdit",
						data: {isEdit:isEdit, isDel:isDel, rno:rno},
						success: function(){
							swal({
								title : '',
								text : '',
								type: 'success',
								confirmButtonColor: "#A7CA37",	
								
								
							});
							getList();
						}
					});
					
				}else{
					swal({
							title : '',
							text : '취소되었습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
							showConfirmButton : false,
						});
				}
			});
			
			
		}else if(isDel == 1){
			isDel = 2;

			swal({
				title : '예약취소',
				text : '예약취소를 승인하시겠습니까?',
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-danger",
				confirmButtonText : "예",
				cancelButtonText : "아니오",
				confirmButtonColor: "#A7CA37",
				closeOnConfirm : false,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						type: "post",
						url: "/reserve/ReserveEdit",
						data: {isEdit:isEdit, isDel:isDel, rno:rno},
						success: function(){
							swal({
								title : '',
								text : '',
								type: 'success',
								confirmButtonColor: "#A7CA37",	
							});
							getList();
						}
					});
					
				}else{
					swal({
							title : '',
							text : '취소되었습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
							showConfirmButton : false,
						});
				}
			});
		
		}

	});
	
	function updateReserve(){
		$.ajax({
			type: "post",
			url: "/reserve/updateReserve",
			data: {isEdit:isEdit, isDel:isDel},
			success: function(){
				swal({
					title : '',
					text : '',
					type : success,
					timer : 1500,
					customClass : 'sweet-size',
					showConfirmButton : false
				});
			}
		});
	}
	
	//지난예약리스트를 클릭한 경우
	$("#oldList").on("click", function(){
		var target = $("#tbl2");
		if(target.css("display")=="none"){
			target.show();
		}else{
			target.hide();
		}
	});

	//업체명 을 클릭한 경우 
	$("#company").on("click", ".scname", function(){
		$(this).each(function(){
			keyword = $(this).html();
			getList();
			getoldList();
		});
		
	});
	//업체리스트 출력
	function getComList(){
		$.ajax({
			type: "get",
			url: "/reserve/comReserveList.json",
			dataType: "json",
			data: {id:id},
			success: function(data){
				var template = Handlebars.compile($("#temp3").html());
				$("#company").html(template(data));
				
				$(".sname").parent().attr("title", "클릭하시면 해당업체의 예약현황을 볼 수 있습니다.");
			}
		});
	}

	//테이블 로우를 클릭한 경우 /isEdit or isDel값이 있는경우
	$("#tbl").on("click",".click", function(){
		var target = $(this).closest(".clicker").find(".hiddenArea");	//숨겨둔 tr
		var request = $(this).find(".request").html();
		
		if(target.css("display") == "none"){
			
			target.show();
		}else {
			target.hide();
		}
	});
	
	
	//예약리스트 출력
	function getList(){
		$.ajax({
			type: "get",
			url: "/reserve/comReserveList.json",
			dataType: "json",
			data: {id:id, keyword:keyword},
			success: function(data){
				if(data.list.length==0){
					$("#tbl").html("예약된 내역이 없습니다.");
				}else{
					var template = Handlebars.compile($("#temp").html());
					$("#tbl").html(template(data));
				}
				
				
				//예약날짜 섭스트링
				$(".row").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
				
					//전화번호 포멧
					var num = $(this).find(".userTel").html();
					var formatNum = '';
					
					if(num.length==11){
					    formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}else if(num.length==8){
					    formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
					}else if(num.indexOf('02')==0){
					    formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
					}else{
					    formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
					}
						$(this).find(".userTel").html(formatNum);
						
					var isEdit = $(this).find(".isEdit").html();
					var isDel = $(this).find(".isDel").html();
					var target = $(this).find(".msg");
					var yes = $(this).find(".btnYes");
					var no = $(this).find(".btnNo");

					if(isEdit == 1){	//변경요청
						target.html("예약변경 요청");
						//버튼 활성화		
						yes.attr("disabled",false);
						yes.attr("title", "예약변경요청을 승인합니다.");
						no.attr("disabled",false);
						no.attr("title", "예약변경요청을 거절합니다.");
					}else if(isDel == 1){		//취소요청
						target.html("예약취소 요청");
						//버튼 활성화		
						yes.attr("disabled",false);
						yes.attr("title", "예약취소요청을 승인합니다.");
						no.attr("disabled",true);
						no.attr("title", "예약취소요청은 거절 할 수 없습니다.");
					}else if(isEdit == 2){		//취소거절
						target.html("예약변경 불가안내");
						yes.attr("disabled",true);
						yes.attr("title", "예약자의 확인을 기다리고 있습니다.");
						no.attr("disabled",true);
						no.attr("title", "예약자의 확인을 기다리고 있습니다.");
					}else if(isDel == 2){		//취소요청
						target.html("예약취소 확정");
						//버튼 활성화		
						yes.attr("disabled",true);
						yes.attr("title", "예약이 취소되었습니다");
						no.attr("disabled",true);
						no.attr("title", "예약이 취소되었습니다");
					}else{						//평상시
						//버튼 비활성화
						yes.attr("disabled",true);
						yes.attr("title", "예약변경요청이 없습니다");
						no.attr("disabled",true);
						no.attr("title", "예약변경요청이 없습니다");
					}
					//타이틀 부여
					$(".click").attr("title", "클릭하시면 요청사항을 볼 수 있습니다.");
					
				});
			}
		});
	}
	//지난 예약리스트 출력
	function getoldList(){
		$.ajax({
			type: "get",
			url: "/reserve/comReserveList.json",
			dataType: "json",
			data: {id:id, keyword:keyword},
			success: function(data){

				if(data.oldlist.length==0){
					$("#tbl2").html("지난 예약 내역이 없습니다.");
				}else{
					var template = Handlebars.compile($("#temp2").html());
					$("#tbl2").html(template(data));
				}

				//예약날짜 섭스트링
				$(".row2").each(function(){
					var target = $(this).find(".checkin").html();
					var checkin = target.substring(0,10);
					$(this).find(".checkin").html(checkin);
					
					var target = $(this).find(".checkout").html();
					var checkout = target.substring(0,10);
					$(this).find(".checkout").html(checkout);
				
				});
			}
		});
	}
</script>

