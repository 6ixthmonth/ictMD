<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
	<title>トレンド分析</title>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="./resources/templete/css/style.css" rel="stylesheet">
	<link href="./resources/templete/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="./resources/css/analysis.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="./resources/js/highcharts.js"></script>
	<script src="./resources/js/series-label.js"></script>
	<script src="./resources/js/exporting.js"></script>
	<script src="./resources/js/export-data.js"></script>
	<script src="./resources/js/wordcloud.js"></script>
	
	<style>
		.bar {
			background-color: #337ab7;
		}
		
		button.navbar-toggle {
			background: url(./resources/img/navicon2.jpg);
			background-repeat: no-repeat;
		}
		
		.navmenu-fixed-left {
			background-color: #80c0e0;
		}
		
		.navmenu-nav {
			font-size: 110%;
			font-weight: bold;
			color: #337ab7;
		}
		
		#memberMenu, #memberMenu > a, #memberMenu > span {
			font-weight: bold;
			color: white;
			text-shadow: 1px 1px 4px #303030;
			
			text-align: center;
			margin: 0 auto;
		}
		
		.copyright-text {
			font-size: 110%;
			font-weight: bold;
			color: #ffffff;
			text-shadow: 1px 1px 4px #303030;
			
			text-align: center;
		}
	
	.dataTable {
  font-family: sans-serif;
  font-weight: 100;
  width: 500px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: linear-gradient(45deg, #49a09d, #5f2c82);
}
.dataTable th,
.dataTable td {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #fff;
}
.dataTable th {
  text-align: left;
}
.dataTable thead th {
  background-color: #55608f;
}
.dataTable tbody tr:hover {
  background-color: rgba(255, 255, 255, 0.3);
}
.dataTable tbody td {
  position: relative;
}
.dataTable tbody td:hover:before {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  top: -9999px;
  bottom: -9999px;
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
}

		#popup {
			width: 560px;
			background-color: white;
			opacity: 0.9;
			border: solid 1px #ccc;
			box-shadow: 0px 10px 20px #333;
			
			position: absolute;
			top: 150px;
			padding: 0;
			margin: 0 auto;
			margin-bottom: 30px;
			text-align: center;
			z-index: 9999;
		}
		
		#close {
			font-weight: bold;
			color: #303030;
			
			position: relative;
			top: -25px;
			float: right;
		}
		
		#frame {
			padding: 0;
			margin: 20px;
		}
		
		#title {
			font-size: 200%;
			font-weight: bold;
			margin-bottom: 20px;
		}
		
		#name {
			font-weight: bold;
			color: #337ab7;
		}
		
		#moreDetail tr td {
			font-family: sans-serif;
			font-size: 120%;
			color: #202020;
			text-shadow:  3px 3px 5px rgba(32, 32, 32, 0.4);
			padding-top: 3px;
			padding-bottom: 3px;
			padding-left: 1px;
			padding-right: 1px;
		}
	</style>
	
	<script>
		var init = function() {
			$(".navmenu-nav > li > a").css("color", "#337ab7");
			$(".navmenu-nav > li > a").css("background-color", "#e0f0ff");
			$(".navmenu-nav > li > a").hover(function() {
				$(this).css("background-color", "#ffffff");
			}, function() {
				$(this).css("color", "#337ab7");
				$(this).css("background-color", "#e0f0ff");
			});
		}
		$(function(){
			init();
			
			function wordCloudChart(data, divName, chartTitle){
				var makeArr = [];
				
				for (var i = 0; i < 30; i++) {
					if (data[i] == null) {
						break;
					}
					makeArr.push({
						name:data[i].dataName,
						weight:parseFloat(data[i].dataNum)
					});
				}
				/* $(data).each(function(index,item){
					makeArr.push({
						name:item.dataName,
						weight:parseFloat(item.dataNum)
					});
				}); */
				
				
				Highcharts.chart(divName, {
					series: [{
				        type: 'wordcloud',
				        data: makeArr,
				        name: '検索件数',
						point:{
							events:{
								click: function (event) {
									$("#gosearch").attr("action","goClickSearch");
									$("#gosearch").attr("method","POST");
									$("#tags").attr("name","tags");
									$("#tags").val(this.name);
									$("#gosearch").submit();
								}
							}
						}
				    }],
				    title: {
				    	y: 30,
				    	text: "<div style='font-size:150%;font-weight:bold;color:white;text-shadow:0px 0px 1px #202020, 0px 0px 6px #337ab7;'>" + chartTitle + "</div>"
				    },
				    subtitle: {
				    	text: "<div style='font-size:110%;color:grey;'>クリックすると検索ページに移動します。</div>"
				    }
				});
			}
			
			function basicDataChart(data, divName, chartTitle, seriesName){
				var makeArr = [];
				$(data).each(function(index,item){
					makeArr.push({
						name:item.dataName,
						y:parseFloat(item.dataPercentage)
					});
				});
				console.log(makeArr);
				Highcharts.chart(divName, {
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				    	y: 30,
				    	text: "<div style='font-size:150%;font-weight:bold;color:white;text-shadow:0px 0px 1px #202020, 0px 0px 6px #337ab7;'>" + chartTitle + "</div>"
				    },
				    subtitle: {
				    	text: "<div style='font-size:110%;color:grey;'>人々が閲覧した写真を分析した結果です。</div>"
				    },
				    tooltip: {
				        pointFormat: '<div style="font-weight:bold;">{point.y} %</div>'
				    },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '{point.name}',
				                style: {
				                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                }
				            }
				        }
				    },
				    series: [{
				        name: seriesName,
				        colorByPoint: true,
				        data: makeArr,
				        point:{
				              events:{
				                  click: function (event) {
				                	  var word = this.name;
				                      var url = "";
				                      if (chartTitle == "トップ１０のブランド") {
				                    	  url = "selectModelByMake";
				                      } else if (chartTitle == "トップ１０のモデル") {
				                    	  url = "selectElementsByModel";
				                      } else {
				                    	  return;
				                      }
				                      
				                      $.ajax({
										  data : {
				                  			word : word
				                  		}
				                  		, method : "POST"
				                  		, url : url
				                  		, success : function(resp) {
				                  			$("#popup").remove();
				                  			var title = "";
				                  			var direction = "";
				                  			if (chartTitle == "トップ１０のブランド") {
				                  				title = "「<span id='name'>" + word + "</span>」の中でのモデル順位";
				                  				direction = "right";
						                    } else if (chartTitle == "トップ１０のモデル") {
						                    	title = "「<span id='name'>" + word + "</span>」で撮った対象順位";
						                    	direction = "left";
						                    }
				                  			
				                  			$("body").append("<div id='popup'></div>");
				                  			var popup = $("#popup");
				                  			popup.append("<div id='close'>X</div>");
				                  			popup.append("<div id='frame' align='center'></div>");
				                  			var frame = $("#frame");
				                  			frame.append("<div id='title'>" + title + "</div>");
				                  			frame.append("<table id='moreDetail'></table>");
				                  			for (var i = 0; i < 10; i++) {
				                  				if (resp[i] == null) {
				                  					break;
				                  				}
				                  				if (i == 0) {
				                  					$("#moreDetail").append("<tr><td align='left' style='font-size:200%;font-weight:bold;color:white;text-shadow:0px 0px 1px #202020, 0px 0px 6px #337ab7;'>" + resp[i].name + "</td><td width='10'></td><td align='right' style='font-size:200%;font-weight:bold;color:#337ab7;text-shadow:0px 0px 1px #202020, 0px 0px 6px #337ab7;'>" + resp[i].count + "</td></tr>");
				                  					continue;
				                  				}
				                  				$("#moreDetail").append("<tr><td align='left'>" + resp[i].name + "</td><td width='20'></td><td align='right'>" + resp[i].count + "</td></tr>");
				                  			}
				                  			
				                  			popup.css("top", Math.max(30, $(window).scrollTop() + 150) + "px");
				                  			popup.css(direction, "15%");
				                  			
				                  			$("#close").on("click", function() {
				                  				popup.remove();
				                  			});
				                  		}
				                      });
				                  }
				              }
				          }
				    }]
				});
			}
			
			$.ajax({
				url:"importBasicMakeData",
				type:"post",
				success:function(data){
					console.log("메이커데이터");
					console.log(data);
				basicDataChart(data, "BasicMake", "トップ１０のブランド", "パーセンテージ");
					/* var makeTable = "<tr style='text-align:center'><th>브랜드명</th><th>검색횟수</th><th>검색률</th>";
					$(data).each(function(index,item){
						makeTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td><td>"+item.dataPercentage+"%</td>";
					}); */
					
					var makeTable = '<thead><tr><th>ブランド</th><th>閲覧回数</th><th>閲覧比率</th></tr></thead><tbody>';
					$(data).each(function(index,item){
						makeTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td><td>"+item.dataPercentage+"%</td>";
					});
					makeTable += '</tbody>';
					$("#MakeAnalysis").html(makeTable);
					
					
				},
				error:function(data){
					alert("失敗");
				}
			});
			
			$.ajax({
				url:"importBasicModelData",
				type:"post",
				success:function(data){
					console.log("모델데이터");
					console.log(data);
				basicDataChart(data, "BasicModel", "トップ１０のモデル", "パーセンテージ");
					var modelTable = '<thead><tr><th>モデル</th><th>閲覧回数</th><th>閲覧比率</th></tr></thead><tbody>';
					$(data).each(function(index,item){
						modelTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td><td>"+item.dataPercentage+"%</td>";
					});
					modelTable += '</tbody>';
					$("#ModelAnalysis").html(modelTable);

				},
				error:function(data){
					alert("失敗");
				}
			});
			
			$.ajax({
				url:"importBasicTagsData",
				type:"post",
				success:function(data){
					console.log(data);
				wordCloudChart(data, "BasicTag", "トップ３０の検索語");
				}
			});
		});
	</script>
</head>
<body>
	<div class="bar">
		<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<div class="navmenu navmenu-default navmenu-fixed-left">
		<ul class="nav navmenu-nav">
			<li><a href="main">メイン</a></li>
			<li><a href="search">イメージ検索</a></li>
			<li><a href="analysis">トレンド分析</a></li>
			<li><a href="weatherNshopping">天気＆値段</a></li>
		</ul>
		<a class="navmenu-brand" href="main">
			<img src="./resources/templete/assets/ico/favicon.png" width="186px">
		</a>
		<div id="memberMenu">
			<c:if test="${userId == null}">
				<a href="loginPage">Login</a>
				<span> / </span>
				<a href="registerPage">Sign in</a>
				<br>
			</c:if>
			<c:if test="${userId != null}">
				<a href="logout">Logout</a>
				<br>
				<a href="fixPage">Edit</a>
				<span> / </span>
				<a href="secesionPage">Withdrawal</a>
				<c:if test="${userId == 'admin'}">
					<span> / </span>
					<a href="admin">Admin</a>
				</c:if>	
			</c:if>
		</div>
		<br>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
	
	<div class="canvas gallery">
		<br>
		<h1 class="blog-post-title text-center" style="color:#337ab7;text-shadow: 3px 3px 5px rgba(32, 32, 32, 0.2)">トレンド分析</h1>
		<div style="margin:0 auto;width:180px;height:2px;background:linear-gradient(to right, rgba(255, 255, 255, 0), rgba(248, 222, 126, 1), rgba(255, 255, 255, 0))"></div>
		<br><br><br>
		<div id="BasicTag" style="width:80%; margin:auto"></div>
		<br><br><br>
		<table style="margin:auto;">
			<tr>
				<td>
					<div id="BasicMake" style="display:inline;float:left;width:50%"></div>
				</td>
				<td>
					<div id="BasicModel" style="display:inline;float:left;width:50%"></div>
				</td>
			</tr>
			<tr>
				<td>
					<table class="dataTable" id = "MakeAnalysis" style="width:100%"></table>
				</td>
				<td style="vertical-align:top;">
					<table class="dataTable" id = "ModelAnalysis" style="width:100%"></table>
				</td>
			<tr>
		</table>
	</div>
	
	<form id="gosearch">
		<input type="hidden" id="tags">
	</form>
	
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	<script type="text/javascript" src="./resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./resources/templete/js/isotope.js"></script>
	<script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	<!-- <script src="./resources/js/main.js"></script> -->
</body>
</html>