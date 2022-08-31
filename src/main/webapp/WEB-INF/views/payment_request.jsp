<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/wb.css" rel="stylesheet" >	

<style>

</style>
<div id="page_cart">
	<div id="pay_status">
		<img src="/resources/pay_status.png" width=400/>
	</div>
		<div class="cart_header">
			
		</div>
			<div class="customer_info">
				<table class="customer_table">
					<tbody>
						<!-- ROW 1: 상품정보 -->
						<tr>
							<td class="customer_col1" width=200>상품명</td>
							<td class="customer_col2">7일 열람권</td>
						</tr>
						<!-- ROW 2: 상품가격 -->
						<tr>
							<td class="price_col3">상품가격</td>
							<td class="price_col4">10,000원</td>
						</tr>
						<!-- ROW 3: 보유 포인트 -->
						<tr>
							<td class="point_col1">보유 포인트</td>
							<td class="point_col2">5000P</td>
						</tr>
						<!-- ROW 4: 표인트 사용 -->
						<tr>
							<td class="point_col3" rowspan="3">포인트 사용</td>
							<td class="point_col4"><input type="text" placeholder="0" size=100%/></td>
						</tr>
						<tr>				
							<td><button class="tealSmall">모든 포인트 사용</button></td>
						<tr>
						<!-- ROW 5: 상품정보 -->
						<tr>
							<td class="payment_col1">최종 결제 금액</td>
							<td class="payment_col2">10,000원</td>
						</tr>
					</tbody>
				</table>
					
					<div class="payment_btm">
						<!-- checkbox -->
						<div class="formdivider">
							<form>
								<input type="checkbox" id="chk" name="agreechk" onclick='selectAgree(this)'>
								<span class="teal_text">구매약관</span>&nbsp;<label for="chk">내용에 동의합니다</label><br>
							</form>			
						</div>
								
						<div class="btn_container">
						  <button class="tealBig">결제신청</button>
						</div>
					</div>
				</div>
		
		<script>
		
		/* 포인트 사용 버턴  */
		 $(".tealSmall").on("click",function(){
			 alert("모든 포인트 사용");
		 });
		 
		/* 결제 버턴 */
		 $(".tealBig").on("click",function(){
			 alert("결제신청");
		 });
		
		 $(".formdivider .chk:checked").each(function() {
		  alert("hello");
		 });
		 
		 //약관 동의 체크 박스
		 function selectAgree()  {
			  const checkbox 
			       = document.getElementById('chk');
			
			  if (checkbox.checked == true){
				    alert("hello");
				  } else {
				    text.style.display = "none";
				  }
			  }
			
		</script>
		
	<!-- <div class="delieverAddress">
		<h2 class="cart_header">받은사람정보</h2>
		<button class="deliver_address_change">배송지변경</button>
		<table class="delivery_table twidth">
			<tbody>
				<tr>
					<td class="delivery_col1 ctitle">이름</td>
					<td class="delivery_col2">홍길동</td>
				</tr>
				<tr>
					<td class="delivery_col3 ctitle">배송주소</td>
					<td class="delivery_col4">인천광역시 학익동 인천일보아카데미 5층</td>
				</tr>
				<tr>
					<td class="delivery_col5 ctitle">연락처</td>
					<td class="delivery_col6">010-1234-5678</td>
				</tr>
				<tr>
					<td class="delivery_col7 ctitle">배송요청상황</td>
					<td class="delivery_col8">
						<span>일반 : 문 앞 &nbsp;/&nbsp;</span>
						<span>문 앞 (자유 출입가능)</span>
						<button class="delivery_request">변경</button>
					</td>					
				</tr>
			</tbody>
		</table>
	</div>
	<div class="option_area">
		<h3>옵션</h3>
		<h3>옵션</h3>
	</div>
	<div class="shipping">
		<h2 class="shipping_header">배송{{AJAX}}건</h2>
	</div>
	<div class="payment_info">
		<table class="payment_table twidth">
			<tbody>
				<tr>
					<td class="payment_col">총상품가격</td>
					<td class="payment_col">200,000</td>
				</tr>
				<tr>
					<td class="payment_col">할인쿠폰</td>
					<td class="payment_col">2000P</td>
				</tr>
				<tr>
					<td class="payment_col">배송비</td>
					<td class="payment_col">5,000</td>
				</tr>
				<tr>
					<td class="payment_col">총경제금액</td>
					<td class="payment_col">400,000</td>
				</tr>
				<tr>
					<td class="payment_col" rowspan=5>결제방법</td>
					
				</tr>
				
				<tr>
					<td class="delivery_col7">배송요청사랑</td>
					<td class="delivery_col8">
						<span>일반 : 문 앞 &nbsp;/&nbsp;</span>
						<span>문 앞 (자유 출입가능)</span>
						<button class="delivery_request">변경</button>
					</td>					
				</tr>
			</tbody>
		</table>
	</div>
	<div class="receipt"></div> -->
</div>