<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/wb.css" rel="stylesheet" >


<div id="page">
	<h1>API 쇼핑 검색</h1>
	
	<!-- 검색창 -->
	<form name="frm"
		style="width: 960px; margin: 0px auto; margin-bottom: 10px">
		<input type="text" name="query">
		<button type="submit">검색</button>
		검색수: <span id="count"></span> 건
	</form>
	
	<div style="margin:20px;">
		<input type='checkbox' name='prd' value='selectall' onclick='selectAll(this)'/><b>전부선택</b><button style="margin-left:20px;" class="btnins">선택상품저장</button>
	</div>
	
	<div id="api_container">
	<div id="api_div" style="width:960px"></div>
	
	<script id="temp" type="text/x-handlebards-template">
		{{#each items}}				
			<div class="api_box">
				<div class="number"><input type="checkbox" class="chk" name="prd"></div>
				<div style="margin:0px auto;text-align:center;"><img src="{{image}}" width=120 height=120 class="image"></div>
				<div class="title"><b>{{tagless title}}</b></div>
				<div class="maker">{{maker}}</div>
				<div class="brand">{{brand}}</div>
				<div class="category1" category1="{{category1}}" category2="{{category2}}">{{category1}}/{{category2}}</div>
				<div class="category3" category3="{{category3}}" category4="{{category4}}">{{category3}}/{{category4}}</div>
				<div class="price">{{display lprice}}</div>
				
			</div>
		{{/each}}
</script>
	
	 	<div id="pageBtn" style="margin:50px auto;text-align:center; width:900px;">
	 		<button id="prev">이전</button>
	 		<span id="curpage"></span>
	 		<button id="next">다음</button>
	 	</div>
	
	</div>
 </div>
 
 <nav aria-label="...">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active">
      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>

<script>
	Handlebars.registerHelper("display", function(lprice) {
		return lprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	})
	Handlebars.registerHelper("tagless", function(title) {
		return title.toString().replace(/(<([^>]+)>)/ig,"");
	})
</script>

<script>

//초기 페이지

var query="강아지 사료";
var page=1;
var display=50;

 
getList();

//Button:Prev
$("#prev").on("click",function(){
	page--;
	getList();
});

//Button:Next
$("#next").on("click",function(){
	page++;
	getList();
});

//검색어 입력
$(frm).on("submit", function(e) {
	e.preventDefault();
	query = $(frm.query).val();
	getList();
});

//List. API Search
function getList() {
	var start=(page-1)*display+1;
	$.ajax({
		type : "get",
		url : "/product/shop.json",
		data : {
			"query" : query,
			"page": page,
			"display": display,		
			"start" : start
		},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#api_div").html(template(data));
				var total=data.total;
				var lastPage=Math.ceil(total/display);
				
				//현제 페이지
				$("#curpage").html(page+"/"+lastPage);
				var lastPage=Math.ceil(total/data.display);
				$("#count").html(total);
				
				//페이지 버턴(한계)
				if(page==1){
					$("#prev").attr("disabled",true);
				}else{
					$("#prev").attr("disabled",false);
				}
				if(page==lastPage){
					$("#next").attr("disabled",true);
				}else{
					$("#next").attr("disabled",false);
				}
				}
			});
		}
		
	//Checkbox - SelectALL
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('prd');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  });
		}
	
	//Checkbox - SelectNone
	function selectNone(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('prd');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.unchecked;
		  });
		}
	
	//Insert Product
	$("#api_div").on("click", ".btnins", function() {
		if (!confirm("선택한 상품들을 저장 하실래요?"))
			return;
	
		$("#api_div .api_box .chk:checked").each(function() {
			var row = $(this).parent().parent();
			var pname = row.find(".title").html();
			var pprice = row.find(".price").html();
			var pmaker = row.find(".maker").html();
			var pbrand = row.find(".brand").html();
			var pcate1 = row.find(".category1").html();
	 		var pcate2 = row.find(".category1").attr("category2");
			var pcate3 = row.find(".category3").html();
	 		var pcate4 = row.find(".category3").attr("category4"); 
			var pimage = row.find(".image").attr('src');
			
			var intPrice = parseInt(pprice.split(',').join(''));
			var chk = document.querySelector(".chk");
			$.ajax({
				type : "post",
				url : "/product/insert",
				data : {
					pname : pname,
					pimage : pimage,
					pprice : intPrice,
					pmaker : pmaker,
					pbrand : pbrand,
					pcate1 : pcate1,
					pcate2 : pcate2,
					pcate3 : pcate3,
					pcate4 : pcate4,
				},

				success : function() {
					$(".chk").prop('checked', false);  
				}
			});
		});
	});
	
		//검색어 입력
		$(frm).on("submit", function(e) {
			e.preventDefault();
			query = $(frm.query).val();
			getList();
		});

		//페이지번호를 클릭한 경우
		$(".pagination").on("click", "a", function(e){
			e.preventDefault();
			page=$(this).attr("href");
			getList();
		});
</script>