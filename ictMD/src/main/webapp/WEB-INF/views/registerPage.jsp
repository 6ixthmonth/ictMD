<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>ハンサムLoginPage</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./resources/css/registerPage.css">

<script src="https://code.jquery.com/jquery-1.3.2.min.js"></script>


<script>
 $(function (){
	$("#next1").attr("disabled", true); //next버튼 비활성화
	$("#userId").keyup(emailcheck);
	$("#userPwd").keyup(passcheck);
	$("#confirmPassChk").keyup(confirmPassChk);
	function emailcheck(){
		var userId= $(this).val();
		if(userId.indexOf("@")==-1){
			$("#emailcheck").text("正しいEmailを書いてください。");
		}else{
			$("#emailcheck").text("");
			$.ajax({
				type : "get",
				url : "emailCheck",
				data : {
					userId : userId
				},
				success:function(data){
					if(data){
						$("#emailcheck").text("すでに使われている文字列です。長くするか、別の文字に変更してください。");
						$("#next1").attr("disabled", true);
					}else{
						$("#emailcheck").text("使用できます。");
						$("#next1").attr("disabled", false);
					}
				}
			});
		}
	};
	
	function passcheck(){
		var userPwd=$(this).val();
		if(userPwd.length < 3 || userPwd.length > 16){
			$("#passcheck").text("Passwordの長さは 3字~16字です。");
		}else{
			$("#passcheck").text("");
			
			var confirmPassChk=$("#confirmPassChk").val();
			console.log("password : " + userPwd);
			console.log("confirm : " + $("#confirmPassChk").val());
			
			if(confirmPassChk != userPwd){
				$("#passcheck").text("passwordが違います。確認してください。");

			}else{
				$("#passcheck").text("");
				
				var confirmPassChk=$("#confirmPassChk").val();
				console.log("password : " + userPwd);
				console.log("confirm : " + $("#confirmPassChk").val());
				
				if(confirmPassChk != userPwd){
					$("#passcheck").text("passwordが違います。確認してください。");
				}else{
					$("#passcheck").text("");
					$("#confirmResult").text("");
				}
			}
		}

	}
	
	function confirmPassChk(){
		var confirmPassChk=$(this).val();
		if(confirmPassChk != $("#userPwd").val()){
			$("#confirmResult").text("passwordが違います。確認してください。");
		}else{
			$("#confirmResult").text("");
			
			if($("#passcheck").text() != "") {
				$("#passcheck").text("");
			}
		}
	}
	
	$("#submit").on("click", function(){
		var userId=$("#userId").val();
		var userPwd=$("#userPwd").val();
		var userName=$("#userName").val();
		var birth=$("#birth").val();
		var favorite = "";
		$("input[name=favorite]:checked").each(function(){
			favorite += $(this).val() + " ";
		});
		var model=$("#model").val();
		$.ajax({
			type : "post",
			url : "insertuserBase",
			data : {
				userId : userId,
				userPwd : userPwd,
				userName : userName
			}
		});
		$.ajax({
			type : "post",
			url : "insertuserDetail",
			data :{
				userId : userId,
				birth : birth,
				favorite : favorite,
				model : model
			}, success:function (){
				alert("会員登録おめでとうございます。");
				location.href="/ictmd";
			}
		});
				
	});	
 });

 </script>


</head>

<body>
	<!-- multistep form -->
	<form id="msform" action="submit" method="post">
		<!-- progressbar -->
		<ul id="progressbar">
			<li class="active">基本情報</li>
			<li>詳細情報</li>
			<li>情報確認</li>
		</ul>
		<!-- fieldsets -->
		<fieldset>
			<h2 class="fs-title">基本情報入力</h2>
			<input type="text" id="userId" name="userId" placeholder="Email" />
			<p id="emailcheck" style="font-size: 10px; color: red;" align="left"></p>
			<br> <input type="password" id="userPwd" name="userPwd" placeholder="Password" />
			<p id="passcheck" style="font-size: 10px; color: red;" align="left"></p>
			<br>
			<input type="password" id="confirmPassChk" name="cpass" placeholder="Confirm Password" />
			<p id="confirmResult" style="font-size: 10px; color: red;" align="left"></p>

			<br> <input type="text" id="userName" name="userName" placeHolder="User Name" /><br> 
			<input type="button" id="next1"	name="next" class="next action-button" value="Next"  disabled=""/><br>
		</fieldset>
		<fieldset>
		
			<h2 class="fs-title">詳細情報入力</h2>
			<table style="width: 100%">
				<tr>
					<td colspan="3">
						<input type="date" id="birth" name="birth" />
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p style="color: grey;" align="left">[Favorite]</p>
					</td>
				</tr>
				<tr style="height: 50px;">
					<td>
						<div style="width: 100%;">
							<input class="favorite"  name="favorite" type="checkbox" value="風景" style="width: 30%;"/>
							<span style="width: 50%;">風景</span>
						</div>
					</td>
					<td>
						<div style="width: 100%;">
							<input class="favorite"  name="favorite" type="checkbox" value="人物" style="width: 30%;"/>
							<span style="width: 50%;">人物</span>
						</div>
					</td>
					<td><div style="width: 100%;">
							<input class="favorite"  name="favorite" type="checkbox" value="建物" style="width: 30%;"/>
							<span style="width: 50%;">建物</span>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" id="model" name="model" placeholder="Camera Model" /></td>
				</tr>
			</table>
			<input type="button" name="previous" class="previous action-button" value="Previous" /> 
			<input type="button" id="next2" name="next" class="next action-button" value="Next" />
		</fieldset>
		<fieldset>
			<h2 class="fs-title">入力情報確認</h2>
			<table id="usercheck" align="left" style='width: 100%'>
				<!--  js에서 가지고 옴 -->
			</table>
			<input type="button" name="previous" class="previous action-button" value="Previous" />
			<input type="button" id="submit" name="submit" class="submit action-button" value="Submit" />
		</fieldset>
	</form>
	
	<div id="toMain">
		<form action="main">
			<input type="submit" value="メインへ">		
		</form>
	</div>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
	<script src="./resources/js/registerPage.js"></script>
</body>
</html>