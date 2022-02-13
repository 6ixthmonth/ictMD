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
		#earth {
			position: absolute !important;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
		}

		.we-pm-icon {
			border-radius: 50%;
		}

		.we-pp-wrapper {
			text-align: center !important;
		}

		.we-pp-content>img {
			width: 180px;
			height: 180px;
		}

		/* CSS for Bootstrap carousel */
		.carousel {
			position: absolute;
			top: 50%;
			left: 15%;
			transform: translate(-150px, -50%);
		}

		.carousel-inner>.item>img {
			width: 300px;
			min-width: 300px;
			max-width: 300px;

			height: 300px;
			min-height: 300px;
			max-height: 300px;
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

		.result-inner>div>img {
			width: 300px;
			min-width: 300px;
			max-width: 300px;

			height: 300px;
			min-height: 300px;
			max-height: 300px;
		}

		.result-caption {
			position: absolute;
			right: 15%;
			bottom: 20px;
			left: 15%;
			z-index: 10;
			padding-top: 20px;
			padding-bottom: 20px;
			color: #fff;
			text-align: center;
			text-shadow: 0 1px 2px rgb(0 0 0 / 60%);
		}

		@media screen and (min-width: 768px) {
			.result-caption {
				right: 20%;
				left: 20%;
				padding-bottom: 30px;
			}
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="canvas">
		<div class="input-group text-center">
			<input type="text" class="form-control" placeholder="Search Images">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">Search</button>
			</span>
		</div>
		<div id="earth"></div>
		
		<div id="landmark-carousel" class="carousel slide" data-ride="carousel">
			<h3 style="position: absolute; top:0; text-align: center; width: 100%; transform: translate(0, 0); z-index:100;">Click to Search One</h3>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox"></div>
			
			<!-- Controls -->
			<a class="left carousel-control" href="#landmark-carousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<!-- <span class="icon-prev" aria-hidden="true"></span> -->
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#landmark-carousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<!-- <span class="icon-next" aria-hidden="true"></span> -->
				<span class="sr-only">Next</span>
			</a>
		</div>
		
		<div id="search-result">
			<h3 style="position: absolute; top:0; text-align: center; width: 100%; transform: translate(0, 0); z-index:100;">Click to See More</h3>
			<div class="result-inner"></div>
		</div>
	</div>

	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
		var earth;
		var markers = [];
		$(init);

		function init() {
			initEarth();
			getLandmarks();
		}

		function initEarth() {
			// Init map object.
			earth = new WE.map("earth", {
				center: [ 37.511981, 127.058544 ], // COEX
				zoom: 0,
				zooming: false,
			});

			// Set tile layer.
			WE.tileLayer("https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg", {
				tms : true
			}).addTo(earth);

			// Start a simple rotation animation.
			var before = null;
			requestAnimationFrame(function animate(now) {
				var c = earth.getPosition();
				var elapsed = before ? now - before : 0;
				before = now;
				earth.setCenter([ c[0], c[1] + 0.1 * (elapsed / 30) ]);
				requestAnimationFrame(animate);
			});

			// Add click event to close all popups when earth obj has been clicked.
			earth.on("click", closeAllPopups);
		}

		function closeAllPopups() {
			// Close each popup.
			for (var marker of markers) {
				marker.closePopup();
			}
		}

		function getLandmarks() {
			// Get Landmarks info from DB.
			$.ajax("/getLandmarks").done(function(landmarks) {
				initMarkers(landmarks);
				initCarousel(landmarks);
			});
		}

		function initMarkers(landmarks) {
			// Init markers.
			$.each(landmarks, function(index, item) {
				// Make marker and add to earth.
				var markerImgUrl = "https://flagicons.lipis.dev/flags/1x1/" + item.alphaTwoCode + ".svg";
				var marker = WE.marker([ item.latitude, item.longitude ], markerImgUrl, 24, 24).addTo(earth);
				markers.push(marker);

				// Make popup and bind to marker.
				var popupHtml = "";
				popupHtml += "<h2>" + item.landmark + "</h2>";
				popupHtml += "<h4>" + item.countryName + "</h4>";
				popupHtml += "<img src='" + item.imgUrl + "'>";
				marker.bindPopup(popupHtml);
			});
		}

		function initCarousel(landmarks) {
			// Init carousel.
			var carouselHtml = "";
			$.each(landmarks, function(index, item) {
				carouselHtml += "<div class='item'>";
				carouselHtml += "	<img src='" + item.imgUrl + "' onclick='setEarth(" + index + ", " + item.latitude + ", " + item.longitude + ", \"" + item.landmark + "\", \"" + item.countryName + "\")'>";
				carouselHtml += "	<div class='carousel-caption'>";
				carouselHtml += "		<h4>" + item.landmark + "</h4>";
				carouselHtml += "		<h5>" + item.countryName + "</h5>";
				carouselHtml += "	</div>";
				carouselHtml += "</div>";
			});

			$(".carousel-inner").html(carouselHtml);
			$(".item:first").addClass("active");
			
			$("#landmark-carousel").carousel({
				interval: 6000
			});
		};

		function setEarth(index, latitude, longitude, landmark, countryName) {
			earth.setView([latitude, longitude]);
			closeAllPopups();
			markers[index].openPopup();
			popupImg(landmark, countryName);
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
				// popupHtml += "<div onclick='searchImg(\"" + landmark + "\")'>";
				popupHtml += "<div>";
				popupHtml += "	<img src='" + res.url + "'>";
				popupHtml += "	<div class='result-caption'>";
				popupHtml += "		<h4>" + landmark + "</h4>";
				popupHtml += "		<h5>" + countryName + "</h5>";
				popupHtml += "	</div>";
				popupHtml += "</div>";

				$(".result-inner").html(popupHtml);
				$("#search-result").show();
			});
		}
	</script>
</body>
</html>