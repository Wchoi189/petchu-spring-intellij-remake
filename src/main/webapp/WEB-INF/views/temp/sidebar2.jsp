<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/sidebar.css">
<title>side menu bar</title>

<!-- Sidebar Version 2-->
<div class="mypage_navbar">
	<nav class="mypage_navigation">
		<ul class="menu_list">
			<li class="nav_item"><a href="/mypage/myinfo"
				aria-current="page"
				class="mypage-nav__list-link router-link-exact-active active"><span>보호자
						정보관리</span></a><hr class="menu_hr"></li>
			<li class="nav_item"><a href="/mypage/mypet"
				class="nav_link"><span>마이펫 관리</span></a><hr class="menu_hr"></li>
			<li class="nav_item"><a href="/mypage/reservation"
				class="nav_link"><span>예약 목록</span></a><hr class="menu_hr"></li>
			<li class="nav_item"><a href="/mypage/pass"
				class="nav_link"><span>열람권 목록</span></a><hr class="menu_hr"></li>
			
			<!--후기 관리 -->
			<li class="nav_item"><a href="/mypage/review"
				class="nav_link"><span>후기
						관리</span></a><hr class="menu_hr">
					
					<ul class="menu_sub1">
							<li><a href="/mypage/review/hospital"
								class="submenu_link"><i class="arrow"></i><span>병원
										후기</span></a></li>
							<li><a href="/mypage/review/pharmacy"
								class="submenu_link"><i class="arrow"></i><span>약국
										후기</span></a></li>
							<li><a href="/mypage/review/company"
								class="submenu_link"><i class="arrow"></i><span>업체
										후기</span></a></li>
						</ul>
			</li>
				
			<!-- 게시글 관리 -->
			<li class="nav_item_B"><a href="/mypage/post"
				class="nav_link_sub"
				data-toggle="opened"><span>게시글 관리</span></a><hr class="menu_hr">
					<ul class="menu_sub1">
						<li><a href="/mypage/post/marketplace"
							class="submenu_link"><i class="arrow"></i><span>무료나눔·체험단</span></a></li>
						<li><a href="/mypage/post/petcafe"
							class="submenu_link"><i class="arrow"></i><span>반려동물
									꿀팁</span></a></li>
						<li><a href="/mypage/post/mypet"
							class="submenu_link"><i class="arrow"></i><span>펫스타그램</span></a></li>
					</ul>
			</li>
			
			<!-- 메세지 관리 -->
			<li class="nav_item_B"><a href="/mypage/message"
				class="mypage-nav__list-link mypage-nav__level--0"
				data-toggle="opened"><span>메세지 관리</span></a><hr class="menu_hr">
				<ul class="menu_sub2">
						<li><a href="/mypage/message/received"
							class="submenu_link"><i class="arrow"></i><span>받은메세지</span></a></li>
						<li><a href="/mypage/message/sent"
							class="submenu_link"><i class="arrow"></i><span>보낸메세지</span></a></li>
				</ul>
			</li>
			
			<!--마지막 두개 링크  -->
			<li class="nav_item_B"><a href="/mypage/point"
				class="submenu_link"><span>포인트 관리</span></a><hr class="menu_hr"></li>
			<li class="nav_item"><a href="/mypage/questions"
				class="submenu_link"><span>1:1 문의</span></a><hr class="menu_hr"></li>
		</ul>
	</nav>
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


