<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="java.util.List"%>
<%@page import="net.main.db.MainDAO"%>
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
		MainDAO mdao = new MainDAO();
		List<WebtoonBean> list = mdao.mainWebtoon();
	%>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>웹툰 제목</th>
			<th>웹툰 작가</th>
			<th>웹툰 장르</th>
			<th>웹툰 연재 시작일</th>
			<th>웹툰 연재처</th>
			<th>웹툰 연재여부</th>
		</tr>
		<%
			for (WebtoonBean wb : list) {
		%>
		<tr>
			<td><%=wb.getWeb_num()%></td>
			<td><a href="webtoon-update.jsp?num=<%=wb.getWeb_num()%>"><%=wb.getWeb_subject()%></a></td>
			<td><%=wb.getWeb_author()%></td>
			<td><%=wb.getWeb_genre()%></td>
			<td><%=wb.getWeb_start()%></td>
			<td><%=wb.getWeb_portal()%></td>
			<td><%=wb.getWeb_ing()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>