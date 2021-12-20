<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="/resources/templete/assets/ico/favicon.png">
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" href="/resources/templete/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/templete/dist/css/jasny-bootstrap.min.css">
	<!-- Custom styles for this template -->
	<link href="/resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="/resources/templete/css/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/templete/dist/js/jasny-bootstrap.min.js"></script>
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
			<li><a href="/main">メイン</a></li>
			<li><a href="/search">検索</a></li>
			<li><a href="/analysis">分析</a></li>
			<li><a href="/weatherNshopping">天気＆ショッピング</a></li>
			<c:if test="${userId == null}">
				<li><a href="/loginPage">ログイン</a></li><li><a href="registerPage">会員登録</a></li>
			</c:if>
			<c:if test="${userId != null}">
				<li><a href="/fixPage">登録情報の編集</a></li>
				<li><a href="/secesionPage">IDの削除</a></li>
				<li><a href="/logout">ログアウト</a></li>
				<c:if test="${userId == 'admin'}">
					<li><a href="/admin">管理者ページ</a></li>
				</c:if>	
			</c:if>
		</ul>
		<a class="navmenu-brand" href="/main"><img src="/resources/templete/img/logo.png" width="160"></a>
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
</body>
</html>