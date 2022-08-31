<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
#btnUser{
	height: 35px;
	background-color: #A7CA37;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
#btnDate{
	height: 35px;
	background-color: #A7CA37;
	color: white;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}
</style>
<div id="page">
	<div id="menu">
		<jsp:include page="${submenu}"/>
	</div>
	<h1>차트관리</h1>
	<div id="buttons">
		<button id="btnUser" onClick="getUser()">회원별 매출내역</button>
		<button id="btnDate" onClick="getDate()">일자별 매출내역</button>
	</div>
	<div style="border: 1px;">
		<div id="chart" style="width: 960px; height: 500px;"></div>
	</div>
</div>

<script>

	function getDate(){
		//차트 출력
		var title="일자별 매출금액"
			$.ajax({
				type: "get",
				url: "/user/chartDate.json",
				success: function(data){
					barChart(title,data);
				}
			});
		//차트 펑션
		function barChart(chartTitle,chartData) {
			google.charts.load('current', {
				'packages' : [ 'bar' ]
			});
			google.charts.setOnLoadCallback(drawChart);
		
			function drawChart() {
				var data = google.visualization.arrayToDataTable(chartData);
						
				var options = {
					chart : {
						title : chartTitle,
					},
					bars : 'vertical' // Required for Material Bar Charts.
				};
		
				var chart = new google.charts.Bar(document.getElementById('chart'));
		
				chart.draw(data, google.charts.Bar.convertOptions(options));
			}
		}
	}
	
function getUser(){
	//차트 출력
	var title="사용자별 결제금액"
		$.ajax({
			type: "get",
			url: "/user/chartPrice.json",
			success: function(data){
				barChart(title,data);
			}
		});
	//차트 펑션
	function barChart(chartTitle,chartData) {
		google.charts.load('current', {
			'packages' : [ 'bar' ]
		});
		google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
			var data = google.visualization.arrayToDataTable(chartData);
					
			var options = {
				chart : {
					title : chartTitle,
				},
				bars : 'vertical' 
				//'horizontal'  Required for Material Bar Charts.
			};
	
			var chart = new google.charts.Bar(document.getElementById('chart'));
	
			chart.draw(data, google.charts.Bar.convertOptions(options));
		}
	}
}
	
</script>