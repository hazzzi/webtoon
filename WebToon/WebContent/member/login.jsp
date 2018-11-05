<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 오후 12:20 2018-11-02 수정 -->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/login.css">


</head>
<body>
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

<div class="naver_login">
<a href="#"><img alt="네이버로그인" src="./img/naver_login.PNG"> </a>
</div>

<div class="kakao_login">
<a href="#"><img alt="카카오로그인" src="./img/kakao_account_login_btn_medium_wide.png"></a>
</div>

<div class="hpname">
오늘 뭐 볼까?
</div>
	
</div>
</form>
</body>
</html>