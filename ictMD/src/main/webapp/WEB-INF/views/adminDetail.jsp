<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
	
	<title>사진 검색</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="/ /maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="./resources/templete/css/style.css" rel="stylesheet">
	<link href="./resources/templete/css/full-slider.css" rel="stylesheet">
	<link href="./resources/templete/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/animated-masonry-gallery.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/lightbox.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	<script type="text/javascript" src="./resources/js/admin.js"></script>
	<style>
    #back {
    	align:center;
    	background-image: url("./resources/img/searchImg/camera_black_center.jpg");
    	background-size:100%;
    	padding-bottom: 700px;
    	margin-left : 85px;
    	margin-right : 150px;
    }
    input{
    	color : #000;
    }
   </style> 
</head>
<body>
<input type="hidden" id="mtotag" value="${mtotag}">
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
			<li><a href="search">検索</a></li>
			<li><a href="analysis">分析</a></li>
			<li><a href="weatherNshopping">天気＆ショッピング</a></li>
			<c:if test="${userId == null}">
				<li><a href="loginPage">ログイン</a></li><li><a href="registerPage">会員登録</a></li>
			</c:if>
			<c:if test="${userId != null}">
				<li><a href="fixPage">登録情報の編集</a></li>
				<li><a href="secesionPage">IDの削除</a></li>
				<li><a href="logout">ログアウト</a></li>
				<c:if test="${userId == 'admin'}">
					<li><a href="admin">管理者ページ</a></li>
				</c:if>	
			</c:if>
		</ul>
		<a class="navmenu-brand" href="#"><img src="./resources/templete/img/logo.png" width="160"></a>
		<div class="social">
			<a href="#"><i class="fa fa-twitter"></i></a>
			<a href="#"><i class="fa fa-facebook"></i></a>
			<a href="#"><i class="fa fa-instagram"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
			<a href="#"><i class="fa fa-google-plus"></i></a>
			<a href="#"><i class="fa fa-skype"></i></a>
		</div>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>

	<div class="canvas gallery">
		<div id="bback">
			<div id="back">
				<h1 class="blog-post-title text-center" style="color:white;" >ADMIN_PAGE</h1>
				<div align="center" style="margin-top:50px;">
					<form id="formDetail" method="get">
						<table border="2" style="width: 90%; color: #fff; background-color: #000; opacity: 0.9;">
							<tr>
								<td style="width: 25%; text-align: center;">
									MAKER<br>
									<input type="text" name="maker" value="${detail.maker}">
								</td>
								<td style="width: 25%; text-align: center;">
									IMGURL<br>
									<input type="text" name="imgUrl" value="${detail.imgUrl}">
								</td>
								<td style="width: 25%; text-align: center;">
									TYPE<br>
									<input type="text" name="type" value="${detail.type}">
								</td>
								<td style="width: 25%; text-align: center;">
									MODEL<br>
									<c:if test="${ insert eq 'false' }">
										<input type="text" name="model" value="${detail.model}" readonly>
									</c:if>
									<c:if test="${ insert eq 'true' }">
										<input type="text" name="model" value="${detail.model}">
									</c:if>
									<input type="hidden" id="model" value="${detail.model}"/>
								</td>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">
									CMOS<br>
									<input type="text" name="cmos" value="${detail.cmos}">
								</td>
								<td style="width: 25%; text-align: center;">
									SENSOR<br>
									<input type="text" name="sensor" value="${detail.sensor}">
								</td>
								<td style="width: 25%; text-align: center;">
									IMAGEPROCESSOR<br>
									<input type="text" name="imageProcessor" value="${detail.imageProcessor}">
								</td>
								<td style="width: 25%; text-align: center;">
									SCREEN<br>
									<input type="text" name="screen" value="${detail.screen}">
								</td>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">
									VIEWFINDER<br>
									<input type="text" name="viewFinder" value="${detail.viewFinder}">
								</td>
								<td style="width: 25%; text-align: center;">
									MAXISO<br>
									<input type="text" name="maxISO" value="${detail.maxISO}">
								</td>
								<td style="width: 25%; text-align: center;">
									IMASHUTTERSPEED<br>
									<input type="text" name="shutterSpeed" value="${detail.shutterSpeed}">
								</td>
								<td style="width: 25%; text-align: center;">
									CONTINUOUSSHOOTING<br>
									<input type="text" name="continuousShooting" value="${detail.continuousShooting}">
								</td>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">
									AF<br>
									<input type="text" name="af" value="${detail.af}">
								</td>
								<td style="width: 25%; text-align: center;">
									FOCUSAREA<br>
									<input type="text" name="focusArea" value="${detail.focusArea}">
								</td>
								<td style="width: 25%; text-align: center;">
									FLASH<br>
									<input type="text" name="flash" value="${detail.flash}">
								</td>
								<td style="width: 25%; text-align: center;">
									VIDEOQUALITY<br>
									<input type="text" name="videoQuality" value="${detail.videoQuality}">
								</td>
							</tr>
							<tr>
								<td style="width: 25%; text-align: center;">
									PIXEL<br>
									<input type="text" name="pixel" value="${detail.pixel}">
								</td>
								<td style="width: 25%; text-align: center;">
									VOLUME<br>
									<input type="text" name="volume" value="${detail.volume}">
								</td>
								<td style="width: 25%; text-align: center;">
									WEIGHT<br>
									<input type="text" name="weight" value="${detail.weight}">
								</td>
								<td style="width: 25%; text-align: center;">
									ETC<br>
									<input type="text" name="etc" value="${detail.etc}">
								</td>
							</tr>
						</table>
					</form>
					<div style="margin-top: 20px;">
						<c:if test="${ insert eq 'false' }">
							<input type="button" id="btnUpdateModel" value="修正">
							<input type="button" id="btnDeleteModel" value="削除">
						</c:if>
						<c:if test="${ insert eq 'true' }">
							<input type="button" id="btnInsertModel" value="登録">
						</c:if>
					</div>
				</div>
			
			
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script type="text/javascript" src="./resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./resources/templete/js/isotope.js"></script>
	<script type="text/javascript" src="./resources/templete/js/animated-masonry-gallery.js"></script>
	<script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	<!-- <script src="./resources/js/main.js"></script> -->
	<script src="./resources/templete/js/lightbox.js"></script>
	
</body>
</html>
