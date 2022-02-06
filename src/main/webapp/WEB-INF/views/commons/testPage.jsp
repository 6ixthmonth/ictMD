<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>

	<style type="text/css">
		/* CSS for whole page */
		.canvas {
			max-height: 100%;
			overflow: hidden;
			background-image: url(/resources/custom/img/main.jpg);
		}

		/* CSS for WebGL earth and markers */
		#earth_div {
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			position: absolute !important;
		}

		.we-pm-icon {
			border-radius: 50%;
		}

		.we-pp-wrapper {
			text-align: center !important;
		}

		.popup>img {
			width: 180px;
			height: 180px;
		}

		/* CSS for Bootstrap carousel */
		.carousel.slide {
			position: absolute;
			top: 50%;
			left: 15%;
			transform: translate(-150px, -50%);
		}

		.carousel-inner>.item>img {
			height: 300px;
			min-height: 300px;
			max-height: 300px;
			
			width: 300px;
			min-width: 300px;
			max-width: 300px;
		}

		.carousel-caption {
			text-shadow: 0px 0px 2px black;
		}

		/* CSS for custom window */
		#search-result {
			width: 300px;
			height: 300px;

			position: absolute;
			top: 50%;
			right: 15%;
			transform: translate(150px, -50%);

			background-color: white;
			opacity: 0.9;

			display: none;
		}

		#search-result>div>img {
			width: 300px;
			height: 300px;
		}

		#search-result-title {
			color: white;
			text-shadow: 0px 0px 2px black;

			width: 300px;
			text-align: center;

			position: absolute;
			bottom: 20px;
			padding-bottom: 30px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="canvas">
		<div>Title</div>
		<div id="earth_div"></div>
		
		<div id="landmark-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox"></div>
			
			<!-- Controls -->
			<a class="left carousel-control" href="#landmark-carousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="icon-prev" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#landmark-carousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="icon-next" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		
		<div id="search-result"></div>
	</div>

	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
		var earth;
		$(init);

		function init() {
			initEarth();
			getMarkers();
		}
		
		function initEarth() {
			// Init map object
			earth = new WE.map("earth_div", {
				center: [ 37.511981, 127.058544 ], // COEX
				zoom: 0,
				zooming: false,
			});

			// Set tile layer
			WE.tileLayer("https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg", {
				tms : true
			}).addTo(earth);

			// Start a simple rotation animation
			var before = null;
			requestAnimationFrame(function animate(now) {
				var c = earth.getPosition();
				var elapsed = before ? now - before : 0;
				before = now;
				earth.setCenter([ c[0], c[1] + 0.1 * (elapsed / 30) ]);
				requestAnimationFrame(animate);
			});
		}

		function getMarkers() {
			$.ajax("/getMarkers").done(function(markers) {
				initMarkers(markers);
				initCarousel(markers);
			});
		}

		function initMarkers(markers) {
			// Set markers
			$.each(markers, function(index, item) {
				// Add marker to earth
				var markerImgUrl = "https://flagicons.lipis.dev/flags/1x1/" + item.alphaTwoCode + ".svg";
				var marker = WE.marker([ item.latitude, item.longitude ], markerImgUrl, 24, 24).addTo(earth);

				// Bind popup to marker
				var popupHtml = "";
				popupHtml += "<div class='popup' onclick='searchImg(\"" + item.landmark  + "\");'>";
				popupHtml += "	<h2>" + item.landmark + "</h2>";
				popupHtml += "	<h4>" + item.countryName + "</h4>";
				popupHtml += "	<img src='" + item.imgUrl + "'>";
				popupHtml += "</div>";
				marker.bindPopup(popupHtml);
			});
		}
		
		function initCarousel(markers) {
			var carouselHtml = "";
			$.each(markers, function(index, item) {
				carouselHtml += "<div class='item'>";
				carouselHtml += "	<img src='" + item.imgUrl + "' onclick='searchImg(\"" + item.landmark  + "\")' onmouseenter='popupImg(\"" + item.landmark + "\", \"" + item.countryName + "\")'>";
				carouselHtml += "	<div class='carousel-caption'>";
				carouselHtml += "		<h4>" + item.landmark + "</h4>";
				carouselHtml += "		<h5>" + item.countryName + "</h4>";
				carouselHtml += "	</div>";
				carouselHtml += "</div>";
			});
			$(".carousel-inner").html(carouselHtml);
			$(".item:first").addClass("active");
		};
		
		function searchImg(landmark) {
			// move to search page and search image automatically
			console.log(landmark);
		}
		
		function popupImg(landmark, countryName) {
			// get img url by ajax
			$.ajax({
				url: "/brandnew",
				type: "post",
				data: {
					tag: landmark
				}
			}).done(function(res) {
				var popupHtml = "";
				popupHtml += "<div onclick='searchImg(\"" + landmark + "\")'>";
				popupHtml += "	<img src='" + res.url + "'>";
				popupHtml += "	<div id='search-result-title'>";
				popupHtml += "		<h4>" + landmark + "</h4>";
				popupHtml += "		<h5>" + countryName + "</h5>";
				popupHtml += "	</div>";
				popupHtml += "</div>";
				
				$("#search-result").html(popupHtml);
				$("#search-result").show();
			});
		}
	</script>
</body>
</html>