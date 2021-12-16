<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>관리자 페이지</title>
	<link href="/resources/templete/assets/ico/favicon.png" rel="shortcut icon">
	
	<!-- Bootstrap core CSS -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="/resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<link href="/resources/templete/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="/resources/templete/css/style.css" rel="stylesheet">
	<link href="/resources/templete/css/full-slider.css" rel="stylesheet">
	<link href="/resources/templete/css/Icomoon/style.css" rel="stylesheet">
	<link href="/resources/templete/css/animated-masonry-gallery.css" rel="stylesheet">
	<link href="/resources/templete/css/lightbox.css" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!-- CSS not related to template -->
	<link href="/resources/css/admin.css" rel="stylesheet">
	
	<script type="text/javascript" src="/resources/templete/js/jquery.js"></script>
	<script type="text/javascript" src="/resources/js/admin.js"></script>
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
		<div id="back">
			<h1 class="blog-post-title text-center" style="color:white;">ADMIN_PAGE</h1>
			<div align="center" style="margin-top:50px;">
				<div style="display: inline-block; width: 70%;">
					<input type="button" id="btnInsertFormModel" value="モデル入力" style="margin-bottom: 20px; float: right;">
				</div>
				<table id="adminTbl" border="1" style="width: 70%; color: #fff; background-color: #000; opacity: 0.9;">
					<tr style="height: 25px;">
						<td style="width: 20%; text-align: center;">MAKER</td>
						<td style="width: 50%; text-align: center;">MODEL</td>
						<td style="width: 30%; text-align: center;">TYPE</td>
					</tr>
					<c:forEach var="model" items="${modelList}">
						<tr style="height: 35px;">
							<td style="width: 20%; text-align: center;">${model.maker}</td>
							<td style="width: 50%; text-align: center;">${model.model}</td>
							<td style="width: 30%; text-align: center;"> ${model.type}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script type="text/javascript" src="/resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/templete/js/isotope.js"></script>
	<script type="text/javascript" src="/resources/templete/js/animated-masonry-gallery.js"></script>
	<script type="text/javascript" src="/resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	
	<script type="text/javascript" src="/resources/templete/js/lightbox.js"></script>
	
	<!-- <script type="text/javascript" src="/resources/js/main.js"></script> -->
	<!-- <script type="text/javascript">
		var x = function initialize(){
			var mtotag = '${mtotag}';
			
			$("#text").val(mtotag);
			if(mtotag!=null){
				search();
			}
		};
		
		$(()=>{
			x();
		});
	</script> -->
</body>
</html>
