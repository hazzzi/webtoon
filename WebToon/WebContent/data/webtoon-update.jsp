<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="net.webtoon.db.WebtoonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹툰 수정</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="./data/data_list.css">
<link rel="stylesheet" href="./main/css/webtoon.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./js/jquery-3.3.1.js"></script>
</head>
<body>
	<%
		/* String num = request.getParameter("num");
		int intnum = 0;
		if(num!=null){
			intnum=Integer.parseInt(num);
		}
		WebtoonDAO wdao=new WebtoonDAO();
		WebtoonBean wb = wdao.getWebtoon(intnum); //18/12/11 14:32 */
		WebtoonBean wb = (WebtoonBean)request.getAttribute("wb");
		
	%>
	<div id="main-wrap">
	<jsp:include page="../main/header.jsp" />
	<div class="insert-data">
	<h1>내용 빠짐없이 다 채워 주세요. 내용빠지면 DB에 안들어갑니다!</h1>
	<hr>
	<form action="./WebtoonUpdatetAction2.wbt" method="post" class="data-fr1">
		<input type="hidden" name="web_num" value="<%=wb.getWeb_num()%>">
		웹툰 제목 <br> <input type="text" name="web_subject" value="<%=wb.getWeb_subject()%>"><br> 
		웹툰 작가 <br> <input type="text" name="web_author" value="<%=wb.getWeb_author()%>"><br>
		웹툰 장르(수정전 : <%=wb.getWeb_genre() %>)
				<select name="web_genre">
					<optgroup label="장르 선택"></optgroup>
					<option value="일상">일상</option>
					<option value="개그">개그</option>
					<option value="판타지">판타지</option>
					<option value="액션">액션</option>
					<option value="드라마">드라마</option>
					<option value="순정">순정</option>
					<option value="감성">감성</option>
					<option value="스릴러">스릴러</option>
					<option value="시대극">시대극</option>
					<option value="스포츠">스포츠</option>
				</select><br>
		웹툰 연재시작일 (수정전 : <%=wb.getWeb_start() %>)
					<select name="web_start">
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
					</select><br>
		웹툰 연재처 (수정전 :<%=wb.getWeb_portal() %>)
					<select name="web_portal">
						<option value="네이버">네이버</option>
						<option value="다음">다음</option>
						<option value="레진 코믹스">레진 코믹스</option>
					</select><br>
		웹툰 줄거리 또는 정보 :<br> <textarea rows="25" cols="120" placeholder="내용을 입력하세요" name="web_info"><%=wb.getWeb_info() %></textarea><br>
		웹툰 연재여부 : <%=wb.getWeb_ing() %>
					<select name="web_ing">
						<optgroup label="연재여부"></optgroup>
						<option value="연재중">연재중</option>
						<option value="휴재">휴재</option>
						<option value="완결">완결</option>
					</select><br>
		
		웹툰 연재링크 : <input type="text" name="web_link" value="<%=wb.getWeb_link()%>"><br>
		웹툰 썸네일 링크:<input type="text" name="web_thumb_link" value="<%=wb.getWeb_thumb_link()%>"><br>
		<img src="<%=wb.getWeb_thumb_link()%>"><br><br><br>
		<input type="submit" value="웹툰 수정하기">
	</form>
	</div>
	<jsp:include page="../main/top.jsp"></jsp:include>
	<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>