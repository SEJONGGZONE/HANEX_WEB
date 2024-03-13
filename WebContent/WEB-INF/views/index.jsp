<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HanExpress</title>

    <script src="/gzon/include.2.0.js?202403061413"></script>
    <script>
		$(document).ready(function () {
			
			$('.login_btn').click(function () {
				var data = {
						"API":"driver/loginReq",
					    "I_ID":"8465",
					    "I_PASS":"8465",
					    "I_MIN_NO":"1075905736",
					    "I_APP_VERSION":"",
					    "I_OS_VERSION":"",
					    "I_UUID":"",
					    "I_DEVICE_MODEL":""
					};
				
				HEX_COMM.getAjax(data, function(res){
					if (res.resultCode == "00") {
						location.href = "/main";
					} else {
						alert("로그인 실패");
					}
				});
			});
			
		});
    </script>    
</head>
<body>

    <div class="wrap hex_login_wrap">
        <!-- contents -->
        <div class="contents login_contents">
            <div class="login_bg"></div>
            <div class="login_box">
                <div class="logo"><img src="/img/logo.png" alt=""></div>
                <div class="inputbox">
                    <input type="text" class="input_text" placeholder="차량번호" value="경기 17호 5286">
                    <button type="button" class="login_btn">로그인</button>
                </div>
                <div class="ver_txt">ver 12.01</div>
            </div>            
        </div>
    </div>
    
</body>
</html>