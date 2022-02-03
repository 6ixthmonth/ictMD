<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	
	<link href="/resources/custom/css/thumbs2.css" rel="stylesheet">
	<link href="/resources/custom/css/thumbnail-slider.css" rel="stylesheet">
	
	<link rel="stylesheet" href="/resources/custom/css/main.css">
	
	<script type="text/javascript" src="/resources/custom/js/thumbnail-slider.js"></script>
	<script type="text/javascript" src="http://www.webglearth.com/v2/api.js"></script>
</head>

<body onload="firstFunction()">
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	
	<div class="flash"></div>
	<div id="myCarousel" class="canvas" data-ride="carousel">
		<div id="title">Click!</div>
		<img id="firstShowed" src="/resources/img/firstCamera.jpg">
		<div id="earth_div">
			<!--start-->
			<div id="imgsl">
				<div style="float: left;">
					<div id="thumbs2">
						<div class="inner">
							<ul>
								<li><a><img class="thumb" alt="Gyeongbokgung" src="https://lh5.googleusercontent.com/proxy/XmnHVngvJ-_FVag6Ma79DoDsi0qverft5987BW75y6GNmBPr_G_mJJptp_TfLztBfDRbZxUOjb4xwd2u-b43X4FtGGhqOrSMN9yRO6ik_GSMCBbgb2uiFuMhSCWuL9iSttVS2afN9fYBZH6bZXZkUDknj0GnMo8=w408-h270-k-no"></a></li>
								<li><a><img class="thumb" alt="Big Ben" src="https://www.listchallenges.com/f/items/2c6fce4f-e410-4d50-80b6-870bc945b17b.jpg"></a></li>
								<li><a><img class="thumb" alt="Leaning Tower of Pisa" src="https://www.listchallenges.com/f/items/bb1fa37e-fd85-43ef-87a6-02387af5dc25.jpg"></a></li>
								<li><a><img class="thumb" alt="Colosseum" src="https://www.listchallenges.com/f/items/e71fd9ad-6027-44f2-93df-b0a284507c74.jpg"></a></li>
								<li><a><img class="thumb" alt="Statue of Liberty" src="https://www.listchallenges.com/f/items/a45acde9-68c5-4871-b49c-0a630890076b.jpg"></a></li>
								<li><a><img class="thumb" alt="Hollywood" src="https://www.listchallenges.com/f/items/db282a05-f160-40b3-8129-035bcd322ccb.jpg"></a></li>
								<li><a><img class="thumb" alt="Golden Gate Bridge" src="https://www.listchallenges.com/f/items/6b26ad11-44d1-497c-897b-65ae86f67273.jpg"></a></li>
								<li><a><img class="thumb" alt="Tokyo Tower" src="https://www.listchallenges.com/f/items/314a88a3-11a8-43cf-9369-4ce047cd0dfc.jpg"></a></li>
								<li><a><img class="thumb" alt="Great Wall" src="https://www.listchallenges.com/f/items/a0015a10-617f-4077-a734-1d030ed48058.jpg"></a></li>
								<li><a><img class="thumb" alt="Opera House" src="https://www.listchallenges.com/f/items/baccf057-63ee-4aa5-aab6-f0f1212d8fb7.jpg"></a></li>
								<!-- <li><a><img class="thumb" alt="St. Basils Cathedral" src="https://www.listchallenges.com/f/items/8e410b50-6290-4c99-b92a-4bac3cb8b719.jpg"></a></li> -->
								<li><a><img class="thumb" alt="Eiffel Tower" src="https://www.listchallenges.com/f/items/4e76ea71-f275-44df-a98f-0f75f9771a65.jpg"></a></li>
								<li><a><img class="thumb" alt="Stonehenge" src="https://www.listchallenges.com/f/items/a5f9eb7d-71f2-4710-a4c6-7c04a634c319.jpg"></a></li>
								<li><a><img class="thumb" alt="Kilimanjaro" src="https://www.listchallenges.com/f/items/0b047c9f-99e5-4f38-83f8-547f2dbe085f.jpg"></a></li>
								<li><a><img class="thumb" alt="Uluru - Ayers Rock" src="https://www.listchallenges.com/f/items/7fb2cd5d-8abc-40a8-a25d-5aa7c8ebd216.jpg"></a></li>
								<li><a><img class="thumb" alt="Taj Mahal" src="https://www.listchallenges.com/f/items/4dd9d779-3bc9-49d8-89d5-a34b133c6ab3.jpg"></a></li>
								<li><a><img class="thumb" alt="Berlin Wall" src="https://www.listchallenges.com/f/items/ecf6bcac-2010-4b2a-bfba-a138602c9610.jpg"></a></li>
								<li><a><img class="thumb" alt="Pyramids" src="https://www.listchallenges.com/f/items/66b160d7-d2f9-4dca-887b-ae38651e69c7.jpg"></a></li>
								<li><a><img class="thumb" alt="Christ the Redeemer" src="https://www.listchallenges.com/f/items/00472c34-0bbb-495c-8d3d-15b4e77918d1.jpg"></a></li>
								<li><a><img class="thumb" alt="Moai" src="https://www.listchallenges.com/f/items/6113cc48-e777-4474-bad1-481f7abd07d3.jpg"></a></li>
								<li><a><img class="thumb" alt="Nyhavn" src="https://www.listchallenges.com/f/items-dl/5f61f3d7-e72f-4a00-b729-e8b8b6167aef.jpg"></a></li>
								<li><a><img class="thumb" alt="Wailing Wall" src="https://www.listchallenges.com/f/items/6b3f2257-1ed4-4273-ad2f-48bc567820ed.jpg"></a></li>
								<li><a><img class="thumb" alt="Newgrange" src="https://www.listchallenges.com/f/items/cea40c98-ae81-4980-8d43-07ba977917a3.jpg"></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>
			<!--end-->
		</div>
		<div id="lmInfo">
			<div id="lmFrame">
				<div id="lmTitle"></div>
				<div id="lmLocation"></div>
				<br>
				<div id="lmImage"></div>
				<br>
				<div style="font-size: 90%; font-style: italic; color: #337ab7">イメージをクリックして今すぐ検索！</div>
			</div>
		</div>
	</div>

	<form id="gosearch">
		<input type="hidden" id="tags">
	</form>

	<script type="text/javascript" src="/resources/custom/js/main.js"></script>
</body>
</html>