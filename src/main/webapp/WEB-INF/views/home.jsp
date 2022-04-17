<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/custom/css/main.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>

	<div class="canvas">
		<!-- Search window -->
		<form class="form-horizontal" action="/search/" method="get">
			<div class="form-group">
				<div class="col-md-11">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search Photos" name="q">
						<div class="input-group-btn">
							<button type="submit" class="btn btn-default">Search</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- WebGL Earth object -->
		<div id="earth"></div>

		<!-- Landmark image carousel -->
		<div id="landmark-carousel" class="carousel slide" data-ride="carousel">
			<!-- <div style="position:absolute; top:0; text-align:center; width:100%; transform:translate(0, 0); z-index:1;">Click to Search Latest Photo</div> -->
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox"></div>

			<!-- Controls -->
			<a class="left carousel-control" href="#landmark-carousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<!-- <span class="icon-prev" aria-hidden="true"></span> -->
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#landmark-carousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<!-- <span class="icon-next" aria-hidden="true"></span> -->
				<span class="sr-only">Next</span>
			</a>
		</div>

		<!-- Custom window for showing search result -->
		<div id="search-result">
			<!-- <div style="position:absolute; top:0; text-align:center; width:100%; transform:translate(0, 0); z-index:1;">Click to Search More Photo</div> -->
			<div class="result-inner"></div>
		</div>
	</div>

	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script src="http://www.webglearth.com/v2/api.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/custom/js/main.js"></script>
</body>
</html>
