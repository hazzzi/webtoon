<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/updateForm.css">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
						<!--  uf= updateForm  
							  rif=reinfo		-->
<div id="update_wrap">
   <!-- header 시작 -->
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="rif_title"><h1>회원 정보 수정</h1></div>


<%request.setCharacterEncoding("utf-8");
int mem_num=(int)session.getAttribute("mem_num");
 MemberBean mb=(MemberBean)request.getAttribute("mb"); 
System.out.print(mem_num);
%>
<form action="#" method="post">
<div id="rif"><!--reinfo  -->
	<div id="rif_photo">
		<div id="profileImg"><img src="http://placehold.it/150x150" /></div>
		<div class="profileImg_Btn"><input type="button" value="사진 등록"></div>
	</div>
	
	<div id="rif_text">
	<table border="0">
	<tr><th>아이디</th><td><input type="text" name="id" value=""readonly></td></tr>
	<tr><th>닉네임</th><td><input type="text" name="nikname" value=""required></td></tr>
	<tr><th>이메일</th><td><input type="email" name="email" value=""required></td></tr>
	<tr><th>비밀번호 힌트</th><td>
	
	<select name="sel_hint" required>	
		<option value="">비밀번호 힌트를 선택하세요</option>
		<option value="1">나의 좌우명은?</option>
		<option value="2">나의 보물 제1호는?</option>
		<option value="3">제일 좋아하는 스포츠팀의 이름은?</option>
		<option value="4">나의 출생지역은?</option>
		<option value="5">제일 좋아하는 음식은?</option>
	</select></td></tr>
   
	<tr><th>힌트 대답</th><td><input type="text" name="hint_ans" value=""required></td></tr>
	<tr><th>연령대</th><td>
	<select name="sel_age" required>
		<option value="">연령</option>
		<option value="1">10대</option>
		<option value="2">20대</option>
		<option value="3">30대</option>
		<option value="4">40대</option>
		<option value="5">50대 이상</option>
		</select></td></tr>		    
	</table>
 	</div> <!--id="rif_text" -->
 	
	<div id="uf_sub">
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