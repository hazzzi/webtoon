<%@page import="net.footer.db.footerBean"%>
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
<%request.setCharacterEncoding("utf-8");
	String nik=(String)session.getAttribute("mem_nik");
	String mem_num=(String)session.getAttribute("mem_num");
	System.out.println(mem_num);
	footerBean fb =(footerBean)request.getAttribute("fb");
	
%>
<body>
	<div class="niw_wrap">
	
		<jsp:include page="../main/header.jsp"></jsp:include>
		<form action="./footerNoticeupdateAction2.ft" method="post">
		<div class="ni_write">
	<h1 id="ssss">공지사항 수정</h1>
			 <div class="ni_nik"><%=nik%></div> 
			 
			<div class="ni_inputbox">
				<select name="category" required>
					<option <% if(fb.getNi_category().equals("1")){%>selected="seleted"<%} %>value="1">공지사항</option>
					<option <% if(fb.getNi_category().equals("2")){%>selected="seleted"<%} %>value="2">QNA</option>
				</select>
			</div>
			
			<div class="ni_inputbox">
				<input type="text" name="ni_title" value="<%=fb.getNi_subject()%>">
			</div>
			


			 <div><textarea name="nicontent" class="ni_content" cols="100" rows="30"><%=fb.getNi_content() %></textarea></div>



			<div class="ni_btns"><input type="button" class="ni_back" value="취소" onclick="location.href='./myProfile.me'">  <input class="ni_sub" type="submit" value="수정" class="ni_suba"><input type="button" value="삭제" class="ni_suba" onclick="location.href='footerNoticedeleteAction.ft?ni_num=<%=fb.getNi_num()%>'"></div> 



		</div>
		<input type="hidden" name="mem_num" value="<%=mem_num%>">
		<input type="hidden" name="ni_num" value="<%=fb.getNi_num()%>">
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>