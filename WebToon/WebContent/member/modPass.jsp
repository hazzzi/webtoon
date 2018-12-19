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
<script src="./js/jquery-3.3.1.js"></script>

<script type="text/javascript">
function checking(){
	var newpass = document.f.newpass.value;
	var renewpass = document.f.renewpass.value;
 	
	// 비밀번호 일치 여부
	if (document.f.newpass.value != document.f.renewpass.value) { 
 		alert("새로운 비밀번호가 일치하지 않습니다")
        document.f.newpass.value = ""
        document.f.renewpass.value = ""
        document.f.newpass.focus()
        return false;
     }
 	// passward 길이 체크
 	if(document.f.newpass.value.length <= 7){ 
 		alert("비밀번호는 8자리 이상이여야합니다.")
 		document.f.newpass.value = ""
        document.f.renewpass.value = ""
        document.f.newpass.focus()
 		return false;
 	}
}
</script>
</head>
<body>
						<!--  mdps=modPass		-->
<div id="mdps_wrap">
   <!-- header 시작 -->
   <jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="mdps_title"><h1>비밀 번호 변경</h1></div>

<form action="MemberModpassAction.me" method="post" name="f" onsubmit="return checking();">
<div id="mdps"><!--reinfo  -->
	
	
	<div id="mdps_text">
	<table border="0">
	<tr><th>현재 비밀번호</th><td><input type="password" name="nowpass" required></td></tr>
	<tr><th>새 비밀번호</th><td><input type="password" name="newpass" required></td></tr>
	<tr><th>새 비밀번호 확인</th><td><input type="password" name="renewpass" required></td></tr>     
	</table>
 	</div> <!--id="rif_text" -->
	<div id="mdps_sub">
	<input type="button" value="뒤로가기" onclick="location.href='myProfile.me'">
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