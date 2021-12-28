var earth;
var options;

var initCSS = function() {
	var title = $("#title");
	title.html("世界の欲しい所にフォーカスしてみましょう。");
	title.css("color", "white");
	title.css("text-shadow", "1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue");
	title.css("top", "5%");
	title.css("margin-left", "-485px");
	title.css("z-index", "9995");
	title.css("animation", "none");
}

var flash = function() {
	$('.flash').show();
	$('.flash').animate({
		'opacity' : 0.9
	}, 300);
	$('.flash').fadeOut(1000);
	$('.flash').css({
		'opacity' : 1
	});
}

var flashStart = function(e) {
	if ($(".in").length) {
		return;
	}

	flash();
	initCSS();

	$("#firstShowed").hide();
	$("#imgsl").show();
}

function firstFunction() {
	$("#imgsl").hide();
	$("#lmInfo").hide();
	$('.flash').hide();
	$("#firstShowed").mouseup(function(e) {
		flashStart(e);
	});
	initialize();
}

function initialize() {
	options = {
		atmosphere : false,
		sky : false,
		center : [ 0, 0 ],
		zoom : 0,
		zooming : false
	};
	
	earth = new WE.map('earth_div', options);
	earth.setView([ 37.511981, 127.058544 ], 2.0);
	WE.tileLayer(
		'https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg',
		{
			tileSize : 256,
			bounds : [ [ -85, -180 ], [ 85, 180 ] ],
			minZoom : 2,
			maxZoom : 3,
			attribution : 'WebGLEarth example',
			tms : true
		}
	).addTo(earth);

	var before = null;
	requestAnimationFrame(function animate(now) {
		var c = earth.getPosition();
		var elapsed = before ? now - before : 0;
		before = now;
		earth.setCenter([ c[0], c[1] + 0.1 * (elapsed / 50) ]);
		requestAnimationFrame(animate);
	});

	markerimg = "./resources/img/marker/Eiffle_Tower.png";
	marker = WE.marker([ 48.8583701, 2.2944813 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Eiffel Tower</h2>'+
	'<a href="javascript: $.clicksearch(\'Eiffel Tower\')" role="button"><img src="https://www.listchallenges.com/f/items/4e76ea71-f275-44df-a98f-0f75f9771a65.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Big_Ben.png";
	marker = WE.marker([ 51.5007292, -0.1246254 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Big Ben</h2>'+
	'<a href="javascript: $.clicksearch(\'Big Ben\')" role="button"><img src="https://www.listchallenges.com/f/items/2c6fce4f-e410-4d50-80b6-870bc945b17b.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Leaning_Tower_of_Pisa.png";
	marker = WE.marker([ 43.722952, 10.396597 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Leaning Tower of Pisa, Pisa</h2>'+
	'<a href="javascript: $.clicksearch(\'Pisa\')" role="button"><img src="https://www.listchallenges.com/f/items/bb1fa37e-fd85-43ef-87a6-02387af5dc25.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Colosseum.png";
	marker = WE.marker([ 41.8902102, 12.4922309 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Colosseum</h2>'+
	'<a href="javascript: $.clicksearch(\'Colosseum\')" role="button"><img src="https://www.listchallenges.com/f/items/e71fd9ad-6027-44f2-93df-b0a284507c74.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Statue_of_Liberty.png";
	marker = WE.marker([ 40.699973, -73.996155 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Statue of Liberty</h2>'+
	'<a href="javascript: $.clicksearch(\'Statue of Liberty\')" role="button"><img src="https://www.listchallenges.com/f/items/a45acde9-68c5-4871-b49c-0a630890076b.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Hollywood.png";
	marker = WE.marker([ 34.1341151, -118.3215482 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Hollywood Sign</h2>'+
	'<a href="javascript: $.clicksearch(\'Hollywood\')" role="button"><img src="https://www.listchallenges.com/f/items/db282a05-f160-40b3-8129-035bcd322ccb.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Golden_Gate_Bridge.png";
	marker = WE.marker([ 37.8199286, -122.4782551 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Golden Gate Bridge</h2>'+
	'<a href="javascript: $.clicksearch(\'Golden Gate Bridge\')" role="button"><img src="https://www.listchallenges.com/f/items/6b26ad11-44d1-497c-897b-65ae86f67273.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Tokyo_Tower.png";
	marker = WE.marker([ 35.6585805, 139.7454329 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Tokyo Tower</h2>'+
	'<a href="javascript: $.clicksearch(\'Tokyo Tower\')" role="button"><img src="https://www.listchallenges.com/f/items/314a88a3-11a8-43cf-9369-4ce047cd0dfc.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Great_Wall.png";
	marker = WE.marker([ 40.4319077, 116.5703749 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Great Wall</h2>'+
	'<a href="javascript: $.clicksearch(\'Great Wall\')" role="button"><img src="https://www.listchallenges.com/f/items/a0015a10-617f-4077-a734-1d030ed48058.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Opera_House.png";
	marker = WE.marker([ -33.8567844, 151.2152967 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Opera House</h2>'+
	'<a href="javascript: $.clicksearch(\'Sydney Opera House\')" role="button"><img src="https://www.listchallenges.com/f/items/baccf057-63ee-4aa5-aab6-f0f1212d8fb7.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	/* markerimg = "./resources/img/marker/Cathedral.png";
	marker = WE.marker([ 55.7525229, 37.6230868 ], markerimg, 24, 24, 0.0).addTo(earth); */
	/* marker.bindPopup('<h2>St. Basil\'s Cathedral</h2>'+
	'<a href="javascript: $.clicksearch(\'Cathedral\')" role="button"><img src="https://www.listchallenges.com/f/items/8e410b50-6290-4c99-b92a-4bac3cb8b719.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Berlin_Wall.png";
	marker = WE.marker([ 52.5277821, 13.3772302 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Berlin Wall</h2>'+
	'<a href="javascript: $.clicksearch(\'Berlin Wall\')" role="button"><img src="https://www.listchallenges.com/f/items/ecf6bcac-2010-4b2a-bfba-a138602c9610.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Stonehenge.png";
	marker = WE.marker([ 51.1786068, -1.8262193 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Stonehenge</h2>'+
	'<a href="javascript: $.clicksearch(\'Stonehenge\')" role="button"><img src="https://www.listchallenges.com/f/items/a5f9eb7d-71f2-4710-a4c6-7c04a634c319.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Kilimanjaro.png";
	marker = WE.marker([ -3.0674245, 37.3381177 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Kilimanjaro</h2>'+
	'<a href="javascript: $.clicksearch(\'Kilimanjaro\')" role="button"><img src="https://www.listchallenges.com/f/items/0b047c9f-99e5-4f38-83f8-547f2dbe085f.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Uluru_-_Ayers_Rock.png";
	marker = WE.marker([ -25.3456562, 131.0196362 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Uluru - Ayers Rock</h2>'+
	'<a href="javascript: $.clicksearch(\'Uluru\')" role="button"><img src="https://www.listchallenges.com/f/items/7fb2cd5d-8abc-40a8-a25d-5aa7c8ebd216.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Taj_Mahal.png";
	marker = WE.marker([ 27.1750151, 78.0421552 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Taj Mahal</h2>'+
	'<a href="javascript: $.clicksearch(\'Taj Mahal\')" role="button"><img src="https://www.listchallenges.com/f/items/4dd9d779-3bc9-49d8-89d5-a34b133c6ab3.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Pyramids.png";
	marker = WE.marker([ 29.9792345, 31.1342019 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Pyramids of Giza</h2>'+
	'<a href="javascript: $.clicksearch(\'Pyramids\')" role="button"><img src="https://www.listchallenges.com/f/items/66b160d7-d2f9-4dca-887b-ae38651e69c7.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Christ_the_Redeemer.png";
	marker = WE.marker([ -22.9523902, -43.2125471 ], markerimg, 24, 24, 0.0).addTo(earth);
	/*  marker.bindPopup('<h2>Christ the Redeemer - Rio De Janerio</h2>'+
	'<a href="javascript: $.clicksearch(\'Christ the Redeemer\')" role="button"><img src="https://www.listchallenges.com/f/items/00472c34-0bbb-495c-8d3d-15b4e77918d1.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Moai.png";
	marker = WE.marker([ -27.1439625, -109.3326878 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Moai</h2>'+
	'<a href="javascript: $.clicksearch(\'Moai\')" role="button"><img src="https://www.listchallenges.com/f/items/6113cc48-e777-4474-bad1-481f7abd07d3.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Nyhavn.png";
	marker = WE.marker([ 55.6797154, 12.586421 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Nyhavn</h2>'+
	'<a href="javascript: $.clicksearch(\'Nyhavn\')" role="button"><img src="https://www.listchallenges.com/f/items-dl/5f61f3d7-e72f-4a00-b729-e8b8b6167aef.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Wailing_Wall.png";
	marker = WE.marker([ 31.7767189, 35.2345085 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Wailing Wall</h2>'+
	'<a href="javascript: $.clicksearch(\'Wailing Wall\')" role="button"><img src="https://www.listchallenges.com/f/items/6b3f2257-1ed4-4273-ad2f-48bc567820ed.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Newgrange.png";
	marker = WE.marker([ 53.6947119, -6.4754917 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Newgrange</h2>'+
	'<a href="javascript: $.clicksearch(\'Newgrange\')" role="button"><img src="https://www.listchallenges.com/f/items/cea40c98-ae81-4980-8d43-07ba977917a3.jpg" alt="..." class="img-circle img-responsive"></a>'); */

	markerimg = "./resources/img/marker/Gyeongbokgung.png";
	marker = WE.marker([ 37.579617, 126.977041 ], markerimg, 24, 24, 0.0).addTo(earth);
	/* marker.bindPopup('<h2>Gyeongbokgung, Korea-South</h2>'+
	'<a href="javascript: $.clicksearch(\'Gyeongbokgung\')" role="button"><img src="https://lh5.googleusercontent.com/proxy/XmnHVngvJ-_FVag6Ma79DoDsi0qverft5987BW75y6GNmBPr_G_mJJptp_TfLztBfDRbZxUOjb4xwd2u-b43X4FtGGhqOrSMN9yRO6ik_GSMCBbgb2uiFuMhSCWuL9iSttVS2afN9fYBZH6bZXZkUDknj0GnMo8=w408-h270-k-no" alt="..." class="img-circle img-responsive"></a>'); */
}

/* $(()=>{
	"use strict";
	$.clicksearch = (landmark)=>{
		var tags = landmark
		$("#gosearch").attr("action","goClickSearch");
		$("#gosearch").attr("method","POST");
		$("#tags").attr("name","tags");
		$("#tags").val(tags);
		$("#gosearch").submit();
	}
}); */

$('#myCarousel').carousel({
	interval : 6000
});

var clicksearch = function(tags) {
	$("#gosearch").attr("action", "goClickSearch");
	$("#gosearch").attr("method", "POST");
	$("#tags").attr("name", "tags");
	$("#tags").val(tags);
	$("#gosearch").submit();
}
var brandnew = function(name) {
	$.ajax({
		data : {
			tag : name
		},
		method : "POST",
		url : "brandnew",
		success : function(resp) {
			$("#lmTitle").html(name);
			// $("#lmLocation").html("緯度：" + resp["latitude"] + "<br>經度：" + resp["longitude"]);
			$("#lmSearch").off();
			$("#lmImage > img").remove();
			$("#lmImage").append("<img src='" + resp["url"] + "'>");
			$("#lmImage").off();
			$("#lmImage").hover(function() {
				$("#lmImage").css("opacity", "0.8");
			}, function() {
				$("#lmImage").css("opacity", "1");
			});
			$("#lmImage").on("click", function() {
				clicksearch(name);
			});
			$("#lmImage > img").on("load", function() {
				$("#lmInfo").show();
			});
		}
	});
}

document.onmouseover = function(e) {
	var target = e.target;
	if (target.className == "we-pm-icon") {
		var str = window.getComputedStyle(e.target, null).background;
		var start = str.indexOf("marker/");
		var end = str.indexOf(".png");
		var strarr = str.substring(start + 7, end).split("_");
		var name = "";
		for (var i in strarr) {
			name += strarr[i] + " ";
		}
		name = name.substring(0, name.length - 1);
		brandnew(name);
	} else if (target.className == "thumb") {
		var name = target.getAttribute("alt");
		brandnew(name);
	}
}