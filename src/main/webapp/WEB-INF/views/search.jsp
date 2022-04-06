<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/commons/navmenuHeader.jsp" %>
	<style type="text/css">
		/* custom css for this page */
		.thumbnail>img {
			width: 100%;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/commons/navmenuBar.jsp" %>
	<div class="canvas">
		<div class="page-header">
			<h1>Search Photos <small>Subtext for header</small></h1>
		</div>
		<div class="container-fluid">
			<!-- Search form -->
			<form class="form-horizontal" action="/search/" method="get">
				<div class="form-group">
					<div class="input-group col-md-6">
						<input type="text" class="form-control" placeholder="Input any keywords" name="q" value="${q }">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">Search</button>
						</span>
					</div>
				</div>
			</form>

			<!-- Search results -->
			<c:choose>
				<c:when test="${empty q }">
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
											<img src="${photoList[j].getSquareLargeUrl() }">
											<%-- <img src="${photoList[j].getThumbnailUrl() }"> --%>
										</a>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div><!-- container-fluid -->
	</div><!-- canvas -->
	
	<div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- <script type="text/javascript">navmenuInit();</script> -->
	<script type="text/javascript">
		function getPhoto(photoId) {
			$.ajax({
				url: "getPhoto",
				type: "get",
				data: {
					photoId: photoId
				}
			}).done(showModal);
		}

		function showModal(photo) {
			console.log(photo);
			photo = JSON.parse(photo);

			// set title
			var title = photo.title;
			$("h4.modal-title").html(title);

			// set content
			var content = "photo content";
			$("div.modal-body").html(content);

			// show modal
			$("#photoModal").modal("show");
		}
	</script>
</body>
</html>
