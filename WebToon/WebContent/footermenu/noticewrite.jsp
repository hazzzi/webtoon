<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="footermenu/css/noticewrite.css">
</head>
<body>
	<div class="niw_wrap">
	
		<jsp:include page="../main/header.jsp"></jsp:include>
		<form action="#" method="POST">
		<div class="ni_write">
	<h1 id="ssss">공지사항 작성</h1>
			 <div class="ni_nik">닉네임</div> 
			 
			<div class="ni_inputbox">
				<select name="category" required>
					<option value="1">공지사항</option>
					<option value="2">QNA</option>
				</select>
			</div>
			
			<div class="ni_inputbox">
				<input type="text" name="ni_title">
			</div>
			


			 <div><textarea name="npcontent" class="ni_content" cols="100" rows="30"></textarea></div>



			<div class="ni_btns"><input type="button" class="ni_back" value="취소" onclick="location.href='#'">  <input class="ni_sub" type="submit" value="작성" class="ni_sub"></div> 



		</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>