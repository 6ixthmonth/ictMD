$(document).ready(function() {
	// No links pls
	// $('.ui-button.inactive').click(function(){ e.preventDefault(); });

	$('#close').click(function() {
		$('.ui-panel').removeClass('bounceInDown').addClass('bounceOutUp');
		setTimeout(goHome, 500);
	});

	$("input[id=userPwd]").keydown(function(key) {
		if (key.keyCode == 13) {
			loginCheck();
		}
	});

	$("#goLogin").click(function() {
		// e.preventDefault();
		loginCheck();
	});
	function goHome() {
		$(location).attr("href", "/ictmd");
	}
	function loginCheck() {
		var userId = $("#userId").val();
		var userPwd = $("#userPwd").val();

		if (userId == "") {
			alert("IDを入力してください。");
			return;
		} else if (userPwd == "") {
			alert("パスワードを入力してください。");
			return;
		} else {
			$.ajax({
				url : "loginCheck",
				type : "post",
				data : {
					userId : userId,
					userPwd : userPwd
				},
				success : function(data) {
					if (data == 1) {
						location.href = "/ictmd/"
					} else {
						alert("入力したIDまたはパスワードが違います。確認お願いします。");
						return;
					}
				}
			});
		}
	}
});