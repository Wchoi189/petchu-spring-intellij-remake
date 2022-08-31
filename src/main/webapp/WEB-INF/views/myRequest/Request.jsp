<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
.middlePrame {
	margin: 10px;
	width : 760px;
	padding: 10px;
	background-color: A7CA37;
	font-size: 20px;
	font-weight: bold;
	margin-left: 200px;
}

.btnPrame {
	color: navy;
	font-size: 15px;
	cursor: pointer;
}

.smallPrame {
	display: none;
	margin: 10px;
	padding: 10px;
	width : 900px;
	margin-left : 200px;
}

.myList hr {
	width : 750px;
	margin-left : 0px;
}
#sidemenu{
	margin-left: -100px;
}
</style>
<div class="myList" style="text-align : left;">
	<div id="sidemenu">
		<jsp:include page="/WEB-INF/views/user/mypageSidemenu.jsp"/>
	</div>
	<h1>작성한 요청서</h1>
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">미용</p>
			<p class="btnPrame">상세보기</p>
		</div>
		<div class="smallPrame">
		<c:choose>
			<c:when test="${bvo != null}">
					<button class="deadline" id="deadline1">요청서 마감처리</button>
					<h3>1. 반려동물 분류</h3>
					<span>${bvo.pcate}</span>
					<hr />
					<h3>2. 원하는 서비스</h3>
					<span>${bvo.beauty_classification}</span>
					<hr />
					<h3>3. 반려동물의 체중</h3>
					<span>${bvo.weight}</span>
					<hr />
					<h3>4. 반려동물의 나이</h3>
					<span>${bvo.age}</span>
					<hr />
					<h3>5. 마지막 미용시기</h3>
					<span>${bvo.last_beautydate}</span>
					<hr />
					<h3>6. 진행방법</h3>
					<span>${bvo.service_place}</span>
					<hr />
					<h3>7. 희망서비스일</h3>
					<span>${bvo.wish_date}</span>
					<hr />
					<h3>8. 서비스 희망 지역</h3>
					<span>${bvo.wish_local1} ${bvo.wish_local2}</span>
					<hr />
					<h3>9. 서비스 관련 문의 및 세부사항</h3>
					<p>${bvo.detailed_matters}</p>
				</c:when>
			<c:when test="${bvo == null}">
				<p>작성한 요청서가 없습니다</p>
			</c:when>
		</c:choose>
			
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">홈 클리닝</p>
			<p class="btnPrame">상세보기</p>
		</div>
		<div class="smallPrame">
			<c:choose>
			<c:when test="${cvo != null}">
					<button class="deadline" id="deadline2">요청서 마감처리</button>
					<h3>1. 건물유형</h3>
					<span>${cvo.building_classification}</span>
					<hr />
					<h3>2. 집 면적</h3>
					<span>${cvo.house_size}</span>
					<hr />
					<h3>3. 클리닝을 원하는 날</h3>
					<span>${cvo.wish_date}</span>
					<hr />
					<h3>4. 원하는 지역</h3>
					<span>${cvo.wish_local1} ${cvo.wish_local2}</span>
					<hr />
					<h3>5. 클리닝 관련 희망사항</h3>
					<p>${cvo.hope_matters}</p>
				</c:when>
			<c:when test="${cvo == null}">
				<p>작성한 요청서가 없습니다</p>
			</c:when>
		</c:choose>
		</div>
	</div>
	
	<div class="bigPrame">
		<div class="middlePrame">
			<p class="scname" style="color: white;">레슨</p>
			<p class="btnPrame">상세보기</p>
		</div>
		<div class="smallPrame">
			<c:choose>
			<c:when test="${lvo != null}">
					<button class="deadline" id="deadline3">요청서 마감처리</button>
					<h3>1. 원하는 레슨 분류</h3>
					<span>${lvo.lesson_classification}</span>
					<hr />
					<h3>2. 레슨 받는 목적</h3>
					<span>${lvo.lesson_goal}</span>
					<hr />
					<h3>3. 레슨 형태</h3>
					<span>${lvo.lesson_method}</span>
					<hr />
					<h3>4. 연령</h3>
					<span>${lvo.age}</span>
					<hr />
					<h3>5. 성별</h3>
					<span>${lvo.gender}</span>
					<hr />
					<h3>6. 선호하는 강사 성별</h3>
					<span>${lvo.wish_gender}</span>
					<hr />
					<h3>7. 레슨 받기 좋은 날짜</h3>
					<span>${lvo.wish_date}</span>
					<hr />
					<h3>8. 희망하는 레슨 시간대</h3>
					<span>${lvo.wish_time}</span>
					<hr />
					<h3>9. 진행 방법</h3>
					<span>${lvo.wish_local1} ${lvo.wish_local2}</span>
					<hr />
					<h3>10. 원하는 지역</h3>
					<span>${lvo.lesson_place}</span>
					<hr />
					<h3>11. 레슨 관련 문의사항</h3>
					<p>${lvo.detailed_matters}</p>
				</c:when>
			<c:when test="${lvo == null}">
				<p>작성한 요청서가 없습니다</p>
			</c:when>
		</c:choose>
		</div>
	</div>
</div>
<script>
	var brno="${bvo.brno}";
	var crno="${cvo.crno}";
	var lrno="${lvo.lrno}";
	
	var deadlines = document.getElementsByClassName("deadline");
	
	for(i=0; i < deadlines.length; i++){
		deadlines[i].addEventListener('click', function(){
		if(!confirm("요청서를 마감하시겠습니까?")) return;
	    console.log('function ON');
	    console.log(this.id);
	    switch(this.id){
	        case "deadline1" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/bisDeleteUpdate",
	        		data : {brno:brno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;
	        case "deadline2" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/cisDeleteUpdate",
	        		data : {crno:crno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;             
	        case "deadline3" :
	        	$.ajax({
	        		type: "post",
	        		url : "/user/lisDeleteUpdate",
	        		data : {lrno:lrno},
	        		success:function(){
	        			location.reload();
	        		}
	        	});
	            break;
	    }
	});
	}
	
	$(".middlePrame").on("click", ".btnPrame", function() {
		var target = $(this).closest('.bigPrame').find('.smallPrame');
		//     target.toggleClass("hidden")
		if (target.css("display") == "none") {
			target.show();
		} else {
			target.hide();
		}
	});
</script>