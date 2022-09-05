<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/wb.css" rel="stylesheet" >

<div id="page">
	<h1>API 쇼핑 검색</h1>
	

<!-- navigation holder -->

<div class="top-menu-wrap">
	<!-- 검색창 -->
	<div id="search-box">
		<input type="text" name="query" id="query">
		<button class="api-search-btn">검색</button>
		검색수: <span class="count"></span> 건
	</div>

	<!-- Nº of items per page form -->

		<div id="display_number">
			<label id="display_label">페이지 당 항목: </label>
			<select>
				<option>20</option>
				<option>30</option>
				<option>50</option>
				<option>100</option>
			</select>
		</div>


	<%--전부 선택 체크 박스--%>
	<div>
		<div id="api_checkbox" style="margin:20px;">
			<input type='checkbox' name='prd' value='selectall' onclick='selectAll(this)'/><b>전부선택</b><button style="margin-left:20px;" class="btnins">선택상품저장</button>
		</div>
	</div>
</div>

	<div id="api_container">
	<div id="api_div" style="width:960px"></div>
	<script id="temp" type="text/x-handlebars-template">
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
	</div><%--api container--%>

	<div id="pageBtn">
	 		<button class="prev">이전</button>
	 		<span id="curpage"></span>
	 		<button class="next">다음</button>
	</div><%--page button container--%>
	
 </div> <%--page--%>

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

//페이지 당 아이템 display
$("select").on("change",function(){
	display=parseInt($(this).val() );
	getList();
});

//Button:Prev
$(".prev").on("click",function(){
	page--;
	getList();
});

//Button:Next
$(".next").on("click",function(){
	page++;
	getList();
});


/* 검색 */
document.querySelector(".api-search-btn").addEventListener('click',()=>{
	query = document.querySelector('#query').value;
	alert("query"+query)
	getList();
})


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
				console.log(data)
				console.log(total)
				//현제 페이지
				$("#curpage").html(page+"/"+lastPage);
				var lastPage=Math.ceil(total/data.display);

		/*		$("#count").html(total);*/
				document.querySelector(".count").innerHTML = total;
				//페이지 버턴(한계)
				if(page==1){
					$(".prev").attr("disabled",true);
					$(".prev").addClass('disabled')
				}else{
					$(".prev").attr("disabled",false);
					$(".prev").removeClass('disabled')
				}
				if(page==lastPage){
					$(".next").attr("disabled",true);
					$(".prev").addClass('disabled')
				}else{
					$(".next").attr("disabled",false);
					$(".next").removeClass("disabled",false);
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
	$("#api_checkbox").on("click", ".btnins", function() {
		if (!confirm("선택한 상품들을 저장 하실래요?"))
			return;
	
		$("#api_div .api_box .chk:checked").each(function() {
			var row = $(this).parent().parent();
			var orgText = row.find(".title").html();
			var pprice = row.find(".price").html();
			var pmaker = row.find(".maker").html();
			var pbrand = row.find(".brand").html();
			var pcate1 = row.find(".category1").html();
	 		var pcate2 = row.find(".category1").attr("category2");
			var pcate3 = row.find(".category3").html();
	 		var pcate4 = row.find(".category3").attr("category4"); 
			var pimage = row.find(".image").attr('src');
			//태그 제거
			var pname =orgText.replace(/(<([^>]+)>)/ig,"");
			//숫자 '0' 짤림 방지 
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


		//페이지번호를 클릭한 경우
		$(".pagination").on("click", "a", function(e){
			e.preventDefault();
			page=$(this).attr("href");
			getList();
		});
</script>