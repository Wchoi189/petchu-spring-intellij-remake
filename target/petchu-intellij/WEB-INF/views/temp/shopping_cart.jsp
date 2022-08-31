<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link href="/resources/temp_page.css" rel="stylesheet">


<div class="shopping_cart_page">
	<table id="cart_table"></table>
	<h1 style="text-align:left; margin-left:20px;">장바구니</h1>
	<table class="cart_table">
		<tr class="tr_th">
			<th><input type="checkbox" name="chkall" class="item_all"></th>
			<th class="th_chklabel" colspan=1>전체선택</th>
			<th class="th_item">item</th>
			<th class="th_price">가격</th>
			<th class="th_qnt">수량</th>
			<th class="th_delivery">배송비</th>
			<th class="th_subtotal">소계</th>
			<th class="th_cart_delete"></th>
		</tr>
		<tr>
			<td class="td_chk"><input type="checkbox" name="cart_chk" class="item_chk"></td>
			<td class="cart_img"><img src="http://placehold.jp/60x60.png" width=80></td>
			<td class="td_item">쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개 쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개</td>
			<td class="td_price">5,000</td>
			<td class="td_qnt">4개</td>
			<td class="td_delivery">3,0000</td>
			<td class="td_subtotal">20,000</td>
			<td class="td_cart_delete"><img src="/resources/trash_icon.png" width=15></td>
		</tr>
		<tr>
			<td class="td_chk"><input type="checkbox" name="cart_chk" class="item_chk"></td>
			<td class="cart_img"><img src="http://placehold.jp/60x60.png" width=80></td>
			<td class="td_item">쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개 쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개</td>
			<td class="td_price">5,000</td>
			<td class="td_qnt">4개</td>
			<td class="td_delivery">3,0000</td>
			<td class="td_subtotal">20,000</td>
			<td class="td_cart_delete"><img src="/resources/trash_icon.png" width=15></td>
		</tr>
		<tr>
			<td class="td_chk"><input type="checkbox" name="cart_chk" class="item_chk"></td>
			<td class="cart_img"><img src="http://placehold.jp/60x60.png" width=80></td>
			<td class="td_item">쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개 쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개</td>
			<td class="td_price">5,000</td>
			<td class="td_qnt">4개</td>
			<td class="td_delivery">3,0000</td>
			<td class="td_subtotal">20,000</td>
			<td class="td_cart_delete"><img src="/resources/trash_icon.png" width=15></td>
		</tr>
		<tr>
			<td class="td_chk"><input type="checkbox" name="cart_chk" class="item_chk"></td>
			<td class="cart_img"><img src="http://placehold.jp/60x60.png" width=80></td>
			<td class="td_item">쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개 쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개</td>
			<td class="td_price">5,000</td>
			<td class="td_qnt">4개</td>
			<td class="td_delivery">3,0000</td>
			<td class="td_subtotal">20,000</td>
			<td class="td_cart_delete"><img src="/resources/trash_icon.png" width=15></td>
		</tr>
		<tr>
			<td class="td_chk"><input type="checkbox" name="cart_chk" class="item_chk"></td>
			<td class="cart_img"><img src="http://placehold.jp/60x60.png" width=80></td>
			<td class="td_item">쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개 쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개쓰담스틱 3종 맛 선택 (50g) 쓰담스틱 닭가슴살(50g) 1팩 / 2개</td>
			<td class="td_price">5,000</td>
			<td class="td_qnt">4개</td>
			<td class="td_delivery">3,0000</td>
			<td class="td_subtotal">20,000</td>
			<td class="td_cart_delete"><img src="/resources/trash_icon.png" width=15></td>
		</tr>		
		<tr>
			<td class="cart_space" colspan=3 rowspan=3></td>
			<td class="cart_total1" colspan=3 rowspan=3>
				<p>상품가격</p>
				<p>배송비</p>
				<p>적립예정 포인트</p>
			</td>
			<td class="cart_total2" colspan=2 rowspan=3>
				<p>100,000</p>
				<p>3,000</p>
				<p>200포인트</p>
			</td>
		</tr>	
	</table>
	
	<table>
		<tr>
			<td width=100 class="cartitem_delete"><button class="btndelete">선택삭제</button></td>
			<td class="cart_space" width=500></td>
			<td class="cart_total3" colspan=3 rowspan=3>
				<h2 class="total_field">결제금액</h2>
			</td>
			<td class="cart_total4" colspan=2 rowspan=3 width=140>
				<h3 class="total_amt">103,000원</h3>
			</td>
		</tr>
	</table>
</div>

<script>

</script>