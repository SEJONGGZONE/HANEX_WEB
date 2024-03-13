<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko-KR">
<head>
<meta charset="UTF-8" />
<meta name="format-detction" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta name="mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>한비즈소프트</title>
<script type="text/javascript" src="/common/js/plugins/jquery.js?ts="></script>
<script type="text/javascript" src="/common/js/plugins/jquery-ui.js?ts="></script>
</head>
<body>
    <h2>Login Form</h2>
    <form id="loginForm" method="post">
        <label for="username">Username:</label><br>
        <input type="text" id="userId" name="userId" value="dkpark"><br>
        <label for="password">Password:</label><br>
        <input type="password" id="userPwd" name="userPwd" value="1234"><br><br>
        <input type="submit" value="Login">
    </form>

    <script>
        $(document).ready(function(){   
            $('#loginForm').submit(function(e){

                var userId = $('#userId').val();
                var userPwd = $('#userPwd').val();
                
    			$.ajax({
					url: "/login/login-action",
					type: "POST",
					contentType: "application/json; charset=utf-8",
					accept: "application/json",
					data: JSON.stringify({
						userId: userId,
						userPwd: userPwd
					}),
					dataType: "json",
					success: function(_data, _status, _xhr) {
						if(_data.ResultCode == "00") {
							location.href = "/main";
						}
						else {
							alert('로그인 실패. 다시 시도해주세요.');
						}
					},
					error: function(_xhr, _status, _err) {
						alert(error);
					}
			});
            });
        });
    </script>
</body>
</html>

