<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>Payment Confirmation Page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="/resources/checkout_page.css" rel="stylesheet">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
  <div class="checkout_page">
    <h1 class="checkout_page_heading">결제하기</h1>

    <div class="checkout_container_main">

      <div class="checkout_left_section">

        <!-- /* 주문 상품 정보 */ -->
        <div class="checkout_cartinfo_card">
          <div class="card_heading">주문 상품 정보</div>

          <div class="checkout_cart_list">

            <div class="cartitem_info_card">
              <div class="cartitem_info_left">
                <div class="cart_item_img">
                  <img src="https://via.placeholder.com/90x90.png" alt="https://via.placeholder.com/90x90.png">
                </div>
              </div>
              <div class="cartitem_info_right">
                <div class="cartitem_title">쓰담스틱 3종 맛 선택 (50g) 필수 맛 선택: 쓰담스틱 닭가슴살(50g)</div>
                <div class="cartitem_description">
                  <p>맛 선택: 쓰담스틱 닭가슴살(50g) 1팩 - 2개</p>
                </div>
                <div class="cartitem_price">11,000원</div>
              </div>
            </div>

            <div class="cartitem_info_card">
              <div class="cartitem_info_left">
                <div class="cart_item_img">
                  <img src="https://via.placeholder.com/90x90.png" alt="https://via.placeholder.com/90x90.png">
                </div>
              </div>
              <div class="cartitem_info_right">
                <div class="cartitem_title">쓰담스틱 3종 맛 선택 (50g) 필수 맛 선택: 쓰담스틱 닭가슴살(50g)</div>
                <div class="cartitem_description">
                  <p>맛 선택: 쓰담스틱 닭가슴살(50g) 1팩 - 2개</p>
                </div>
                <div class="cartitem_price">56,000원</div>
              </div>
            </div>

            <div class="cartitem_info_card">
              <div class="cartitem_info_left">
                <div class="cart_item_img">
                  <img src="https://via.placeholder.com/90x90.png" alt="https://via.placeholder.com/90x90.png">
                </div>
              </div>
              <div class="cartitem_info_right">
                <div class="cartitem_title">쓰담스틱 3종 맛 선택 (50g) 필수 맛 선택: 쓰담스틱 닭가슴살(50g)</div>
                <div class="cartitem_description">
                  <p>맛 선택: 쓰담스틱 닭가슴살(50g) 1팩 - 2개</p>
                </div>
                <div class="cartitem_price">13,000원</div>
              </div>
            </div>
          </div>
        </div>

        <!--  주문자 정보       -->
        <div class="checkout_buyer_info_card">
          <div class="card_heading">
            <span>주분자 정보</span>
          </div>
          <div class="tbl_buyer">
            <div>
              <div class="buyer_userid buyer">honggildong123</div>
              <div class="buyer_phone buyer">010-1234-5678</div>
              <div class="buyer_email">honggildong123@naver.com</div>

            </div>

          </div>
        </div>

        <!--  배송정보       -->
        <div class="checkout_shipping_info_card">

          <div class=" card_heading"><span>배송 정보</span></div><br>
          <div><input type="checkbox" name="same_address" id="checkout_same_address"><label for="checkout_same_address">주문자 정보와 동일</label></div>

          <div class="checkout_delivery_address">

            <div class="receiver_line1">
              <span><input type="text" name="order_receiver" id="order_receiver" placeholder="수령인"></span>
              <span><input type="text" name="delivery_contact" id="delivery_contact" placeholder="연락처"></span>
            </div>

            <div class="receiver_line2">
              <span><input type="text" name="zipcode" id="zipcode" placeholder="우편번호"></span>
              <span><button id="btn_search_address">주소찾기</button></span>
            </div>

            <div class="receiver_line3">
              <div><input type="text" name="delivery_address1" placeholder="주소1" id="delivery_addy1" size=55></div>
            </div>

            <div>
              <div><input type="text" name="delivery_address2" placeholder="주소2" id="delivery_addy2" size=55></div>
            </div><br>

            <div><input type="checkbox" name="address_save" id="address_save"><label for="address_save">배송지 목록에 추가</label></div>
            <br>
          </div>
        </div>

        <!--  포인트 정보       -->
        
        <div class="coupon_points_card">
          <div class="card_heading"><span>쿠폰/포인트</span></div>

          <p class="points_header">쿠폰</p>
          <div class="coupon_line1">
            <input type="text" name="apply_coupons" placeholder="보유쿠폰 0장" id="apply_coupons" size=43 readonly>
          <span><button>쿠폰적용</button></span>
          </div>


          
            <p class="points_header">쿠폰번호</p>
          <div class="coupon_line2">
            <input type="text" name="my_coupon_id" placeholder="쿠폰 번호 입력" id="coupon_id" size=43>
            <span><button>코드확인</button></span>
          </div>

          <p class="points_header">포인트</p>
          <div class="coupon_line3">
            <input type="text" name="my_coupon_points" id="#my_coupon_points" placeholder="0" size=43>
            <span><button>전액사용</button></span>
</div>
            <div class="point_paragraphs"><br>
              <p class="points_header">보유 포인트 1,0000</p>
              <p>1,0000 포인트 이상 보류 시 10,000원 이상 구매시</p>
              <p>주문장 최대 30000원 포인트까지 사용 가능</p>
            </div>
          
        </div>
      </div>
        
      <!--     /* COLUMN 2(RIGHT SIDE) 최종결제금액 */       -->
      <div class="checkout_right_section">

        <div class="checkout_total_card">
          <div class="checkout_total_outside">
            <div class="checkout_heading">최종결제금액</div>

            <div class="checkout_total_inside">
              <div class="checkout_total_card_line1">

                <div class="card_cart_total_row_left">상품가격</div>
                <div class="card_cart_total_row_right" style="float:right">350,000원</div>
              </div><br>

              <div class="checkout_total_card_line2">

                <div class="card_cart_deliveryfee_row_left">배송비</div>
                <div class="card_cart_deliveryfee_row_right">+3,000원</div>
              </div>
              <hr class="transition">

              <div class="checkout_total_card_line3">
                <div class="card_cart_grandtotal_row_left">총 결제금액(3개)</div>
                <span class="card_cart_grandtotal_row_right" style="font-size:1.2em">353,000원</span>
              </div>

            </div>
          </div>
        </div>

        <div class="checkout_method_card">
          <div class="checkout_method_card_outside_wrapper">
            <div class="checkout_heading">결제수단</div>
            <div class="checkout_radio_option_container_wrap">
              <div class="checkout_radio_option_container">
					
                <label for="credit" for="pay_type">
                  <input type="radio" name="pay_type" class="pay" id="credit" value="credit1">
                  신용카드
                </label>

                <label for="transfer" for="pay_type">
                  <input type="radio" name="pay_type" id="transfer" class="pay" value="transfer1">
                  계좌이체
                </label>

                <label for="payco" for="pay_type">
                  <input type="radio" name="pay_type" id="payco" class="pay" value="payco1">
                  PAYCO
                </label>

                <label for="kakao" for="pay_type">
                  <input type="radio" name="pay_type" id="kakao" class="pay" value="kakaopay1">
                  KakaoPay
                </label>

              </div>
            </div>
          </div>
        </div>

        <div class="checkout_terms_card">
          <div class="terms_outside_wrapper">
            <div class="terms_inside_wrapper">
              <div class="terms_wrapper">
                <div class="terms_line1">
                  <label for="terms_agree_all">
                    <input type="checkbox" name="terms_agree_all" id="terms_agree_all" onclick='selectAll(this)'>전체동의
                  </label>
                </div><br>

                <div class="terms_line2">
                  <label for="terms_agreement">
                    &nbsp;<span style='font-size:10px;'></span>&#9493;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="terms_agree_all" id="terms_agreement" onclick='selectAll(this)'>구매조건 확인 및 결제진행에 동의</label>
                </div>
              </div>
            </div>
          </div>
          <div class="terms_agree_button_wrapper">
            <div class="btn_shape"><a class="pay_btn" href="#">결제하기</a> </div>
          </div>
        </div>
      </div>

    </div>
  </div>

</body>

<script>

	//주소검색 버턴
	$("#btn_search_address").on("click",function(){
		new daum.Postcode({
			oncomplete:function(data){
				console.log(data);
				
				$("#delivery_addy1").val(data.address);
				$("#zipcode").val(data.zonecode);
				
			}
		}).open();
	})	
	
	/* <!--  (checkout_shipping_info_card)       --> */	
	//주소 찾기 버턴
	$(".checkout_container_main").on("click",".pay_btn",function(){
		/* alert("결제하기"); */
		
		/*card1=checkout_shipping_info_card(배송정보 : 주소 )  */
		var card1 = $(".checkout_shipping_info_card");
		var receiver = card1.find("#order_receiver").val();
		var contact = card1.find("#delivery_contact").val();
		var zipcode = card1.find("#zipcode").val();
		var address1 = card1.find("#delivery_addy1").val();
		var address2 = card1.find("#delivery_addy2").val();
		/* alert("receiver"+receiver+"\n"+"contact:"+contact+"\n"+"zipcode:"+zipcode+"\n"+"address1:"+address1+"\n"+"address2:"+address2+"\n");  */
		
		/*card2=coupon_points_card(포인트 정보)  */
		var card2 = $(".coupon_points_card");
		var applycoupon = card2.find("#apply_coupons").val();
		var couponid = card2.find("#coupon_id").val();
		var mycoupon = card2.find("#my_coupon_points").val();
		
		/*card3=checkout_method_card(결제수단)  */
		var card3 = $(".checkout_method_card");
	
		//결제수단 가저오기
		if ($('input[class="pay"]:checked').length === 0){
		alert("결제 수단을 선택 하세요!"); 
		return;
		}else{
			var select_pay_type = document.getElementsByName('pay_type');
			for(i = 0; i < select_pay_type.length; i++){
				if(select_pay_type[i].type="radio"){
					if(select_pay_type[i].checked)
						var paytype=select_pay_type[i].value;
				}
		   
		} //for
			
		} //else
		
		//유효성 체크
		if(receiver==''||null){
		alert("주문자 정보를 입력 하세요!");
		$("#order_receiver").val();	
		}else if(contact==''||null){
		
		alert("연락처를 입력하세요!")
		$("#delivery_contact").val();	
		}else if(address1==''||null){
			alert("배송지를 입력하세요!");
			$('input[name=delivery_address1]').focus();
			
		}else if ($('input[class="agree"]:checked').length === 0){
			 alert("구매조건 확인 및 결제진행에 동의하여 주시기 바랍니다.");
			 return;
		}
		
		
		
		
	
	});
		
		//Checkbox - SelectALL
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName('terms_agree_all');
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  });
			}
		
		//Checkbox - SelectNone
		function selectNone(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName('terms_agree_all');
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.unchecked;
			  });
			}
 
		
	


</script>
</html>