<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/myProfile.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
</head>
<body>
<div id="wrap">
   <!-- header 시작 -->
   <jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
 
     <!-- article 영역 시작 -->

 	<div class="wrap">
 		<div class="profile_menu">
 		<div id="w1" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">
 			<a href="#" >
 			<div id="wd1">
 		
 			<img class="img1_1" alt="내 정보 수정1" src="img/settingsw.png">
 			<img class="img1_2" alt="내 정보 수정2" src="img/settingshover.png">
 			
 			<div id=wd1_1>
 			<h2>내 정보 수정</h2>
 			<p><b>최신 정보와 비밀번호<br> 
 			     분실시 필요한 정보를<br> 
 			      관리할 수 있습니다.</b></p>
 			</div>
 			</div><!-- wd1 -->
 			</a>
 			
 			
 			<a href="join.jsp" >
 			<div id="wd2">
 			<img class="img2_1" alt="비밀번호 변경" src="img/editw.png">
 			<img class="img2_2" alt="비밀번호 변경" src="img/edithover.png">
 			
 			<div id=wd2_1>
 			<h2>비밀번호 변경</h2>
 			<p><b>비밀번호를 변경할<br>
 				수 있습니다.</b></p>
 			</div>
 			</div><!-- wd2 -->
 			</a>
 			
 			
 			<a href="#" >
 			<div id="wd3">
 			<img class="img3_1" alt="내가 쓴 글보기" src="img/copyw.png">
 			<img  class="img3_2" alt="내가 쓴 글보기" src="img/copyhover.png">
 			<div id=wd3_1>
 			<h2>내가 쓴 글보기</h2>
 			<p><b>내가 작성한 글을<br> 
 				한번에 불 수 있습니다.</b></p>
 			</div>
 			</div><!-- wd3 -->
 			</a>
 			
 			
 			<a href="#" >
 			<div id="wd4">
 			<img class="img4_1" alt="회원 탈퇴" src="img/garbagew.png">
 			<img class="img4_2" alt="회원 탈퇴" src="img/garbagehover.png">
 			<div id=wd4_1>
 			<h2>회원 탈퇴</h2>
 			<p><b>등록된 개인 정보를 <br>
 				모두삭제합니다.</p>
 			</div>
 			</div><!-- wd4 -->
 			</a>
 			
 		</div>
 		
 		
 		
 		</div><!-- profile_menu -->
 	</div>

     <!-- article 영역 끝 -->
     
     
 <!-- footer 영역 (시작)-->
<jsp:include page="../main/footer.jsp"></jsp:include>
	<!-- footer 영역 (끝)-->
   
</div>


</body>
</html>