<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>ハンサムLoginPage</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/loginPage.css">
	
	<!-- jquery cdn -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
	
	<style>
	/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
	body {
		font-family: "proxima-nova", sans-serif;
		font-size: 16px;
		background-image: url("./resources/img/loginSpace.png");
	}
	
	body a {
		color: inherit;
		text-decoration: none;
	}
	
	* {
		outline: 0;
		border: 0;
		margin: 0;
	}
	
	.left {
		float: left;
	}
	
	.right {
		float: right;
	}
	
	header:after, .login-form:after, footer:after {
		content: "";
		display: table;
		clear: both;
	}
	
	.ui-panel {
		margin: 0 auto;
		margin-top: 120px;
		width: 360px;
		height: auto;
		background-color: black;
		color: white;
		border: 1px solid #161616;
		box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.3);
		position: absolute;
		margin-top: -130px;
		margin-left: -181px;
		top: 50%;
		left: 50%;
	}
	
	#goLogin:hover {
		cursor: pointer;
	}
	
	header {
		height: 46px;
		border-bottom: 1px solid #161616;
		line-height: 46px;
		padding: 0 28px;
		font-size: 0.65em;
		font-weight: 600;
		letter-spacing: 0.3em;
	}
	
	header .logo {
		text-transform: uppercase;
	}
	
	header span {
		color: #ffdd00;
	}
	
	.login-form {
		padding: 18px 28px 0 28px;
	}
	
	.login-form .subtitle {
		font-size: 0.92em;
	}
	
	.login-form input {
		font-size: 1.05em;
		font-weight: 300;
		margin-top: 18px;
		padding: 10px 8px;
		width: 288px;
	}
	
	footer {
		padding: 26px 28px 22px 28px;
		font-size: 0.82em;
	}
	
	footer .social-login i:first-child {
		margin-left: 4px;
	}
	
	footer .form-actions a {
		padding: 4px 8px;
	}
	
	footer .register {
		background-color: #ffdd00;
		color: black;
		border-radius: 2px;
	}
	
	body {
		width: 100%;
		height: 100%;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
	
	.overlay {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.88);
	}
	</style>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<!-- fa pls -->
	<link
		href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
		rel="stylesheet">
	
	<!-- animate.css -->
	<link
		href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/67239/animate.min.css"
		rel="stylesheet" />
</head>

<body>
	
	<!-- under overlay stuff -->
	<div class="body"></div>

	<!-- the panel -->
	<div class="overlay">
		<div class="ui-panel login-panel animated bounceInDown">
			<header>
				<div class="left logo">
					<a href="/ictmd">
						<span>35期Dクラス</span>ハンサム
					</a>
				</div>
	
				<div class="right">
					<a href="#close" id="close" class="ui-button close"> x </a>
				</div>
			</header>

			<div class="login-form">
				<div class="subtitle">ログイン</div>
				<input type="text" id="userId" placeholder="UserID" required="required" />
				<input type="password" id="userPwd" placeholder="Password" required="required" />
			</div>

			<footer>
				<div class="right form-actions">
					<a id="goLogin" class="ui-button inactive login">Login</a>
					<a href="/ictmd/registerPage" id="goRegister" class="ui-button inactive register">Register</a>
				</div>
			</footer>
		</div>
	</div>
	
	<div id="toMain">
		<form action="main">
			<input type="submit" value="メインへ">		
		</form>
	</div>
	<!-- get dem fancy typefaces -->
	<script type="text/javascript" src="//use.typekit.net/psm0wvc.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
	<script src="./resources/js/loginPage.js"></script>
</body>
</html>