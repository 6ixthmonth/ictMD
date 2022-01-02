<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
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

			// Set markers
			$.each(markerList, function(index, item) {
				var marker = WE.marker([ item.latitude, item.longitude ], "/resources/custom/img/marker/" + item.country + ".png", 24, 24).addTo(earth);
				marker.bindPopup(
					"<h2>" + item.landmark + "</h2>"
					+ "<a href='javascript: $.clicksearch(\"" + item.landmark  + "\")' role='button'>"
					+ "	<img src='" + item.imgUrl + "' class='img-circle' style='width:180px;height:180px;'>"
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

	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="https://www.listchallenges.com/f/items/baccf057-63ee-4aa5-aab6-f0f1212d8fb7.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="https://www.listchallenges.com/f/items/7fb2cd5d-8abc-40a8-a25d-5aa7c8ebd216.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item">
				<img src="https://www.listchallenges.com/f/items/00472c34-0bbb-495c-8d3d-15b4e77918d1.jpg" alt="...">
				<div class="carousel-caption">...</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- <script type="text/javascript">navmenuInit();</script> -->
</body>
</html>