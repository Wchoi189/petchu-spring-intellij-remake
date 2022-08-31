<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/request.css" rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main">
  <input type="radio" class="RadioTab" id="tab-1" name="show" checked/>
  <input type="radio" class="RadioTab" id="tab-2" name="show" />
  <input type="radio" class="RadioTab" id="tab-3" name="show" />
  <input type="radio" class="RadioTab" id="tab-4" name="show" />
  <div class="tab">
    <label for="tab-1">병원 견적서</label>
    <label for="tab-2">미용 견적서</label>
    <label for="tab-3">홈 클리닝 견적서</label>
    <label for="tab-4">레슨 견적서</label>
  </div>
  <div class="contentss">
    <div class="content-dis">
      <div class="doctor_box" id="listbody">
      		<c:choose>
      			<c:when test="${list != null}">
					<c:forEach items="${list}" var="vo">
						<div class="menu_box" drno="${vo.drno}" id="menu_box1">
							<p class="dname">${vo.dname}</p>
							<p>${vo.pname}</p>
							<p>${vo.drdisease}</p>
							<p class="drprice">${vo.drprice}원</p>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
			</div>
    </div>
    <div class="content-dis">
      <div id="content-dis1"><h2 id="text1" style="display:none;">요청서 작성 후 견적서를 받을 수 있습니다</h2></div>
			<script id="temp1" type="text/x-handlebars-template">
				<h2 id="unpopular1" style="display:none;">견적서를 작성한 업체가 없습니다.</h2>
				{{#each .}}
					<div class="menu_box1" scno="{{scno}}">
						<p class="dname">{{scname}}</p>
						<p>{{sedate}}</p>
						<p class="ellipsis">{{description}}</p> </br>
						<p class="drprice">{{display price}}</p>
					</div>
				{{/each}}
			</script>
    </div>
   
    <div class="content-dis">
      <div id="content-dis2"><h2 id="text2" style="display:none;">요청서 작성 후 견적서를 받을 수 있습니다</h2></div>
    		<script id="temp2" type="text/x-handlebars-template">
    			<h2 id="unpopular2" style="display:none;">견적서를 작성한 업체가 없습니다.</h2>
   				{{#each. }}
					<div class="menu_box2" scno="{{scno}}">
						<p class="dname">{{scname}}</p>
						<p>{{sedate}}</p>
						<p class="ellipsis">{{description}}</p> </br>
						<p class="drprice">{{price}}원</p>
					</div>
				{{/each}}
			</script>	
    </div>
    <div class="content-dis">
      <div id="content-dis3"><h2 id="text3" style="display:none;">요청서 작성 후 견적서를 받을 수 있습니다</h2></div>
    		
    		<script id="temp3" type="text/x-handlebars-template">
    			<h2 id="unpopular3" style="display:none;">견적서를 작성한 업체가 없습니다.</h2>
   				{{#each. }}
					<div class="menu_box3" scno="{{scno}}">
						<p class="dname">{{scname}}</p>
						<p>{{sedate}}</p>
						<p class="ellipsis">{{description}}</p> </br>
						<p class="drprice">{{price}}원</p>
					</div>
				{{/each}}
			</script>	
    </div>
   </div>
 </div>
  <script>
    Handlebars.registerHelper("display", function(price){
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
     });
   </script>
 <script>
	var brno="${bvo.brno}";
	var crno="${cvo.crno}";
	var lrno="${lvo.lrno}";
	
	var target1 = document.getElementById("text1");
	var target2 = document.getElementById("text2");
	var target3 = document.getElementById("text3");
	
	var RadioTab = document.getElementsByClassName("RadioTab");
	
	for(r=0; r < RadioTab.length; r++){
		RadioTab[r].addEventListener('click', function(){
	    console.log('function ON');
	    console.log(this.id);
	    switch(this.id){
	        case "tab-2" :
	        	if(brno == ""){
	        		target1.style.display = 'block';
	        	}else{
	        		$.ajax({
	        			type: "post",
	        			url : "/request/belist.json",
	        			data : {brno:brno},
	        			success:function(data){
	        				var template = Handlebars.compile($("#temp1").html());
	        				$("#content-dis1").html(template(data));
	        				
	        				if(data == ""){
	        					$("#unpopular1").css({display:"block"});
	        				}
	        			}
	        		});
	        	}
	            break;
	        case "tab-3" :
	        	if(crno == ""){
	        		target2.style.display = 'block';
	        	}else{
	        		$.ajax({
	        			type: "post",
	        			url : "/request/celist.json",
	        			data : {crno:crno},
	        			success:function(data){
	        				var template = Handlebars.compile($("#temp2").html());
	        				$("#content-dis2").html(template(data));
	        				
	        				if(data == ""){
	        					$("#unpopular2").css({display:"block"});
	        				}
	        			}
	        		});
	        	}
	            break;             
	        case "tab-4" :
	        	if(lrno == ""){
	        		target3.style.display = 'block';
	        	}else{
	        		$.ajax({
	        			type: "post",
	        			url : "/request/lelist.json",
	        			data : {lrno:lrno},
	        			success:function(data){
	        				var template = Handlebars.compile($("#temp3").html());
	        				$("#content-dis3").html(template(data));
	        				
	        				if(data == ""){
	        					$("#unpopular3").css({display:"block"});
	        				}
	        			}
	        		});
	        	}
	            break;
	    }
	});
	}
	
	
	$(".menu_box").on("click", function(){
		var drno = $(this).attr("drno");
		location.href = "/request/resultread?drno=" + drno;
	});
	$("#content-dis1").on("click", ".menu_box1", function(){
		var scno = $(this).attr('scno');
		location.href = "/request/beread?brno=" + brno +"&scno=" + scno;
	});
	$("#content-dis2").on("click", ".menu_box2", function(){
		var scno = $(this).attr('scno');
		location.href = "/request/ceread?crno=" + crno +"&scno=" + scno;
	});
	$("#content-dis3").on("click", ".menu_box3", function(){
		var scno = $(this).attr('scno');
		location.href = "/request/leread?lrno=" + lrno +"&scno=" + scno;
	});
	
</script>
    