<%@page import="net.webtoon.db.WebtoonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="webtoon" class="net.webtoon.db.WebtoonBean"/>
	<jsp:setProperty property="*" name="webtoon"/>
	<%
		WebtoonDAO wdao=new WebtoonDAO();
		wdao.insertWebtoon(webtoon);
	%>
	<script type="text/javascript">
		alert("입력성공");
		history.back();
	</script>
</body>
</html>