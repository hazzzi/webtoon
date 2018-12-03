<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="member/css/forgetpw.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<% 
request.setCharacterEncoding("utf-8");
String flag="1";
flag=(String)request.getAttribute("flag");
String DBPw =(String)request.getAttribute("DBPw");
	System.out.println(DBPw);
%>
<form action="MemberForgetpwAction.me" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.me"><strong>아이디 찾기</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.me"><strong>비밀번호 찾기</strong></a>
</div>

<div class="ex"><% if(DBPw!=null){%>회원님의 비밀번호는 [<%=DBPw%>] 입니다!<%}else{%>등록된 아이디와 비밀번호 힌트를 입력하세요<%}%></div>

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
<div class="answer_input"><input type="text" name="ans" placeholder="답변" required></div>

<div class="getpw">
<input type="submit" value="비밀번호 찾기">
</div>
<div class="loginpage"><a href="login.me">로그인 하기</a></div>

<div class="hpname">
<i class="fa fa-search co"></i>
오늘 뭐 볼까?
</div>

</div>
</form>
<script type="text/javascript">
var ckflag=<%=flag%>
	function findfail(){
		if(ckflag=="0"){
			alert('아이디,힌트 질문 혹은 힌트를 확인하세요.');
			
		}	
	}
	
	findfail();
</script>
</body>
</html>