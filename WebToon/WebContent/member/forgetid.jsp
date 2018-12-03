<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="member/css/forgetid.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<body>
<form action="MemberForgetidAction.me" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.me"><strong>아이디 찾기</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.me"><strong>비밀번호 찾기</strong></a>
</div>
<% request.setCharacterEncoding("utf-8");
String flag="1";
flag=(String)request.getAttribute("flag");
String DBId =(String)request.getAttribute("DBId");
	System.out.println(DBId);
	System.out.println(flag);
%>

<div class="ex"><% if(DBId!=null){%>회원님의 아이디는 [<%=DBId%>] 입니다!<%}else{%>등록된 이메일을 입력하세요<%}%></div>

<div class="email"><input type="email" name="email" placeholder="이메일" required></div>
<div class="email"><input type="text" name="nik" placeholder="닉네임" required></div>
<div class="getid">
<input type="submit" value="아이디 찾기">
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
			alert('이메일 혹은 닉네이을 확인하세요.');
			
		}	
	}
	
	findfail();
</script>
</body>
</html>