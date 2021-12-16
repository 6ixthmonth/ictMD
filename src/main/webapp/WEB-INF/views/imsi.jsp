<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	$(function() {
		$("#logout").click(function() {
			$.ajax({
				url : "logout",
				type : "get",
				success : function(data) {
					alert("bye~");
					location.href = "/ictmd"
				}
			});
		});

		$("#wNs").click(function() {
			location.href = "/ictmd/weatherNshopping";
		});

		$("#secesion").click(function() {
			var result1 = confirm("本当に会員IDを削除しますか。");
			if (result1) {
				var userPwd = prompt("탈퇴절차를 위하여 귀하의 비밀번호 입력해주세요");
				$.ajax({
					url : "secesionCheck",
					type : "post",
					data : {
						userPwd : userPwd
					},
					success : function(data) {
						if (data == 1) {
							alert("슬프지만 이젠 안녕....");   
							location.href = "/ictmd"
						} else {
							alert("응 너 비번틀림 ㅅㄱ");
							return;
						}
					}
				});
			} else {
				alert("탈퇴취소했네? ㄳㄳ");
				return;
			}
		})
	});
</script>
</head>
<body>

	<h1>뀨뀨 로그인성공 ㅊㅋㅊㅋ</h1>
	<h1>${sessionScope.userId }님안녕?</h1>
	<h1>${sessionScope.userName }님ㅎㅇㅎㅇ</h1>
	<a id="wNs">날씨와 쇼핑</a>
	<br>
	<br>
	<a id="logout">로그아웃하고싶으면 이거눌러 ㅋ</a>
	<br>
	<br>
	<a href="fixPage">아니면 회원정보수정하고싶은 이거 누르고 ㅋㅋ</a>
	<br>
	<br>
	<a href="secesionPage">회원탈퇴</a>

</body>
</html>