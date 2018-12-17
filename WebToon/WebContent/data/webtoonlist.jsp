<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="java.util.List"%>
<%@page import="net.main.db.MainDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹툰리스트</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="./data/data_list.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./js/jquery-3.3.1.js"></script>
</head>
<body>
		<jsp:include page="../main/header.jsp"></jsp:include>
		
		
		
	<%request.setCharacterEncoding("utf-8");
		/* MainDAO mdao = new MainDAO();
		List<WebtoonBean> list = mdao.mainWebtoon(); //18-12-11이전 코드
		*/
		//18/12/11-12:06분
		List<WebtoonBean> list=(List<WebtoonBean>)request.getAttribute("wbList");
		
		
	%>
	<div class="wbt_list_div">
		<a href="./insertWebtoon.wbt" style="color: #1b1526">웹툰등록하기</a>
		<table>
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
				<td><a href="./WebtoonUpdatetAction1.wbt?num=<%=wb.getWeb_num()%>" style="color: #1b1526"><%=wb.getWeb_subject()%></a></td>
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
	</div>
	
	
	
	<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>