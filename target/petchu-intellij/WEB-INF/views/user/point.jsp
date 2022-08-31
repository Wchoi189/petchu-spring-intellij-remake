<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/resources/css/point.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<fmt:formatNumber type="number" maxFractionDigits="3" value="${point}" var="commaPoint"/>
<div id="pointbox">
	<span id="savepointinfo">보유 포인트 </span>
	<img src="/resources/coin.png">
	<span id="savepointreal"> &nbsp;&nbsp;&nbsp; ${commaPoint}</span>
	<span id="pointp">point</span>
</div>
<div id="pointadd">
	<p class="title">포인트 사용내역</p>
	<c:forEach items="${pointhistory}" var="vo">
		<table>
			<tr>
				<c:set var="amount" value="${vo.amount}"/>
				<c:if test="${fn:contains(amount, '-')}">
					<c:set var="ramount" value="${fn:split(amount, '-')[0]}"/>
					<td width=100 style="text-align:right">
						-<fmt:formatNumber type="number" maxFractionDigits="3" value="${ramount}"/>
					</td>
				</c:if>
				<c:if test="${not fn:contains(amount, '-')}">
					<td width=100 style="text-align:right">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${amount}"/>
					</td>
				</c:if>
				<c:set var="content" value="${vo.content}"/>
				<c:if test = "${fn:contains(content, '사용')}">
					<td width=50 style="color:red">사용</td>
				</c:if>
				<c:if test = "${fn:contains(content, '적립')}">
					<td width=50 style="color:blue">적립</td>
				</c:if>
				<c:if test = "${not fn:contains(content, '사용')}">
					<td width=200 style="color:black">${vo.content}</td>
				</c:if>
				<c:if test = "${not fn:contains(content, '적립')}">
					<td width=200 style="color:black">${vo.content}</td>
				</c:if>
				<td width=200>${vo.regdate}</td>
			</tr>
		</table>
	</c:forEach>
</div>	
<script>
</script>