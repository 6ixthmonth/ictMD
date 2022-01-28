<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>

	<style>
		html, body {
			padding: 0;
			margin: 0;
		}

		#earth_div {
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			position: absolute !important;
		}
		
		.we-pm-icon {
			width: 24px !important;
			height: 24px !important;
			border-radius: 50%;
		}

		div.we-pp-wrapper {
			text-align: center;
		}
		
		.carousel.slide {
			position: absolute;
			top: 50%;
			left: 15%;
			transform: translate(-50%,-150px);
		}

		.carousel-inner>.item>img {
			height: 300px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="canvas">
		<div id="earth_div"></div>
		
		<div id="landmark-carousel" class="carousel slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox"></div>
			
			<!-- Controls -->
			<a class="left carousel-control" href="#landmark-carousel" role="button" data-slide="prev">
				<!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
				<span class="icon-prev" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#landmark-carousel" role="button" data-slide="next">
				<!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
				<span class="icon-next" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
		$(init);
		
		function init() {
			getMarkerList();	
		}

		function getMarkerList() {
			$.ajax("/getMarkerList")
			.done(initEarth);
		}

		function initEarth(markerList) {
			// Init map object
			var earth = new WE.map("earth_div", {
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

			var str = "";
			// Set markers
			$.each(markerList, function(index, item) {
				var marker = WE.marker([ item.latitude, item.longitude ], "https://flagicons.lipis.dev/flags/1x1/" + item.alphaTwoCode + ".svg", 24, 24).addTo(earth);
				marker.bindPopup(
					"<h2>" + item.landmark + "</h2>"
					+ "<a href='javascript: searchImg(\"" + item.landmark  + "\")' role='button'>"
					+ "	<img src='" + item.imgUrl + "' class='img-circle' style='width:180px;height:180px;'>"
					+ "</a>"
				);
				
				str += "<div class='item'>";
				str += "	<img src='" + item.imgUrl + "' onclick='searchImg(\"" + item.landmark  + "\")' onmouseenter='popupImg(\"" + item.landmark + "\")'>";
				str += "	<div class='carousel-caption'>";
				str += "		<h4 style='text-shadow: 1px 1px 1px black;'>" + item.landmark + "</h4>";
				str += "		<h4 style='text-shadow: 1px 1px 1px black;'>" + item.countryName + "</h4>";
				str += "	</div>";
				str += "</div>";
			});

			$(".carousel-inner").html(str);
			$(".item:first").addClass("active");
		}
		
		function searchImg() {
			// move to search page and search image automatically
		}
		
		function popupImg() {
			// get img url by ajax
			var imgUrl = getImg();
		}
		
		function getImg() {
			// get img url by ajax
		}
	</script>
</body>
</html>