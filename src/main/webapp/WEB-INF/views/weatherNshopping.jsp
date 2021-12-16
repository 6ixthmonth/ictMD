<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
    <title>天気&ショッピング</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/geo-location-javascript/0.4.8/geo.js"></script>
<script src="./resources/js/highcharts.js"></script>
<script src="./resources/js/series-label.js"></script>
<script src="./resources/js/exporting.js"></script>
<script src="./resources/js/export-data.js"></script>

<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">


    <!-- Bootstrap core CSS -->
   
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet">
    <link href="./resources/templete/css/style.css" rel="stylesheet">
    <link href="./resources/templete/css/full-slider.css" rel="stylesheet">
    
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
    </style>
    
<script>
	var init = function() {
		$(".navmenu-nav > li > a").css("color", "#337ab7");
		$(".navmenu-nav > li > a").css("background-color", "#e0f0ff");
		$(".navmenu-nav > li > a").hover(function() {
			$(this).css("background-color", "#ffffff");
		}, function() {
			$(this).css("background-color", "#e0f0ff");
		});
	}
	$(function() {
		init();
		
		/* 홈화면으로 가기. 단 아직 메인을 만들지 않았기때문에 로그인후의 imsi페이지로 가게 만들었습니다. */
		$("#goHome").on("click",function(){
			location.href="/ictmd/";
		});
		
		var imsi = 0;

		
		
		/* 처음 페이지 들어오면 현재 접속위치의 날씨정보 출력부분 */
			var currnetLon = ""; // 경도 초기화
			var currentLat = ""; // 위도 초기화
			
			//현재 접속위치의 경도 및 위도 정보 받아오기
			navigator.geolocation.getCurrentPosition(function(position){
				currentLon = position.coords.longitude; 
				currentLat = position.coords.latitude;
				var curUrl = "https:////api.openweathermap.org/data/2.5/weather?lat="+currentLat+"&lon="+currentLon+ "&appid=8d9df8e528baa07108cb74b3776716c3";
				
				$.ajax({
					url : curUrl,
					success : function(data){
						console.log(data);
						var curId = JSON.stringify(data.id);
						$("#widgetDiv").innerHtml = showWidget(curId);

						//$("#widgetDiv").val(showWidget(curId));
					}
				
				})
			})
		
		/* mousewheel event */
		$("#myCarousel").on("mousewheel",function(e){
			var E = e.originalEvent;
			delta = 0;
			if (E.detail) {
                delta = E.detail * -40;
               	console.log("delta : " + delta);
            }else{
                delta = E.wheelDelta;
               	console.log("delta : " + delta);
            };
            imsi += delta;
            if(imsi > 360){
            	imsi = 0;
            	$('.carousel').carousel("prev");
            } else if(imsi < -360){
            	imsi = 0;
            	$('.carousel').carousel("next");
            }
            
		})
		
		
		//날씨에서 검색버튼부분
		$("#searchWeather").on('click',function() {
			showWeather();
		});
		
		//날씨에서 엔터누르면 검색
		$("#city").keydown(function(key) {
			if (key.keyCode == 13) {
				showWeather();
			}
		});
		/* 위젯으로 현재 날씨정보 출력 */ 
		// 일단 이쁘게 출력하기위해서 openWeatherMap의 위젯으로 받아옴. css가 가능하다면 원하는데로 출력가능
		function showWidget(id){ 
			
			window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];  
			window.myWidgetParam.push({
				id: 15,
				cityid: id,
				appid: '8d9df8e528baa07108cb74b3776716c3',
				units: 'metric',
				containerid: 'widgetDiv',  
				});  
			(function() {
				var script = document.createElement('script');
				script.async = true;
				script.charset = "utf-8";
				script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(script, s);
			})();
		}
		var carta = [];
		var raindata = [];
		var tempdata = [];
		var humiddata = [];
		function insertChart(){
			Highcharts.chart('foreTable', {
	 		    chart: {
			        zoomType: 'xy'
			    },
			    title: {
			        text: 'Weather Forecast for '+ cityName
			    },
			   /*  subtitle: {
			        text: 'Source: WorldClimate.com'
			    }, */
			    xAxis: [{
			        categories: carta,
			        crosshair: true
			    }],
			    yAxis: [{ // Primary yAxis
			        labels: {
			            format: '{value}°C',
			            style: {
			                color: Highcharts.getOptions().colors[2]
			            }
			        },
			        title: {
			            text: 'Temperature',
			            style: {
			                color: Highcharts.getOptions().colors[2]
			            }
			        },
			        opposite: true

			    }, { // Secondary yAxis
			        gridLineWidth: 0,
			        title: {
			            text: 'Rainfall',
			            style: {
			                color: Highcharts.getOptions().colors[0]
			            }
			        },
			        labels: {
			            format: '{value} mm',
			            style: {
			                color: Highcharts.getOptions().colors[0]
			            }
			        }

			    }, { // Tertiary yAxis
			        gridLineWidth: 0,
			        title: {
			            text: 'humidity',
			            style: {
			                color: Highcharts.getOptions().colors[1]
			            }
			        },
			        labels: {
			            format: '{value} %',
			            style: {
			                color: Highcharts.getOptions().colors[1]
			            }
			        },
			        opposite: true
			    }],
			    tooltip: {
			        shared: true
			    },
			    legend: {
			        layout: 'vertical',
			        align: 'left',
			        x: 80,
			        verticalAlign: 'top',
			        y: 55,
			        floating: true,
			        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
			    },
			    series: [{
			        name: 'Rainfall',
			        type: 'column',
			        yAxis: 1,
			        data: raindata,
			        tooltip: {
			            valueSuffix: ' mm'
			        }

			    }, {
			        name: 'Humidity',
			        type: 'spline',
			        yAxis: 2,
			        data: humiddata,
			        marker: {
			            enabled: false
			        },
			        dashStyle: 'shortdot',
			        tooltip: {
			            valueSuffix: ' %'
			        }

			    }, {
			        name: 'Temperature',
			        type: 'spline',
			        data: tempdata,
			        tooltip: {
			            valueSuffix: ' °C'
			        }
			    }]
			});
		}
		
		/* 날씨부분 메인함수 */
		function showWeather(){			
			cityName = $("#city").val();
			var urlAddr = "https:////api.openweathermap.org/data/2.5/weather?q="+ cityName+ "&appid=8d9df8e528baa07108cb74b3776716c3";
			
			$.ajax({ 
				url : urlAddr,
				type : "get",
				dataType : "json",
				success : function(data) {
					/* 여기 콘솔있는쪽은 그냥 이러한 정보를 받아올수 있다 이런거 보여주려고 만든거고 추후에 삭제예정 */
					//어떤데이터를 출력할지를 모르니까 우선은...
					console.log(data);
					console.log("検索した都市名 : " + data.name);
					console.log("経度と緯度 : " + data.coord.lon+ ", " + data.coord.lat)
					console.log("現在天気 : "+ data.weather[0].main);
					console.log("アイコン : "+ data.weather[0].icon);
					console.log("現在温度 : "+ (data.main.temp - 273.15));
					console.log("地域最高温度 : "+ (data.main.temp_max - 273.15)); // 절대온도로 나오니깐...
					console.log("地域最低温度 : "+ (data.main.temp_min - 273.15));
					
					var sunrise = data.sys.sunrise;
					var sunset = data.sys.sunset;
					var sunriseTime = new Date(sunrise * 1000).toLocaleTimeString();
					var sunsetTime = new Date(sunset * 1000).toLocaleTimeString();
					console.log("日の出時刻 : " + sunriseTime);
					console.log("日の入時刻 : " + sunsetTime);
					console.log("曇り : " + data.clouds.all+ "%");
					
					if(data.weather[0].main == "Clear"){
						$("#weatherBg").css("background-image","url('https://33.media.tumblr.com/99d65792681f52fd0b3d8a48dd792213/tumblr_muvd3ytmBw1qztgoio1_500.gif')")
					} else if(data.weather[0].main == "Clouds"){
						$("#weatherBg").css("background-image","url('https://www.adventurebikerider.com/wp-content/uploads/2017/10/tumblr_o27c7fByaO1tchrkco1_500.gif')")
					} else if(data.weather[0].main == "Rain"){
						$("#weatherBg").css("background-image","url('https://img.buzzfeed.com/buzzfeed-static/static/2015-03/29/20/enhanced/webdr12/anigif_enhanced-11357-1427674845-3.gif?downsize=715:*&output-format=auto&output-quality=auto')")
					}
					
					
					// 검색한 도시를 위젯으로 출력
					$("#widgetDiv").html('');
					$("#widgetDiv").html(showWidget(data.id));
				}
			});
			
			
			// 이부분은 금일 새벽 3시부터 5일간의 날씨데이터를 3시간 간격의 예보정보를 표로 출력시킨부분
			// 여기도 많은 데이터를 출력할 수 있지만 일단 기본적인데이터만 출력하게 했습니다
			// 여기도 처음접속할때 현재 접속위치의 예보 넣을까하다가 너무 더러워서 일단 뺐어요.
			var foreUrl = "https:////api.openweathermap.org/data/2.5/forecast?q="+ cityName+ "&mode=xml&appid=8d9df8e528baa07108cb74b3776716c3";
			$.ajax({
				url : foreUrl,
				type : "get",
				dataType : "xml",
				success : function(data) {
					console.log(data);
					carta = [];
					raindata = [];
					tempdata = [];
					humiddata = [];
					$(data).find("time").each(function() {
						carta.push($(this).attr("from").substring(0,10) +" "+ $(this).attr("from").substring(11,13));
						humiddata.push(parseFloat($(this).find("humidity").attr("value")));
						tempdata.push(parseFloat(($(this).find("temperature").attr("value")-273.15).toFixed(1)));
						if (($(this).find("precipitation").attr("value") != null) &&
								($(this).find("precipitation").attr("value") > 0.01)){
							var preci = $(this).find("precipitation").attr("value");
							raindata.push(parseFloat(parseFloat(preci).toFixed(2)));
						}
						else{
							raindata.push(0);
						}
						
					});
					
					insertChart();
				}
			});
		}
		
		// 쇼핑에서 엔터누르면 검색
		$("#product").keydown(function(key) {
			if (key.keyCode == 13) {
				playShopping();
			}
		});
		
		// 쇼핑에서 검색버튼
		$("#searchProduct").on("click",function(){
			playShopping();		
		});
		
		// 쇼핑부분 메인함수
		function playShopping(){
			var productName = $("#product").val();
			var urlName = "https://svcs.ebay.com/services/search/FindingService/v1";
			urlName += "?OPERATION-NAME=findItemsByKeywords";
			urlName += "&SERVICE-VERSION=1.0.0";
			urlName += "&SECURITY-APPNAME=kimjaewo-ScitMast-PRD-959c93333-881667c4";
			urlName += "&GLOBAL-ID=EBAY-US";
			urlName += "&RESPONSE-DATA-FORMAT=JSON";
			urlName += "&REST-PAYLOAD";
			urlName += "&keywords="+productName;
			urlName += "&paginationInput.entriesPerPage=5"; // 5개씩 출력. 변경가능하고 페이징하면 매우매우 많이 출력 가능
			
			$.ajax({
				url:urlName,
				type:"get",
				dataType:"jsonp",
				contentType:"application/json;charset=UTF-8;",
				success:function(data){
					var items = data.findItemsByKeywordsResponse[0].searchResult[0].item || [];
					if(items.length == 0){
						alert("結果なし");
						$("#product").val('');
						return;
					}
					var html = [];
					var head = "<table><tr><th>写真</th><th>タイトル</th><th>価額(USD)</th>"
					  
					html.push(head);
					for (var i = 0; i < items.length; ++i) {
						var item     = items[i];
					    var title    = item.title;
					    var price    = item.sellingStatus[0].currentPrice[0].__value__;
					    var pic      = item.galleryURL;
					    var viewitem = item.viewItemURL;
					    if (null != title && null != viewitem) {
					      html.push('<tr><td>' + '<img src="' + pic + '" border="0">' + '</td>' +
					      '<td><a href="' + viewitem + '" target="_blank">' + title + '</a></td><td>'
					      + price + '</td></tr>');
					    }
					  }
					  html.push('</tbody></table>');
					  document.getElementById("results").innerHTML = html.join("");
				}
			});
		}
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

    <div id="myCarousel" class="canvas carousel slide" data-ride="carousel">
    <!-- Full Page Image Background Carousel Header -->
    
        <!-- Indicators -->
        <ol class="carousel-indicators xtra-border">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <div class="fill" id = "weatherBg" style="background-image:url('https://33.media.tumblr.com/99d65792681f52fd0b3d8a48dd792213/tumblr_muvd3ytmBw1qztgoio1_500.gif');">
	                <div style='font-size:200%;font-weight:bold;color:white;text-shadow:0px 0px 1px #202020, 0px 0px 11px #337ab7'>天気検索</div>
					<input type="text" id="city" placeholder="都市を入力してください" />
					<button id="searchWeather">検索</button>
					<hr>
					<!-- 현재 날씨정보 위젯 출력부분 -->
					<div id="widgetDiv"></div>
					<hr>
					<!-- 5일간의 일기예보 출력부분 -->
					<div id="foreTable"></div>
                </div>
            </div>
            <div class="item">
                <!-- Set the second background image using inline CSS below. -->
                <div class="fill" style="background-image:url('https://data.1freewallpapers.com/download/anne-hathaway-at-shopping.jpg');">
	                <div style='font-size:200%;font-weight:bold;color:white;text-shadow:0px 0px 1px #202020, 0px 0px 11px #337ab7'>ショッピング検索</div>
					<input type="text" id="product" placeholder="Cameraモデルを入力"/>
					<button id="searchProduct">検索</button>
					<!-- 쇼핑검색결과 출력부분 -->
					<div id="results"></div>
                </div>
            </div>
        </div>
    </header>
      <!-- <div class="navbar navbar-default navbar-fixed-top">
        
      </div> -->

      <div class="container page-container">
        <div class="home-page-header">
         
         <!-- <div class="col-md-4 col-md-offset-4"><img src="img/zigzag.png" width="400" height="30"></div> -->
        </div>
        
      </div><!-- /.container -->
    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
    <script type="text/javascript" src="./resources/templete/js/bootstrap.min.js"></script>
    <script src="./resources/templete/js/main.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 600000 //changes the speed
    })
    </script>
</body>
</html>