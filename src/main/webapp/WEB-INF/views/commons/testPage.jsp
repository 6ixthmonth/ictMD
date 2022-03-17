<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>

	<style type="text/css">
		/* custom css for this page */
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>

	<div class="canvas">
		<div class="page-header">
			<h1>Search page header <small>Subtext for header</small></h1>
		</div>
		<form class="navbar-form navbar-left" role="search" action="/test/search" method="get">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search" name="searchWord">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
		<br>
		<br>
		<br>
		<br>
		<br>

		<c:choose>
			<c:when test="${empty photoList }">
				Search result not found
			</c:when>
			<c:otherwise>
				<c:forEach items="${photoList }" var="photo" varStatus="status">
					<c:if test="${status.index % 4 == 0 }">
						<div class="row">
					</c:if>
						<div class="col-xs-6 col-md-3">
							<c:if test="${not status.last }">
								<a href="#" class="thumbnail">
									<img src="${photo.getSquareLargeUrl() }" alt="i">
								</a>
							</c:if>
						</div>
					<c:if test="${status.index % 4 == 0 }">
						</div>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script type="text/javascript">
		// custom script for this page
	</script>
</body>
</html>
