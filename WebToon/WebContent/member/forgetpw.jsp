<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/forgetpw.css">
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
<div class="ex"><p>회원가입에 등혹된 정보로 비밀번호를 찾을 수 있습니다.</p></div>

<div class="id"><input type="text"name="id"  readonly value="아이디" ></div>

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
</div>
</form>


</body>
</html>