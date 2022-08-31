<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="/resources/temp_page.css" rel="stylesheet">
<h1>작업공간</h1>

<div id="temp_page">
	<div id="temp_menu">
		<h2>Menu:</h2><hr style="width:150px">
		<a href="/temp/api_search">API검색</a><br/> 
		<a href="/temp/list">상품목록</a><br/>
		<a href="/temp/payment_request">결제 페이지</a><br/>
		<a href="/temp/register">회원가입</a><br/>
		<a href="/temp/shopping_cart">장바구니</a><br/>
		<a href="/temp/checkout">결제 페이지</a><br/>
	</div>
	<br><br>
	
	<div id="temp_heading">
		<h1>sidebar1(div 형식)  /  sidebar2(list 형식)</h1> 
	</div><br>
	
	<div id="menu_container">
		<div>
			<a>
				<jsp:include page="sidebar1.jsp"/>
			</a>
		</div>
	
		<div>
			<a>
				<jsp:include page="sidebar2.jsp"/>
			</a>
		</div>
	</div>
</div>