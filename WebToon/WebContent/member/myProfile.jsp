<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>		
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/myProfile.css">

</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>				<!--mp_ =myProfile  -->

<div class="mp_wrap">

<a href="updateForm.jsp">
<div class="mp_img1">
<img src="./img/settingsw.png">
<img src="./img/settingshover.png"><br>
회원정보 수정
</div>
</a>

<a href="modPass.jsp">
<div class="mp_img2">
<img src="./img/editw.png">
<img src="./img/edithover.png"><br>
비밀번호 변경
</div>
</a>

<a href="myArticle.jsp">
<div class="mp_img3">
<img src="./img/copyw.png">
<img src="./img/copyhover.png"><br>
내가 쓴 글 보기
</div>
</a>

<a href="withdrawMember.jsp">
<div class="mp_img4">
<img src="./img/garbagew.png">
<img src="./img/garbagehover.png"><br>
회원탈퇴
</div>
</a>
   
</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>