<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>네이버아이디 </title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
	var email;
	var name;
	var profileImage;
	var birthday;
	var uniqId;
	var age;
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "15Vtx9gMFtMcBn5GuDz9",
				callbackUrl: "http://localhost:8080/WebToon/member/callback.jsp",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		naverLogin.getLoginStatus(function (status) {
			if (status) {
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				var birthday = naverLogin.user.getBirthday();			
				var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				e=email
				a();
			} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
			alert(email+" "+name+" "+ profileImage+" "+birthday+" "+ uniqId+" "+age);
		});
		function a(){
		alert(e);
		
		}
	</script>
</head>
<body>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>