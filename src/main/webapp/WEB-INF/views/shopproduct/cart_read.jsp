<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <link href="/resources/css/shopproduct_cart_read.css" rel="stylesheet">
   <link rel="stylesheet" href="https://fonts.sandbox.google.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   <style>
   	.col1_title_row2_img_and_content img {
		width:97px;
		height:97px;
	}
	.none{
		display:none;
	}
	.col1_title_row2_img_and_content img{
		cursor:pointer;
	}
	.btn_delete_div{
		vertical-align:top;
		padding-bottom:15px;
	}
	.button_x {
	    width: 18px;
	    height: 18px;
/* 	    margin-top: 3px; */
	}
	.i_qnt{
	    font-size: 10;
	    color:gray;
	}
   </style>

<div id="page">
<table id="tbl"></table>
<script id="temp" type="text/x-handlebars-template">
   <div class="shopping_cart_page">
      <div class="cart_header">
         <div class="cart_header_top">
            <div class="cart_shipping_general">장바구니</div>
            <span>|</span>
            <div class="cart_shipping_regularly">지정배송</div>
         </div>
         <div class="cart_header_bottom">
            <div class="cart_select_all">
               <div><label for="chk_all"><input type="checkbox" class="bigCheckbox_page_header" id="chk_all" />전체 선택</label>
						<span class="delete">(<a class="checked_item">2</a>/<a class="item_total">5</a>)<button id="cart_delete">삭제</button></span>
					</div>
            </div>
         </div>
      </div>

      <div class="cart_container_main">
		{{#each .}}
         <div class="cart_container_sub" cno="{{cno}}" amount="{{amount}}" pno="{{pno}}" price="{{pprice}}" sum="{{sum}}">
            <div class="cart_item">
               <div class="cart_item_content_row_itemCard">
                  <div class="chk_box_col0"><input type="checkbox" class="bigCheckbox_item" chk="{{chk}}"/></div>


                  <div class="content_col1_title">
                     <div class="col1_title_row1"></div>
                     <div class="col1_title_row2_img_and_content">
                        <img src="{{pimage}}" alt='item_img'>
                        <div class="col1_title_row2_content_container">
                           <div class="col1_title_row2_content_title ellipsis2lines">{{pname}}</div>
                           <div class="col1_title_row2_content_price">{{pprice}} 원</div>
                        </div>
                     </div>
                  </div>
                  <div class="content_col2_quantity">
                     <div class="cart_update_container" style="text-align:center;">
                       <select class="select_quantity" data_quantity={{amount}} quantity="{{pqantity}}">
							<option value="0" class="none">0</option>
							<option vlue="1">1</option>
							<option vlue="2">2</option>
							<option vlue="3">3</option>
							<option vlue="4">4</option>
							<option vlue="5">5</option>
							<option vlue="6">6</option>
							<option vlue="7">7</option>
							<option vlue="8">8</option>
							<option vlue="9">9</option>
							<option vlue="10">10</option>
							<option vlue="10+">10+</option>
						</select>
						<a class="select-text" style="display: none;">
							<input type="text" class="quantity-text" maxlength="4" style=" width:57px; height:25px;">
							<input type="button" class="quantity-chg" id="quantity-chg" value="수량변경" 
							onclick='getSelect(this)'>
						</a>
					<div class="i_qnt" qnt = "{{pqantity}}">남은 수량: {{pqantity}}개</div>
                     </div>
                  </div>
                  <div class="content_col3_subtotal_container">
                     <div class="content_col3_subtotal_label">상품금액</div>
                     <div><span class="content_col3_subtotal_amount">{{sum}}</span>원</div>
                     <div><button class="cart_paynow">주문하기</button></div>
                  </div>
                  <div class="content_col4_deliveryFee_container">
                     <div class="content_col3_subtotal_label">적립예정금</div>
                     <div class="content_col4_deliveryFee_amount"><span class="reserves"></span>원</div>
                     <div class="content_col4_deliveryFee_message">(최대 10% 적립)</div>
                  </div>
               </div>
            </div>
         </div>
		{{/each}}
      </div>

      <div class="page_bottom_half">
         <div class="page_bottom_total_price">
            <div class="page_bottom_total_price_row1">
               <div class="page_item_footer_inner">
                  <div class="cart_item_footer_col1_subtotal">
                     <div class="page_footer_col_label">선택상품금액</div>
                     <div class="page_footer_col_amount">400,000,000원</div>
                  </div>
                  <span class="material-symbols-outlined math">
                  add
                  </span>
                  <div class="cart_item_footer_col2_deliveryfee">
                     <div class="page_footer_col_label">총 배송비</div>
                     <div class="page_footer_col_label_deliveryfee">3,000원</div>
                  </div>
                  <div class="page_footer_col3_subtotal">
                     <span class="page_footer_col3_label"> 총 주문금액</span>
                     <span class="page_footer_col3_label_subtotal">35,000000원</span>          
                  </div>
               </div>
            </div>
         </div>
         <div class="bottom_total_price_row2_payment">
            <a class="payment_submit_now">총 1 건 주문하기</a>
         </div>
      </div>
   </div>
</script>
</div>

<script>
	var uid = "${id}";
	var checked=0;
	var chk_all=0;
	var chked_all=0;
	getList();
	
	//chkall 체크되었을 경우
	$("#tbl").on("change","#chk_all", function(){
		if($('#chk_all').prop("checked")){
			$(".bigCheckbox_item").prop("checked",true);
			$(".bigCheckbox_item").each(function(){
				var sum = $(this).parent().parent().parent().parent().attr("sum");
				i = i + Number(sum);
				
				$(this).attr("chk", 1);
				//chk 업데이트 이후에 아래 명령어 실행
			});
			$(".page_footer_col_amount").html(i+"원");
			$(".page_footer_col_amount").attr("final_price", i);
			i = 0;
		}else{
			$(".bigCheckbox_item").prop("checked",false);
			$(".bigCheckbox_item").each(function(){
				var sum = $(this).parent().parent().parent().parent().attr("sum");
				i = i + Number(sum);
				$(this).attr("chk", 0);
			})
			$(".page_footer_col_amount").html(i+"원");
			$(".page_footer_col_amount").attr("final_price", i);
			i = 0;
			$("#tbl").click();
		}
		getCount();
		chk_update();
		getFormatNum2();
	});

	//tbl 내부에 있는 chk값이 변경될 경우 chk: 0 or 1 업데이트
	$("#tbl").on("change", ".bigCheckbox_item", function(){
		//chk값 특정
		if($(this).is(":checked")){
			var chk = 1; 
		}else{
			var chk = 0; 
		}
		$(this).attr("chk", chk);
// 		DB에 chk값 업데이트
		var cno = $(this).parent().parent().parent().parent().attr("cno");
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_chk_update",
			data: {chk:chk, cno:cno},
			success: function(){
				//alert("업데이트 성공")
			}
		});
		
	});
	
	// 체크박스에 따른 chkAll 체크유무
	$("#tbl").on('click','.bigCheckbox_item',function(){
	    if($('input[class=bigCheckbox_item]:checked').length==$('.bigCheckbox_item').length){
	        $('#chk_all').prop('checked',true);
	    }else{
	       $('#chk_all').prop('checked',false);
	    }
	});
	
	//최종 금액 갱신
	//최종 구매수량 갱신
	//적립 예정금 갱신
	var i = 0;
	var r = 0;
	$("#tbl").on("click", function(){
		checked = 0;
		chk_all = $(".bigCheckbox_item").length;
		$(".bigCheckbox_item:checked").each(function(){
			var sum = $(this).parent().parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").attr("price");
			i = i + Number(sum);
			checked = checked + 1;
		})
		$(".checked_item").html(checked);
		$(".item_total").html(chk_all);
		$(".page_footer_col_amount").attr("final_price", i);
		i = 0;
		chkCount();
		getFormatNum2();
	});
	
	
	//장바구니 삭제 버튼을 클릭할 경우
	$("#tbl").on("click", "#cart_delete", function(){
		//checked 되어있는 chk의 "{{cno}}"값을 불러와서 delete. 
		swal({
			title : "",
			text : "체크한 상품을 장바구니에서 삭제하시겠습니까?",
			type : "warning",
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
						text : '삭제가 완료되었습니다.',
						type: 'success',
						confirmButtonColor: "#A7CA37",	
					});
					
					setTimeout(function() {
						$(".bigCheckbox_item:checked").each(function(){
							var cno = $(this).parent().parent().parent().parent().attr("cno");
							$.ajax({
								type: "post",
								url: "/shopproduct/delete",
								data: {cno:cno},
								success: function(){
									getList();
								}
							});
						});
					}, 1000);
				}else{
					swal({
							title : '',
							text : '삭제를 취소하였습니다.',
							type: 'error',
							confirmButtonColor: "#A7CA37",	
						});
				}
			});
	});

	
	
	//cart 정보 불러오기
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			data: {uid: uid},
			url: "/shopproduct/cart_read.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				
				//페이지 입장시 기존 amount값에 따라 option selected
				$("#tbl .select_quantity").each(function(){
					var amount = $(this).parent().parent().parent().parent().parent().attr("amount");
					var input_amount = $(this);
					input_amount.val(amount).prop("selected", true);
					//만약 input_amount.val()이 10보다 크면 this.none 해제 후 html amount 부여
					if(input_amount.attr("data_quantity")>10){
						var zero = $(this).find(".none");
						zero.html(amount);
						zero.val(amount);
						zero.attr("class", "block");
						$(this).val(amount).prop("selected", true);
					}
					//상품금액 attr 부여
					//선택된 option value에 따라 바뀌는 총합액을 갱신
					var price = $(this).parent().parent().parent().parent().parent().attr("price");
					var vsum = Number(amount) * Number(price);
					var sum = $(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount");
					sum.attr("price", vsum)
					sum.html(vsum);
				});

				//페이지 입장시 자동 체크된 항목들의 값을 계산하여 최종 금액 출력
				var i = 0;
				$("#tbl .bigCheckbox_item").each(function(){
					if($(this).attr("chk")==1){
						var sum = $(this).parent().parent().parent().parent().attr("sum");
						i = i + Number(sum);
					}
				})
				$(".page_footer_col_amount").html(i+"원");
				$(".page_footer_col_amount").attr("final_price", i);
				i = 0;
				
				//chk값 불러와서 체크박스 체크
				$(".bigCheckbox_item").each(function(){
					var chk = $(this).attr("chk");
					if(chk==1){
						$(this).attr("checked", "checked");						
					}
				})
				//.chk가 모두 체크되어있을 경우 chkAll 체크 (.chk length와 .chk:checked length가 동일한 경우)
/*				if($('input[class=bigCheckbox_item]:checked').length==$('.bigCheckbox_item').length){
					if($('.bigCheckbox_item').length==0){
						 swal({
						  	 title:"",
						 	 text: "장바구니에 등록된 상품이 없습니다!"
				 		});
						location.href="/shopproduct/main";
					}else{
						$("#chk_all").attr("checked", "checked");
					}
				}*/
				//입장시 몇 개 선택되어 있는지 표시
				checked = 0;
				chk_all = $(".bigCheckbox_item").length;
				$(".bigCheckbox_item:checked").each(function(){
					checked = checked + 1;
				})
				$(".checked_item").html(checked);
				$(".item_total").html(chk_all);
				
			 	chkCount();
			 	getReserve();
			 	getFormatNum1();
			 	getFormatNum2();
			}
		});
		
	}
		
	//수량 : select optoin을 선택했을 경우
	$("#tbl").on("change", ".select_quantity", function() {
		//select 10+ 선택시 입력칸 생성
		if($(this).val()=="10+"){
			$(this).parent().find("block").attr("class", "none");
			$(this).attr("style", "display:none");
			$(this).parent().find(".select-text").attr("style", "display:block;");
			return;
		}
		var selected = $(this).val(); //선택한 option의 value 값을 불러온다.
		////////////////수정중 
		var item_qnt = $(this).attr("quantity");	//해당 상품의 남은 수량을 불러온다.
		if(Number(selected)>Number(item_qnt)){
// 			alert("상품의 남은 수량보다 많이 선택하셨습니다!\n해당 상품의 잔존수량: "+item_qnt+"개");
			 swal({
			  	 title:"",
			 	 text: "상품의 남은 수량보다 많이 선택하셨습니다!\n\n해당 상품의 남은수량: "+item_qnt+"개",
			 	 type: "warning"
	 		});
			
			
			//추가해야할 것이 있다 -> 만약 재고소진이 아니라 애매하게 1개 정도 남은 상품일 경우도 생각해야 함
			//바로 0을 꽂아버리는 게 아니라 선택한 value 값을 기준으로 계산한 값을 넣어야함 
			//selected => 선택한 수량
			//선택한 수량이 잔존수량보다 많게 클릭했기 때문에 현재수량을 잔존수량으로 바꾸고 값을 다시 계산한다.
			selected=item_qnt;
			
			//가격 표시줄 0원으로 설정하기
// 			$(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").html(0);
// 			$(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").attr("price", 0);
// 			selected = 0;
// 			alert($(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").html());
// 			alert($(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").attr("price"));
			//최대 데이터 수량넣기
			var data_qnt = $(this).attr("quantity");
			$(this).val(data_qnt);
			$(this).attr("data_quantity", data_qnt);
			//수량 재설정하지 않으면 값이 바뀜.
		}else{
			$(this).attr('data_quantity', selected); //불러온 value값을 (data_quantity)에 집어넣는다.
		}
		///////////////////
		//선택된 option value에 따라 바뀌는 총합액을 갱신
		var price = $(this).parent().parent().parent().parent().parent().attr("price");
		var vsum = Number(selected) * Number(price);
		var sum = $(this).parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount");
		sum.html(vsum);
		sum.attr("price", vsum);
		getReserve();
		getFormatNum1();

		//DB에 수량 업데이트
		var amount = $(this).attr("data_quantity");
		var cno = $(this).parent().parent().parent().parent().parent().attr("cno");	
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_update",
			data: {amount:amount, cno:cno},
			success: function(){
				//alert("업데이트 성공")
			}
		});
	});

	
	/* buy click function의 존재의의가 없다. 구매시 이동하기만 해도 될 것 같다. 정보를 list에 담아서 이동하는 코드 필요 */
	//구매 버튼을 클릭한 경우
	$("#tbl").on("click", ".payment_submit_now", function(){
		if(chked_all==0){
// 			alert("주문할 상품을 선택해주세요!");
			return;
		}
		getList();
		var qntTest = 0;
		$(".i_qnt").each(function(){//상품 전체 수량 체크
// 			alert("이치 테스트");
			var tempQnt = $(this).attr("qnt");
			if(tempQnt==0){//만약 상품 중에 재고 0인 상품이 있다면
// 				alert("템프 테스트");
				var chk = $(this).closest(".cart_item_content_row_itemCard").find(".chk_box_col0 .bigCheckbox_item").attr("chk");
// 				alert("chk=" + chk);
				if(chk==1){//만약 그 상품의 chk가 체크된 상태라면
					$(this).closest(".cart_item_content_row_itemCard").find(".chk_box_col0 .bigCheckbox_item").attr("checked", false);
					$(this).closest(".cart_item_content_row_itemCard").find(".chk_box_col0 .bigCheckbox_item").attr("chk", 0);
// 					alert($(this).closest(".cart_item_content_row_itemCard").find(".chk_box_col0 .bigCheckbox_item").attr("chk"));
					chk_update();
					qntTest = 1;
				}	
				return;
			}
		});
		if(qntTest==1) {
			swal({
			  	 title:"",
			 	 text: "재고가 소진된 상품이 존재합니다!",
			 	 type: "warning"
	 		});
			getList();
			return;
		}
		location.href="/shopproduct/multi_buy?uid=${id}";
	});
	
	//상품 이미지 클릭시 해당 페이지로 이동
	$("#tbl").on("click", "img", function(){
		var pno = $(this).parent().parent().parent().parent().parent().attr("pno");
		location.href="/shopproduct/read?pno="+pno;
	});
	


	
	//수량 10+ 클릭시 기능
	function getSelect(e){
		//클릭시 parent.find.quantity-text.val() 불러오기
		var textVal = $(e).parent().find(".quantity-text").val();
		//---------------------남은수량보다 많이 선택한 경우---------------------
		var item_qnt = $(e).parent().parent().find(".select_quantity").attr("quantity");	
		//해당 상품의 남은 수량을 불러온다.
		if(Number(textVal)>Number(item_qnt)){
			//해당 상품의 남은 수량만큼 선택된다.
			$(e).parent().find(".quantity-text").val(item_qnt);
// 			var test11 = $(e).parent().find(".quantity-text").val();
// 			alert(test11);
		 	swal({
			  	 title:"",
			 	 text: "상품의 남은 수량을 초과하여 최대수량으로 조정합니다!"
	 		});
			getSelect(e);
			return;
		}
		//---------------------------------------------------------------
		//해당 정보를 기존 select에 넣고 display 교체
		var select = $(e).parent().parent().find(".select_quantity");
		select.attr("style", "display:block margin:0px auto;");
		//display none이었던 0번째 옵션의 val을 textVal로 변경시키고 show, attr 또한 변경하며 열려있는 text박스 display none
		select.find(".none").val(textVal);
// 		select.find(".none").html(textVal);
		select.find(".none").attr("class", "block");
		select.find(".block").prop("selected", true);
		select.find(".block").html(textVal);
		select.attr("data_quantity", textVal);
		//paent display none
		$(e).parent().attr("style", "display:none");
		
		//해당 숫자에 대한 가격 및 DB 입력
		var amount = $(e).parent().parent().find(".select_quantity").attr("data_quantity");
		var price = $(e).parent().parent().parent().parent().parent().parent().attr("price");
		$(e).parent().parent().attr("amount", amount);
		//가격에 가격 업데이트 ---
		var final_price = Number(price) * Number(amount)
		$(e).parent().parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").html(final_price);
		$(e).parent().parent().parent().parent().find(".content_col3_subtotal_container .content_col3_subtotal_amount").attr("price", final_price);
		//DB에 수량 업데이트
		var cno = $(e).parent().parent().parent().parent().parent().parent().attr("cno");
// 		alert(amount+"\n"+cno);
		//cno 언디파인드
		$.ajax({
			type: "post",
			url: "/shopproduct/cart_update",
			data: {amount:amount, cno:cno},
			success: function(){
// 				alert("업데이트 성공")
			}
		});
		getReserve();	
		getFormatNum1();
		
		
	}

	function getCount(){
		//선택수량 갱신
		checked = 0;
		chk_all = $(".bigCheckbox_item").length;
		$(".bigCheckbox_item:checked").each(function(){
			checked = checked + 1;
		})
		$(".checked_item").html(checked);
		$(".item_total").html(chk_all);
	}
	
	function chk_update(){
// 		DB에 chk값 업데이트
// 		checked each 돌려서 cno값에 따른 chk값 업데이트
		$(".bigCheckbox_item").each(function(){
			var chk = $(this).attr("chk");
			var cno = $(this).parent().parent().parent().parent().attr("cno");
			//alert(cno+"\n"+chk); chk all 클릭시 chk값이 바뀌지 않고 있음
			$.ajax({
				type: "post",
				url: "/shopproduct/cart_chk_update",
				data: {chk:chk, cno:cno},
				success: function(){
				}
			});
		});
	}
	
	$("#tbl").on("click", ".cart_paynow", function(){
		var pno = $(this).parent().parent().parent().parent().parent().attr("pno");
		var amount = $(this).parent().parent().parent().find(".content_col2_quantity .cart_update_container .select_quantity").attr("data_quantity");
		location.href="/shopproduct/buy?pno="+pno+"&amount="+amount+"&uid=${id}";
	});
	
	function chkCount(){
	// 	총 몇 건 주문하기 length 세는 법
		chked_all = $('input[class=bigCheckbox_item]:checked').length;
		$(".payment_submit_now").html("총 "+chked_all+" 건 주문하기");
	}
	
	
	function getFormatNum1(){
		//넘버포맷
	 	$(".col1_title_row2_content_price").each(function(){
	 		var fprice = $(this).html();
			fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(fprice);
	 	});
	 	$(".content_col3_subtotal_amount").each(function(){
	 		var fprice = $(this).html();
			fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(fprice);
	 	});
	 	$(".reserves").each(function(){
	 		var fprice = $(this).html();
			fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(fprice);
	 	});
	}

	function getFormatNum2(){
		var fprice = $(".page_footer_col_amount").attr("final_price");
		fprice=fprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".page_footer_col_amount").html(fprice+"원");
		
		var aprice = $(".page_footer_col_amount").attr("final_price");
		if(chked_all==0){
			aprice = Number(aprice);
			$(".page_footer_col_label_deliveryfee").html("0원");
		}else{
			aprice = Number(aprice)+3000;
			$(".page_footer_col_label_deliveryfee").html("3,000원");
		}
		//만약 chk된 것이 없다면 배송비 0으로 변경	
		
		$(".page_footer_col3_label_subtotal").attr("price", aprice);
		
		aprice = $(".page_footer_col3_label_subtotal").attr("price");
		aprice=aprice.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		$(".page_footer_col3_label_subtotal").html(aprice+"원");
	}
	
	function getReserve(){
		$(".content_col3_subtotal_amount").each(function(){
			var reserve = $(this).attr("price");
			reserve = Number(reserve)/10;
			$(this).parent().parent().parent().find(".content_col4_deliveryFee_container .content_col4_deliveryFee_amount .reserves").html(reserve);
		});
	}
	
</script>
