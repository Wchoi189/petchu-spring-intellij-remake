<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<link href="/resources/css/review_list.css" rel="stylesheet"/>
</head>
<div id="page">
	<div class="review_container">
		<div class="page_title">
			<h2>리뷰 관리</h2>
		</div>
			<form name="frm">
				<input type="hidden" name="page" value="${page}">
			</form>
		<div class="page_info">
			<c:forEach items="${join}" var="vo">
			<div class="whole">
				<input type="hidden" class="pno" value="${vo.pno}">
				<input type="hidden" class="bno" value="${vo.bno}">
				<div class="content">
					<div id="p_img">
						 <img src="${vo.pimage}" width=200 height=200/>
					</div>
				<div class="p_info_c">
	                <div class="p_3">
		                <div class="p_info">
		                  <div id="pname">
		                    <div>${vo.pname} | ${vo.amount}개</div>
		                  </div>
		                </div>
		              <div class="odate_c">
		                <div class="odate">
		                  <div id="odate">
		                  <fmt:formatDate value="${vo.odate}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;배송
		                  </div>
		                </div>
		                <div class="button">
		                  <div id="r_insert">
		                    <button type="button" class="btn_insert">리뷰작성</button>
		                  </div>
		                </div> <!-- /button -->
		              </div> 
					</div>
				</div>
				</div>		
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="pagination"> 
		<c:if test="${pm.prev}">
			<a href="${pm.startPage-1}">&laquo;</a>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<a href="${i}" class=<c:out value="${page==i?'active':''}"/>>${i}</a>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">&raquo;</a>
		</c:if>
	</div>
</div>
<script>
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		$(frm.page).val(page);
		frm.action="reviewable";//url이 list라 해도 되고 안해도 되고
		frm.submit();
	});
	
 	//insertbutton
           $(".button").on("click", ".btn_insert", function(){
           var pno = $(this).closest(".whole").find(".pno").val();
           var bno = $(this).closest(".whole").find(".bno").val();
           location.href="insert?pno=" + pno + "&bno=" +bno;	
        })

	
</script>