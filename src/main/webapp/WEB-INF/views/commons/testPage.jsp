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
			<h1>Search Image <small>Subtext for header</small></h1>
		</div>
		<div class="container-fluid">
			<!-- Search form -->
			<div class="row">
				<div class="col-md-12">
					<form class="navbar-form navbar-left" role="search" action="/test/search" method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Input any keywords" name="searchWord" value="${searchWord }">
						</div>
						<button type="submit" class="btn btn-default">Search</button>
					</form>
				</div>
			</div>

			<!-- Search results -->
			<c:choose>
				<c:when test="${empty searchWord }">
				</c:when>
				<c:when test="${empty photoList }">
					<div class="row">
						<div class="col-md-12">
							Search result not found
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="0" end="${photoList.size() - 1 }" step="4">
						<div class="row">
							<c:forEach var="j" begin="${i }" end="${i + 3 }">
								<div class="col-xs-6 col-md-3">
									<c:if test="${j < photoList.size() }">
										<a href="javascript:getPhoto(${photoList[j].getId() });" class="thumbnail">
											<img src="${photoList[j].getSquareLargeUrl() }" alt="img">
											<%-- <img src="${photoList[j].getThumbnailUrl() }" alt="img"> --%>
										</a>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script type="text/javascript">
		function getPhoto(photoId) {
			console.log(photoId);
		}
	</script>
</body>
</html>
