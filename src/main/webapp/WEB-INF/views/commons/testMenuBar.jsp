<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ICT More Detail</title>

<!-- Default bootstrap settings -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- Template settings -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="/resources/template/dist/css/jasny-bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/template/css/navmenu-reveal.css">
<link rel="stylesheet" type="text/css" href="/resources/template/css/style.css">
<script type="text/javascript" src="/resources/template/dist/js/jasny-bootstrap.min.js"></script>

<!-- Custom CSS -->
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
			<li><a href="${pageContext.request.contextPath}/main">HOME</a></li>
			<li><a href="${pageContext.request.contextPath}/search">Image Search</a></li>
			<li><a href="${pageContext.request.contextPath}/analysis">Trend Analysis</a></li>
			<li><a href="${pageContext.request.contextPath}/weatherNshopping">Weather &amp; Shopping</a></li>
		</ul>
		<a class="navmenu-brand" href="${pageContext.request.contextPath}/main">
			<img src="${pageContext.request.contextPath}/resources/custom/assets/icon/favicon.png" width="186px">
		</a>
		<div class="social">
			<c:choose>
				<c:when test="${empty userId }">
					<a href="#"><i class="fa fa-twitter">Sign in</i></a>
					<a href="#"><i class="fa fa-facebook">Sign Up</i></a>
				</c:when>
				<c:otherwise>
					<a href="#"><i class="fa fa-instagram">Sign Out</i></a>
					<a href="#"><i class="fa fa-pinterest-p">Edit</i></a>
					<a href="#"><i class="fa fa-google-plus">Withdrawal</i></a>
					<c:if test="${userId == 'admin'}">
						<a href="#"><i class="fa fa-skype">Admin</i></a>
					</c:if>	
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
</body>
</html>