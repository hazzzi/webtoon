<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>		
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./member/css/myProfile.css">
<script src="./js/jquery-3.3.1.js"></script>
</head>
 <jsp:include page="../main/header.jsp"></jsp:include> 
<body>	
			<!--mp_ =myProfile  -->
<% request.setCharacterEncoding("utf-8"); 
String sessionid=(String)session.getAttribute("mem_num");
System.out.println(sessionid);
%>
					<!-- admin mem_num -->
<%if(sessionid.equals("18121220303328")){ %>
<div class="mp_wrap">

<a href="./WebtoonManageListAction.wbt">
<div class="mp_img1">
<img src="./member/img/settingsw.png">
<img src="./member/img/settingshover.png"><br>
웹툰 목록관리
</div>
</a>

<a href="MemberUpdateAction1.me">
<div class="mp_img2">
<img src="./member/img/editw.png">
<img src="./member/img/edithover.png"><br>
회원정보 수정
</div>
</a>

<a href="footerNoticeManagerListAction1.ft">
<div class="mp_img3">
<img src="./member/img/copyw.png">
<img src="./member/img/copyhover.png"><br>
공지사항 관리
</div>
</a>

<a href="memberList.me">
<div class="mp_img4">
<img src="./member/img/garbagew.png">
<img src="./member/img/garbagehover.png"><br>
회원 목록관리
</div>
</a>
   
</div>

<%}else{ %>
<div class="mp_wrap">

<a href="MemberUpdateAction1.me">
<div class="mp_img1">
<img src="./member/img/settingsw.png">
<img src="./member/img/settingshover.png"><br>
회원정보 수정
</div>
</a>

<a href="./modPass.me">
<div class="mp_img2">
<img src="./member/img/editw.png">
<img src="./member/img/edithover.png"><br>
비밀번호 변경
</div>
</a>

<a href="./MembermyarticleListAction.me">
<div class="mp_img3">
<img src="./member/img/copyw.png">
<img src="./member/img/copyhover.png"><br>
내가 쓴 글 보기
</div>
</a>

<a href="./withdrawMember.me">
<div class="mp_img4">
<img src="./member/img/garbagew.png">
<img src="./member/img/garbagehover.png"><br>
회원탈퇴
</div>
</a>
    
</div>

<%} %>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>