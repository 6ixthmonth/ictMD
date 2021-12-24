<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="/resources/template/assets/ico/favicon.png">
	
	<title>イメージ検索</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<!-- Bootstrap core CSS -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
	<link href="./resources/template/dist/css/jasny-bootstrap.min.css" rel="stylesheet" />
	<!-- <link href="./resources/template/css/bootstrap.min.css" rel="stylesheet" /> -->
	<!-- Custom styles for this template -->
	<link href="./resources/template/css/navmenu-reveal.css" rel="stylesheet" type="text/css" />
	<link href="./resources/template/css/style.css" rel="stylesheet" type="text/css" />
	<!-- <link href="./resources/template/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	<link href="./resources/template/css/animated-masonry-gallery.css" rel="stylesheet" type="text/css" />
	<link href="./resources/template/css/lightbox.css" rel="stylesheet" type="text/css" /> -->
	
	<script src="./resources/template/dist/js/jasny-bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="/resources/custom/css/menuBar.css">
	
</head>
<body>
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
			<li><a href="search">イメージ検索</a></li>
			<li><a href="analysis">トレンド分析</a></li>
			<li><a href="weatherNshopping">天気＆値段</a></li>
		</ul>
		<a class="navmenu-brand" href="main">
			<img src="/resources/custom/assets/icon/favicon.png" width="186px">
		</a>
		<div id="memberMenu">
			<c:if test="${userId == null}">
				<a href="loginPage">Login</a>
				<span> / </span>
				<a href="registerPage">Sign in</a>
				<br>
			</c:if>
			<c:if test="${userId != null}">
				<a href="logout">Logout</a>
				<br>
				<a href="fixPage">Edit</a>
				<span> / </span>
				<a href="secesionPage">Withdrawal</a>
				<c:if test="${userId == 'admin'}">
					<span> / </span>
					<a href="admin">Admin</a>
				</c:if>	
			</c:if>
		</div>
		<br>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
	
	
	<div class="canvas gallery">
	</div>
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- <script type="text/javascript" src="./resources/template/js/jquery-ui-1.10.4.min.js"></script> -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
	<!-- <script type="text/javascript" src="./resources/template/js/isotope.js"></script> -->
	<!-- <script type="text/javascript" src="./resources/template/js/animated-masonry-gallery.js"></script> -->
	
	<!-- <script src="./resources/template/js/lightbox.js"></script> -->
</body>
</html>
