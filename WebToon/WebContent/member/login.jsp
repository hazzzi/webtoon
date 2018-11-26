<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 오후 12:20 2018-11-02 수정 -->
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% request.setCharacterEncoding("utf-8");%>
<!-- <script src="../main/js/naverlogin.js"></script> -->
<script src="../main/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link rel="stylesheet" href="member/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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


<div id="naverIdLogin"></div>  <!-- 버튼이 들어갈 위치 선언. ID는 반드시 지정된 값으로 설정하여야 합니다.-->

  <a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('e11c500869f19074c6667a7167a7164b');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
</script>





 <div class="hpname">
<i class="fa fa-search co"></i>
오늘 뭐 볼까?
</div>
	
</div>
</form>
<!-- 
http://localhost:8080/WebToon/member/callback.jsp
15Vtx9gMFtMcBn5GuDz9 -->
<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "15Vtx9gMFtMcBn5GuDz9",
			callbackUrl: "http://localhost:8080/WebToon/member/callback.jsp",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 48} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
   /* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	

</script>



</body>
</html>