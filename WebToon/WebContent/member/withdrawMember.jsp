<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<title>회원 탈퇴</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/withdrawMember.css">
<script src="./js/jquery-3.3.1.js"></script>
</head>
   <jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  wdm=withdrawMember		-->
<div id="wdm_wrap">
   <!-- header 시작 -->
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="wdm_title"><h1>회원 탈퇴</h1></div>

<form action="MemberWithdrawAction.me" method="post">
<div id="wdm"><!--reinfo  -->
	<div id="wdm_exp"><p>회원 탈퇴 시 모든 정보가 삭제됩니다.</p></div>
	
	<div id="wdm_text">
	<table border="0">
	<tr><th>현재 비밀번호</th><td><input type="password" name="pass" required></td></tr>
	</table>
 	</div> <!--id="rif_text" -->
	<div id="wdm_sub">
	<input type="button" value="뒤로가기" onclick="location.href='myProfile.jsp'">
	<input type="submit" value="탈퇴">
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