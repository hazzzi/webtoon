<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 오후 12:20 2018-11-02 수정 -->
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="member/css/join.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
 <title>회원가입</title>
<script type="text/javascript">
 function checking(){
	var pass = document.f.pass.value;
	var repass = document.f.repass.value;
 	
	// 비밀번호 일치 여부
	if (document.f.pass.value != document.f.repass.value) { 
 		alert("비밀번호가 일치하지 않습니다")
        document.f.pass.value = ""
        document.f.repass.value = ""
        document.f.pass.focus()
        return false;
     }
 	// passward 길이 체크
 	if(document.f.pass.value.length <= 7){ 
 		alert("비밀번호를 확인해주세요.")
 		document.f.pass.value = ""
        document.f.repass.value = ""
        document.f.pass.focus()
 		return false;
 	}
}
</script>
</head>
<body>

<a href="#"><p class="back">◀ 돌아가기</p></a>
<form action="MemberJoinAction.me" method="post"  name="f" onsubmit="return checking();">
<div class="div">
 <div class="login">
<a href="login.me"><strong>로그인</strong></a>
</div>
 <div class="join">
<a href="join.me"><strong>회원가입</strong></a>
</div>
 <div class="id_input">
<input type="text" name="id" placeholder="아이디" required>
</div>
 <div class="email_input">
<input type="email" name="email" placeholder="이메일" required>
</div>
 <div class="pwd_input">
<input type="password" name="pass" placeholder="비밀번호(8자리 이상)" required >
</div>
 <div class="pwd_input">
<input type="password" name="repass" placeholder="비밀번호확인" required>
</div>
 <div class="pwd_hint">
<select name="sel_hint" required>
<option value="">비밀번호 힌트를 선택하세요</option>
<option value="1">나의 좌우명은?</option>
<option value="2">나의 보물 제1호는?</option>
<option value="3">제일 좋아하는 스포츠팀의 이름은?</option>
<option value="4">나의 출생지역은?</option>
<option value="5">제일 좋아하는 음식은?</option>
</select>
</div>
 <div class="pwd_hint">
<input type="text" name="pass_htnt" placeholder="비밀번호 힌트 답" required>
</div>
 <div class="nik_input">
<input type="text" name="nic" placeholder="닉네임" required>
</div>
 <div class="pwd_hint">
<select name="sel_age" required>
<option value="">연령</option>
<option value="1">10대</option>
<option value="2">20대</option>
<option value="3">30대</option>
<option value="4">40대</option>
<option value="5">50대 이상</option>
</select>
</div>

 <div class="pwd_hint">
<select name="sel_age" required>
<option value="">성별</option>
<option value="1">남</option>
<option value="2">여</option>
</select>
</div>


 <div class="join_input">
<input type="submit" value="회원가입">
</div>
 <div class="hpname">
<i class="fa fa-search co"></i>
오늘 뭐 볼까?
</div>
	
</div>
</form>
</body>
</html>