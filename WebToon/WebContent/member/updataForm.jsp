<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 정보 수정</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/myProfile.css">
<link rel="stylesheet" href="css/updataForm.css">
</head>
<body>
<div id="wrap">
 <!-- header 시작 -->
   <jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
   
   
   
    <!-- article 영역 시작 -->

 	<div class="wrap">
 	<div class="update_page">
 	<div id="update"><h1>내 정보 수정</h1></div>
 	<div id="form_div">
	<form action="#">
	<table border="0">
	<tr><th>아이디</th><td><input type="text" value="아이디" id="id" required></td></tr>
	<tr><th>이메일</th><td><input type="email" value="이메일" id="email" required></td></tr>
	<tr><th>닉네임</th><td><input type="text" value="닉네임" id="nik" required></td></tr>
	<tr><th>힌트 질문</th><td><select name="sel_hint" required>
<option value="">비밀번호 힌트를 선택하세요</option>
<option value="1">나의 좌우명은?</option>
<option value="2">나의 보물 제1호는?</option>
<option value="3">제일 좋아하는 스포츠팀의 이름은?</option>
<option value="4">나의 출생지역은?</option>
<option value="5">제일 좋아하는 음식은?</option>
</select></td></tr>
	<tr><th>힌트 답변</th><td><input type="text" value="힌트" required id="answer"></td></tr>
	<tr><th>연령대</th><td><select name="sel_age" required>
<option value="">연령</option>
<option value="1">10대</option>
<option value="2">20대</option>
<option value="3">30대</option>
<option value="4">40대</option>
<option value="5">50대 이상</option>
</select></td></tr>
<tr><td colspan="2"><input type="submit" value="수정완료"></td></tr>
	</table>
	
	</form>
	</div>
	</div>
	</div>
    <!-- article 영역 끝 -->
<!-- footer 영역 (시작)-->
	 <div class="clear"></div>
	<hr>
	
	<footer>
		<div id="copyright">
			<a href="#">도움말</a>|
			<a href="#">문의사항</a>|
			<a href="#">개인정보처리방침</a>|
			<a href="#">약관</a>
		</div>
	</footer>
	<!-- footer 영역 (끝)-->


</div>
</body>
</html>