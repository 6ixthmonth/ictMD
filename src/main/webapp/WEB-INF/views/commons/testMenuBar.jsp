<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Default bootstrap settings -->
<link rel="stylesheet"  type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- Template settings -->
<link rel="stylesheet"  type="text/css" href="/resources/template/dist/css/jasny-bootstrap.min.css">
<link rel="stylesheet"  type="text/css" href="/resources/template/css/navmenu-reveal.css">
<link rel="stylesheet"  type="text/css" href="/resources/template/css/style.css">
<script src="/resources/template/dist/js/jasny-bootstrap.min.js"></script>

</head>
<body>
	<div class="bar">
		<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas"></button>
	</div>
	<div class="navmenu navmenu-default navmenu-fixed-left">
		<ul class="nav navmenu-nav">
			<li><a href="${pageContext.request.contextPath}/main">メイン</a></li>
			<li><a href="${pageContext.request.contextPath}/search">イメージ検索</a></li>
			<li><a href="${pageContext.request.contextPath}/analysis">トレンド分析</a></li>
			<li><a href="${pageContext.request.contextPath}/weatherNshopping">天気＆値段</a></li>
		</ul>
		<a class="navmenu-brand" href="main">
			<img src="${pageContext.request.contextPath}/resources/template/assets/ico/favicon.png" width="186px">
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
</body>
</html>