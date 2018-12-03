<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>비밀번호 변경</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/modPass.css">
</head>
   <jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  mdps=modPass		-->
<div id="mdps_wrap">
   <!-- header 시작 -->
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="mdps_title"><h1>비밀 번호 변경</h1></div>

<form action="MemberModpassAction.me" method="post">
<div id="mdps"><!--reinfo  -->
	
	
	<div id="mdps_text">
	<table border="0">
	<tr><th>현재 비밀번호</th><td><input type="password" name="nowpass" required></td></tr>
	<tr><th>새 비밀번호</th><td><input type="password" name="newpass" required></td></tr>
	<tr><th>새 비밀번호 확인</th><td><input type="password" name="renewpass" required></td></tr>     
	</table>
 	</div> <!--id="rif_text" -->
	<div id="mdps_sub">
	<input type="button" value="뒤로가기" onclick="location.href='myProfile.jsp'">
	<input type="submit" value="수정">
	</div>
</div>
<!--회원 정보 수정 부분   -->


<!-- footer 영역 (시작)-->
	<!-- footer 영역 (끝)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>