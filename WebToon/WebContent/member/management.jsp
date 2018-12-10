<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>내가 쓴 글 보기</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/myArticle.css">
</head>
<body>
						<!--  ma=myArticle  
							  		-->
<div id="ma_wrap">
   <!-- header 시작 -->
<jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="ma_title"><h1>회원 관리</h1></div>

<div class="mya_back">
<input type="button" value="뒤로가기" onclick="location.href='myProfile.jsp'">
</div>

<div class="clear"></div>

<form action="#" method="post">
<div id="ma"><!--reinfo  -->

	<div id="ma_text">
		<table border="0">
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>비밀번호 힌트</th>
				<th>연령대</th>
				<th>가입일</th>
				<th>차단</th>
			</tr>
				
				
				<% for(int i=0 ; i<2 ; i++){ %>
			<tr>
				<td>admin</td>
				<td>nik</td>
				<td>abc@nvaer.com</td>
				<td>비번힌트</td>
				<td>20대</td>
				<td>2018.11.02</td>
				<td><input class="del_member" type="button" value="회원차단" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<td>admin</td>
				<td>nik</td>
				<td>abc@nvaer.com</td>
				<td>비번힌트</td>
				<td>20대</td>
				<td>2018.11.02</td>
				<td><input class="del_member" type="button" value="회원차단" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<td>admin</td>
				<td>nik</td>
				<td>abc@nvaer.com</td>
				<td>비번힌트</td>
				<td>20대</td>
				<td>2018.11.02</td>
				<td><input class="del_member" type="button" value="회원차단" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<td>admin</td>
				<td>nik</td>
				<td>abc@nvaer.com</td>
				<td>비번힌트</td>
				<td>20대</td>
				<td>2018.11.02</td>
				<td><input class="del_member" type="button" value="회원차단" onclick="location.href='#'"></td>
			</tr>
			
						<%} %>			
			
		</table>
 	</div> <!--id="rif_text" -->
	<div id="ma_sub">
	<input type="search" id="mt_search" name="mt_search">
	<input type="submit" id="mt_submit" value="검색">
	</div>
	
	<div class="clear"></div>
	
</div>
<!--회원 정보 수정 부분   -->


<!-- footer 영역 (시작)-->
	<!-- footer 영역 (끝)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>