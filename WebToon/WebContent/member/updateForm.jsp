<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script src="./js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/updateForm.css">
<script type="text/javascript">

   var changeImgbtn = function(){
      
      
   } 

</script>
</head>
<body>
 <jsp:include page="../main/header.jsp"></jsp:include>

                  <!--  uf= updateForm  
                       rif=reinfo      -->

						<!--  uf= updateForm  
							  rif=reinfo		-->

<div id="update_wrap">
   <!-- header 시작 -->
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->   
<div id="rif_title"><h1>회원 정보 수정</h1></div>
         

<%request.setCharacterEncoding("utf-8");
String mem_num=(String)session.getAttribute("mem_num");
 MemberBean mb=(MemberBean)request.getAttribute("mb");
 
 if(mb.getHint().equals("나의 좌우명은?")){
	 mb.setHint("1");
 }else if(mb.getHint().equals("나의 보물 제1호는?")){
	 mb.setHint("2");
 }else if(mb.getHint().equals("제일 좋아하는 스포츠팀의 이름은?")){
	 mb.setHint("3");
 }else if(mb.getHint().equals("나의 출생지역은?")){
	 mb.setHint("4");
 }else if(mb.getHint().equals("제일 좋아하는 음식은?")){
	 mb.setHint("5");
 }
 
 if(mb.getAges().equals("10대")){
	 mb.setAges("1");
 }else if(mb.getAges().equals("20대")){
	 mb.setAges("2");
 }else if(mb.getAges().equals("30대")){
	 mb.setAges("3");
 }else if(mb.getAges().equals("40대")){
	 mb.setAges("4");
 }else if(mb.getAges().equals("50대 이상")){
	 mb.setAges("5");
 }
 
%>
<!--사진을 업로드 등록하면 페이지를 새로 실행 시킨다.  -->
<form action="MemberUpdateAction2.me" method="post" enctype="multipart/form-data">
<div id="rif"><!--reinfo  -->
   <div id="rif_photo">
      <div id="profileImg"><%if(mb.getProfileimg()!=null){%><img src="./upload/<%=mb.getProfileimg()%>"/><%}else{%> <img src="http://placehold.it/150x150" /><%} %></div>
<div class="filebox">
  <label for="ex_file">사진 등록</label>
  <input type="file" id="ex_file" name="file">
</div>
   </div>



   <div id="rif_text">
   <table border="0">
   <tr><th>아이디</th><td><input type="text" name="id" value="<%=mb.getId()%>"readonly></td></tr>
   <tr><th>닉네임</th><td><input type="text" name="nikname" value="<%=mb.getNik()%>"required></td></tr>
   <tr><th>이메일</th><td><input type="email" name="email" value="<%=mb.getEmail()%>"required></td></tr>
   <tr><th>비밀번호 힌트</th><td>
   
   <select name="sel_hint" required>   
      <option value="">비밀번호 힌트를 선택하세요</option>
      <option <% if(mb.getHint().equals("1")){%>selected="seleted"<%} %>value="1">나의 좌우명은?</option>
      <option <% if(mb.getHint().equals("2")){%>selected="seleted"<%} %>value="2">나의 보물 제1호는?</option>
      <option <% if(mb.getHint().equals("3")){%>selected="seleted"<%} %>value="3">제일 좋아하는 스포츠팀의 이름은?</option>
      <option <% if(mb.getHint().equals("4")){%>selected="seleted"<%} %>value="4">나의 출생지역은?</option>
      <option <% if(mb.getHint().equals("5")){%>selected="seleted"<%} %>value="5">제일 좋아하는 음식은?</option>
   </select></td></tr>
   
   <tr><th>힌트 대답</th><td><input type="text" name="hint_ans" value="<%=mb.getHintans()%>"required></td></tr>
   <tr><th>연령대</th><td>
   <select name="sel_age" required>
      <option value="">연령</option>
      <option <% if(mb.getAges().equals("1")){%>selected="seleted"<%} %>value="1">10대</option>
      <option <% if(mb.getAges().equals("2")){%>selected="seleted"<%} %>value="2">20대</option>
      <option <% if(mb.getAges().equals("3")){%>selected="seleted"<%} %>value="3">30대</option>
      <option <% if(mb.getAges().equals("4")){%>selected="seleted"<%} %>value="4">40대</option>
      <option <% if(mb.getAges().equals("5")){%>selected="seleted"<%} %>value="5">50대 이상</option>
      </select></td></tr>          
   </table>
    </div> <!--id="rif_text" -->
    
   <div id="uf_sub">
   <input type="button" value="뒤로가기" onclick="location.href='myProfile.me'">
   <input type="submit" value="수정">
   </div>
</div>
</form>
<!--회원 정보 수정 부분   -->


<!-- footer 영역 (시작)-->
   <!-- footer 영역 (끝)-->


</div>
</body>
      <jsp:include page="../main/footer.jsp"></jsp:include>
</html>