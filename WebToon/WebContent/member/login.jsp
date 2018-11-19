<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 오후 12:20 2018-11-02 수정 -->
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="../main/js/naverlogin.js"></script> -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>로그인</title>
 </head>
<body>

<a href="../main/index.jsp"><p class="back">◀ 돌아가기</p></a>
<form action="#" method="post" name="f"  >
<div class="div">
 <div class="login">
<a href="login.jsp"><strong>로그인</strong></a>
</div>
 <div class="join">
<a href="join.jsp"><strong>회원가입</strong></a>
</div>
 <div class="id_input">
<input type="text" name="id" placeholder="아이디" required>
</div>
 <div class="pwd_input">
<input type="password" name="pass" placeholder="비밀번호" required>
</div>
 <div class="login_input">
<input type="submit" value="로그인">
</div>
 <div class="search_input">
<a href="forgetid.jsp"><input type="button" value="아이디/비밀번호 찾기"></a>
</div>
 <a href="#">



<div class="naver_login" id="naverIdLogin">
<span class="nspan1"><img src="./img/naver_logo.PNG" alt="네이버로그인"></span>
<span class="nspan2">네이버 계정으로 로그인</span>
</div>
</a>
 <a href="#">
<div class="kakao_login">
<span class="kspan1"><img src="./img/kakao_logo.png" alt="카카오로그인"></span>
<span class="kspan2">카카오 계정으로 로그인</span>
</div>
</a>
 <div class="hpname">
<i class="fa fa-search co"></i>
오늘 뭐 볼까?
</div>
	
</div>
</form>


<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">


	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "개발자센터에 등록한 ClientID",
			callbackUrl: "개발자센터에 등록한 callback Url",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 33}
			/* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

</script>



</body>
</html>