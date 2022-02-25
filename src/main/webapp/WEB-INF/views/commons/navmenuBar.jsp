<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="bar">
	<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
</div>
<div class="navmenu navmenu-default navmenu-fixed-left">
	<ul class="nav navmenu-nav">
		<li><a href="/main">Home</a></li>
		<li><a href="">Image Search</a></li>
		<li><a href="">Trend Analysis</a></li>
		<!-- <li><a href="">Weather &amp; Shopping</a></li> -->
	</ul>
	<a class="navmenu-brand" href="#"><img src="${pageContext.request.contextPath}/resources/custom/img/logo.png" width="160"></a>
	<div class="social">
		<c:choose>
			<c:when test="${empty userid }">
				<a href="#"><i class="fa">Sign in</i></a>
				<a href="#"><i class="fa">Sign up</i></a>
			</c:when>
			<c:otherwise>
				<a href="#"><i class="fa">Sign out</i></a>
				<a href="#"><i class="fa">Edit</i></a>
				<a href="#"><i class="fa">Withdrawal</i></a>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- <div class="social">
		<a href="#"><i class="fa fa-twitter"></i></a>
		<a href="#"><i class="fa fa-facebook"></i></a>
		<a href="#"><i class="fa fa-instagram"></i></a>
		<a href="#"><i class="fa fa-pinterest-p"></i></a>
		<a href="#"><i class="fa fa-google-plus"></i></a>
		<a href="#"><i class="fa fa-skype"></i></a>
	</div> -->
	<div class="copyright-text">©Copyright <a href="https://github.com/6ixthmonth/ictMD" target="_blank"> #ハンサム</a> 2018 </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/template/dist/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/template/js/bootstrap.min.js"></script>

<!-- Custom script to init css -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/custom/js/navmenu.js"></script>