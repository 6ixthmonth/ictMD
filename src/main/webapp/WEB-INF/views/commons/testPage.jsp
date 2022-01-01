<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
		function getMarkerList() {
			$.ajax({
				url: "/getMarkerList",
				success: initEarth,
				error: function(e) {
					console.log(e);
				}
			});
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

			// Set markers
			$.each(markerList, function(index, item) {
				console.log(index);
				console.log(item);
				var marker = WE.marker([ item.latitude, item.longitude ], "/resources/custom/img/marker/" + item.country + ".png", 24, 24).addTo(earth);
				marker.bindPopup(
					"<h2>" + item.landmark + "</h2>"
					+ "<a href='javascript: $.clicksearch(\"" + item.landmark  + "\")' role='button'>"
					+ "	<img src='" + item.imgUrl + "' class='img-circle img-responsive'>"
					+ "</a>"
				);
			});
		}
	</script>
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
			/* background-image: -webkit-gradient(
				linear,
				left bottom,
				left top,
				color-stop(0, rgb(253,253,253)),
				color-stop(0.15, rgb(253,253,253)),
				color-stop(0.53, rgb(223,223,223)),
				color-stop(0.56, rgb(255,255,255)),
				color-stop(1, rgb(253,253,253)));
			background-image: -moz-linear-gradient(
				center bottom,
				rgb(253,253,253) 0%,
				rgb(253,253,253) 15%,
				rgb(223,223,223) 53%,
				rgb(255,255,255) 56%,
				rgb(253,253,253) 100%); */
		}
		
		.we-pp-wrapper {
			text-align: center;
		}
	</style>
</head>
<body onload="getMarkerList()">
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="canvas">
		<div id="earth_div"></div>
	</div>
	
	<!-- <script type="text/javascript">navmenuInit();</script> -->
</body>
</html>