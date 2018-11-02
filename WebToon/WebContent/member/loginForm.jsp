<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
background-color: rgb(16, 18, 20);
}

.div {
	background-image: url("img/banner.jpg");
	border: 1px solid;
	margin: auto auto;
	padding: 10px 10px;
	width: 300px; height: 500px;
	text-align: center;
	margin-top: 100px;
} 

.login {
	color: white;
	margin: auto auto ;
	text-align: center;
	display: inline-block;	
	font-size: 20px;
	width: 130px;
}

.join {
	color: white;
	margin: auto auto ;
	text-align: center;
	display: inline-block;
	font-size: 20px;
	width:130px;
}

.id_input>input {
	margin-top: 100px;
	width: 250px; height: 30px;
}

.pwd_input>input {
	margin-top: 10px;
	width: 250px; height: 30px;
}

.login_input>input {
	margin-top: 10px;
	width: 250px; height: 30px;
}

.search_input>a>input {
	margin-top: 10px;
	width: 250px; height: 30px;
}

.naver_login>a>input {
	background-color: green;
	margin-top: 100px;
	width: 250px; height: 30px;
}

.kakao_login>a>input {
	background-color: yellow;
	margin-top: 10px;
	width: 250px; height: 30px;
}

</style>
</head>
<body>
<form action="./MemberLoginAction.me" method="post">
<div class="div">

<div class="login">
<strong>로그인</strong>
 </div>
 	
<div class="join">
<strong>회원가입</strong>
</div>

<div class="id_input">
<input type="text" name="id" placeholder="아이디">
</div>

<div class="pwd_input">
<input type="password" name="pass" placeholder="비밀번호">
</div>

<div class="login_input">
<input type="submit" value="로그인">
</div>

<div class="search_input">
<a href="#"><input type="button" value="아이디/비밀번호 찾기"></a>
</div>

<div class="naver_login">
<a href="#"><input type="button" value="네이버 이이디로 로그인"></a>
</div>

<div class="kakao_login">
<a href="#"><input type="button" value="카카오 아이디로 로그인"></a>
</div>
	
</div>
</form>
</body>
</html>