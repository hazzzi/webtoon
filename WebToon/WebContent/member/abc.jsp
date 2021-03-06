<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>네이버아이디</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>


<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
<script>
	// 	var id;
	/* var gender;
	var email;
	var name;
	var profileImage;
	var birthday;
	var uniqId;
	var age;
 */
	var naverLogin = new naver.LoginWithNaverId({
		clientId : "15Vtx9gMFtMcBn5GuDz9",
		callbackUrl : "http://localhost:8080/WebToon/member/callback.jsp",
		isPopup : false,
		callbackHandle : true
	/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
	});

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	naverLogin.getLoginStatus(function(status) {
		if (status) {
			
			var a = naverLogin.user.getGender();
			document.fr1.gender.value = naverLogin.user.getGender();
			document.fr1.id.value = naverLogin.user.getId();
			document.fr1.email.value = naverLogin.user.getEmail();
			document.fr1.nik.value = naverLogin.user.getNickName();
			document.fr1.profileImage.value = naverLogin.user.getProfileImage();
			document.fr1.uniqId.value = naverLogin.user.getId();
			document.fr1.ages.value = naverLogin.user.getAge();

		} else {
			console.log("AccessToken이 올바르지 않습니다.");
		}
		
		document.fr1.submit();
		
	});
</script>
</head>
<body>
	<form action="../naverLoginAction.me" name='fr1' method="post">
		<input type="hidden" id="gender" name="gender" value=""> 
		<input type="hidden" id="id" name="id" value=""> 
		<input type="hidden" id="email" name="email" value=""> 
		<input type="hidden" id="nik" name="nik" value=""> 
		<input type="hidden" id="profileImage" name="profileImage" value="">
		<input type="hidden" id="uniqId" name="uniqId" value=""> 
		<input type="hidden" id="ages" name="ages" value="">
	</form>


</body>
</html>