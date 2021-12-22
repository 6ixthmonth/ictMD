<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>ハンサムFixPage</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./resources/css/registerPage.css">

<script src="https://code.jquery.com/jquery-1.3.2.min.js"></script>


<script>
 $(function (){
	$("#next1").attr("disabled", "disabled"); //next버튼 비활성화
	var currentCheck = false;
	var newCheck = true;
	var confirmNewCheck = true;
	$("#currentPwd").keyup(function(){
		var currentPwd = $("#currentPwd").val();
		
		$.ajax({
			url:"userCheck",
			type:"post",
			data:{
				userPwd:currentPwd
			},
			success:function(data){
				if(data){
					currentCheck = true;
					$("#curcheck").text("확인완료");

				} else{
					currentCheck = false;
					$("#curcheck").text("현재 비번이랑 다름 ㅇㅇ");

				}
			}
		});
	});
	
	
	
	$("#newPwd").keyup(function(){
		var newPwd = $("#newPwd").val();
		if((newPwd.length < 3 || newPwd.length > 16) && newPwd.length != 0){
			$("#passcheck").text("Password의 길이는 3자~16자로 설정해주셈!!");
			newCheck = false;
		} else if(newPwd == $("#currentPwd").val()) {
			$("#passcheck").text("현재 설정된 비밀번호와 같은 비밀번호입니다.");
			newCheck = false;
		} else {
			$("#passcheck").text("");
			newCheck = true;
		}
	});
	
	$("#confirmNewPwd").keyup(function(){
		var confirmNewPwd = $("#confirmNewPwd").val();
		if((confirmNewPwd.length < 3 || confirmNewPwd.length > 16) && confirmNewPwd.length != 0){
			$("#passcheck").text("Password의 길이는 3자~16자로 설정해주셈!!");
			confirmNewCheck = false;
		} else if(confirmNewPwd != $("#newPwd").val()) {
			$("#passcheck").text("새로 설정한 비밀번호랑 다름!!!");
			confirmNewCheck = false;
		} else {
			$("#passcheck").text("");
			confirmNewCheck = true;
		}
	});
	
	setInterval(function(){
		if(confirmNewCheck && newCheck && currentCheck){
			$("#next1").removeAttr("disabled");
		}
	}, 1000);
	
	$("#goFix").on('click',function(){
		var newPwd = $("#newPwd").val();
		var userName = $("#userName").val();
		var birth = $("#birth").val();
		var check = "";
		$("input[name=favorite]:checked").each(function(){
			check += $(this).val() + " ";
		});
		var camera = $("#model").val();
		
		$.ajax({
			url : "fixUserBase",
			type : "post",
			data : {
				userPwd : newPwd,
				userName : userName
			}
		});
		
		$.ajax({
			url : "fixUserDetail",
			type : "post",
			data : {
				birth : birth,
				model : camera,
				favorite : check
			},
			success:function(data){
				alert("수정완료!!");
				location.href="/ictmd/imsi";
			}
		});
	})
});
</script>
</head>

<body>
	<!-- multistep form -->
	<form id="msform">
		<!-- progressbar -->
		<ul id="progressbar">
			<li class="active">회원 기본정보</li>
			<li>회원 상세정보</li>
			<li>회원 정보확인</li>
		</ul>
		<!-- fieldsets -->
		<fieldset>
			<h2 class="fs-title">기본정보 입력</h2>
			<h3>변경하실 부분만 입력해주세요</h3>
			<br>
			<p align="left">Email : ${sessionScope.userId }</h3>
			<input type="hidden" id="userId" value="${sessionScope.userId }" />
			<br> <input type="password" id="currentPwd" name="cpass" placeholder="Current Password" />
			<p id="curcheck" style="font-size: 10px; color: red;" align="left"></p>
			<br> <input type="password" id="newPwd" name="npass" placeholder="New Password" />
			<p id="passcheck" style="font-size: 10px; color: red;" align="left"></p>
			<br> <input type="password" id="confirmNewPwd" name="cnpass"	placeholder="Confirm New Password" />
			<p id="confirmResult" style="font-size: 10px; color: red;" align="left"></p>
			<br> 
			<input type="text" id="userName" name="userName" placeHolder="User Name" />
			<br> 
			<input type="button" id="next1" name="next" class="next action-button" value="Next"  disabled=""/><br>
		</fieldset>
		<fieldset>

			<h2 class="fs-title">상세정보 입력</h2>
			<table style="width: 100%">
				<tr>
					<td colspan="3"><input type="date" id="birth" name="birth" /></td>
				</tr>
				<tr>
					<td colspan="3"><p style="color: grey;" align="left">[Favorite]</p></td>
				</tr>
				<tr style="height: 50px;">
					<td>
						<div style="width: 100%;">
							<input class="favorite" name="favorite" type="checkbox" value="풍경" style="width: 30%;"/>
							<span style="width: 50%;">풍경</span>
						</div>
					</td>
					<td>
						<div style="width: 100%;">
							<input class="favorite" name="favorite" type="checkbox" value="인물" style="width: 30%;"/>
							<span style="width: 50%;">인물</span>
						</div>
					</td>
					<td><div style="width: 100%;">
							<input class="favorite" name="favorite" type="checkbox" value="사람" style="width: 30%;"/>
							<span style="width: 50%;">사람</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<input type="text" id="model" name="camera" placeholder="Camera Model" /></td>
				</tr>
			</table>
			<input type="button" name="previous" class="previous action-button"
				value="Previous" /> <input type="button" id="next2" name="next"
				class="next action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">입력정보확인</h2>
			<input type="hidden" id="userId" value="${sessionScope.userId }"/>
			<table id="usercheck" align="left" style='width:100%'>
			<!--  js에서 가지고 옴 -->
			</table>
			<input type="button" name="previous" class="previous action-button" value="Previous" />
			<input type="button" id="goFix" class="submit action-button" value="Submit" />
		</fieldset>
	</form>
	<script	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
	<script src="./resources/js/registerPage.js"></script>

</body>
</html>