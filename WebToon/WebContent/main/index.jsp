<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/test.css">
<link rel="stylesheet" href="css/header-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="wrap">
	<!-- Home 페이지 , 로고누를시 돌아오는 홈 페이지 부분-->
	
	<!-- header 영역 (시작) -->
	<jsp:include page="header-main.jsp" />
	<!-- header 영역 (끝) -->
	
	
	<!-- 메인 컨텐츠 영역  (시작) 다른페이지 작업시 삭제할 부분-->
	<!-- <script src="js/event.js"></script> -->
	<!-- 슬라이드 이용 -->
	<!-- ddd -->
	<% for(int i=0 ; i<10 ; i++){ %>
	<div id="sildeshow">
		<div id="content">
			<h2>장르<%=i+1 %></h2>
			<div id="con-img">
				<section class="webtoon-img">
					<img src="https://via.placeholder.com/235">
				</section>
				<section class="webtoon-img">
					<img src="https://via.placeholder.com/235">
				</section>
				<section class="webtoon-img">
					<img src="https://via.placeholder.com/235">
				</section>
				<section class="webtoon-img">
					<img src="https://via.placeholder.com/235">
				</section>
				<section class="webtoon-img">
					<img src="https://via.placeholder.com/235">
				</section>
			</div>
		</div>
	</div>
	<%} %>
	<!-- 메인 컨텐츠 영역  (끝) 다른페이지 작업시 삭제할 부분-->
	
	<!-- footer 영역 (시작)-->
	<hr>
	<footer>
		<div id="copyright">
			<a href="#">도움말</a>|
			<a href="#">문의사항</a>|
			<a href="#">개인정보처리방침</a>|
			<a href="#">약관</a>
		</div>
	</footer>
	<!-- footer 영역 (끝)-->
</div>
</body>
</html>