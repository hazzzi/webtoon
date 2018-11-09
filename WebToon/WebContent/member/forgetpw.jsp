<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/forgetpw.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<form action="#" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.jsp"><strong>아이디 찾기</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.jsp"><strong>비밀번호 찾기</strong></a>
</div>

<div class="ex">등록된 아이디와 비밀번호 힌트를 입력하세요</div>

<div class="id"><input type="text"name="id" placeholder="아이디" ></div>

<div class="pwd_hint">
<select name="sel_hint" required>
<option value="">비밀번호 힌트를 선택하세요</option>
<option value="1">나의 좌우명은?</option>
<option value="2">나의 보물 제1호는?</option>
<option value="3">제일 좋아하는 스포츠팀의 이름은?</option>
<option value="4">나의 출생지역은?</option>
<option value="5">제일 좋아하는 음식은?</option>
</select>
</div>

<!--// 질문 2안
 <div class="pwd_hint">
<p>디비에 입력된 질문</p>
</div> -->
<div class="answer_input"><input type="text" name="name" placeholder="답변" required></div>

<div class="getpw">
<input type="submit" value="비밀번호 찾기">
</div>
<div class="loginpage"><a href="login.jsp">로그인 하기</a></div>

<div class="hpname">
<i class="fa fa-search co"></i>
오늘 뭐 볼까?
</div>

</div>
</form>

</body>
</html>