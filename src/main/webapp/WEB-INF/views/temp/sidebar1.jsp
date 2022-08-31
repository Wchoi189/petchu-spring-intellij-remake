<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/sidebar.css">

<!-- Sidebar Version 1-->
<div class="nav_bar_left">
  <h3 class="items_container"></h3>
  <a href="#" class="menu_item">보호자 정보관리</a><br><hr class="menu_hr">
  <a href="#" class="menu_item">마이펫 관리</a><br><hr class="menu_hr">
  <a href="#" class="menu_item">예약 목록</a><br><hr class="menu_hr">
  <a href="#" class="menu_item">열람권 목록</a><br><hr class="menu_hr">
  <a href="#" class="menu_item ">후기 관리</a><hr class="menu_hr">
 	<div class="menu_item_sub">
	 	<a href="#" class="sub_item">병원 후기</a><br>
	  	<a href="#" class="sub_item">약국 후기</a><br>
	  	<a href="#" class="sub_item">업체 후기</a><br>
	</div><br>

  <a href="#" class="menu_item">게시글 관리</a><hr class="menu_hr">
   	<div class="menu_item_sub">
	 	<a href="#" class="sub_item">무료나눔 체험단</a><br>
	  	<a href="#" class="sub_item">반려동물 꿀팁</a><br>
	  	<a href="#" class="sub_item">펫스타그램</a><br><br>
	</div>
  <a href="#" class="menu_item">메시지 관리</a><br><hr class="menu_hr">
   	<div class="menu_item_sub">
	 	<a href="#" class="sub_item">받은 메시지</a><br>
	  	<a href="#" class="sub_item">보낸 메시지</a><br><br>
	</div>
  <a href="#" class="menu_item">포인트 관리</a><br><hr class="menu_hr">
  <a href="#" class="menu_item">1:1 문의</a><br><hr class="menu_hr">
</div>


<script>
$(function(){
    // 창에 있는 주소 링크 가져온다
    var url = window.location.href; 

    // 각 a 태그에게 적용
    $("#sub-header a").each(function() {
            // checks if its the same on the address bar
        if(url == (this.href)) { 
            $(this).closest("li").addClass("active");
        }
    });
});
 
</script>


