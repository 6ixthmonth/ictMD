<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script>
		function initialize() {
			// Init map object
			var earth = new WE.map("earth_div", {
				center: [ 37.511981, 127.058544 ],
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
			// var marker = WE.marker([51.5, -0.09]).addTo(earth);
	        // marker.bindPopup("<b>Hello world!</b><br>I am a popup.<br /><span style='font-size:10px;color:#999'>Tip: Another popup is hidden in Cairo..</span>", {maxWidth: 150, closeButton: true}).openPopup();

	        // var marker2 = WE.marker([30.058056, 31.228889]).addTo(earth);
	        // marker2.bindPopup("<b>Cairo</b><br>Yay, you found me!", {maxWidth: 120, closeButton: false});
			
			// var markerUK = WE.marker([ 48.8583701, 2.2944813 ], "/resources/custom/img/marker/UnitedKingdom.png", 24, 24, 0.0).addTo(earth);
			// markerUK.bindPopup('<h2>Eiffel Tower</h2><a href="javascript: $.clicksearch(\'Eiffel Tower\')" role="button"><img src="https://www.listchallenges.com/f/items/4e76ea71-f275-44df-a98f-0f75f9771a65.jpg" alt="..." class="img-circle img-responsive"></a>');
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
	</style>
</head>
<body onload="initialize()">
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="canvas">
		<div id="earth_div"></div>
	</div>
	
	<!-- <script type="text/javascript">navmenuInit();</script> -->
</body>
</html>