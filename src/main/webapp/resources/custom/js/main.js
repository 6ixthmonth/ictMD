let earth;
let markers = [];

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
	let before = null;
	requestAnimationFrame(function animate(now) {
		let c = earth.getPosition();
		let elapsed = before ? now - before : 0;
		before = now;
		earth.setCenter([ c[0], c[1] + 0.1 * (elapsed / 30) ]);
		requestAnimationFrame(animate);
	});

	// Add click event to close all popups when earth obj has been clicked.
	earth.on("click", closeAllPopups);
}

function closeAllPopups() {
	// Close each popup.
	for (const marker of markers) {
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
		let markerImgUrl = "https://flagicons.lipis.dev/flags/1x1/" + item.alphaTwoCode + ".svg";
		let marker = WE.marker([ item.latitude, item.longitude ], markerImgUrl, 24, 24).addTo(earth);
		markers.push(marker);

		// Make popup and bind to marker.
		let popupHtml = "";
		popupHtml += "<h2>" + item.landmark + "</h2>";
		popupHtml += "<h4>" + item.countryName + "</h4>";
		popupHtml += "<img src='" + item.imgUrl + "'>";
		marker.bindPopup(popupHtml);
	});
}

function initCarousel(landmarks) {
	// Init carousel.
	let carouselHtml = "";
	$.each(landmarks, function(index, item) {
		carouselHtml += "<div class='item' onclick='setEarth(" + index + ", " + item.latitude + ", " + item.longitude + ", \"" + item.landmark + "\", \"" + item.countryName + "\")'>";
		carouselHtml += "	<img src='" + item.imgUrl + "'>";
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
		url: "/search/getSquareLargeUrl",
		type: "get",
		data: {
			query: landmark
		}
	}).done(function(url) {
		let popupHtml = "";
		// popupHtml += "<div onclick='searchImg(\"" + landmark + "\")'>";
		popupHtml += "<div>";
		popupHtml += "	<img src='" + url + "'>";
		popupHtml += "	<div class='result-caption'>";
		popupHtml += "		<h4>" + landmark + "</h4>";
		popupHtml += "		<h5>" + countryName + "</h5>";
		popupHtml += "	</div>";
		popupHtml += "</div>";

		$(".result-inner").html(popupHtml);
		$("#search-result").show();
	});
}