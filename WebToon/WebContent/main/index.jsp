<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/test.css">
<link rel="stylesheet" href="css/header.css">
</head>
<body>
<div id="wrap">
	<!-- Home 페이지 , 로고누를시 돌아오는 홈 페이지 부분-->
	
	<!-- header 영역 (시작) -->
	<jsp:include page="header-main.jsp" />
	<!-- header 영역 (끝) -->
	
	<!-- 메인 컨텐츠 영역  (시작) 다른페이지 작업시 삭제할 부분-->
	<!-- 슬라이드 이용 -->
	<div id="sildeshow">
		<div id="content">
			<h2>장르1</h2>
			<section class="webtoon-img">
				<img src="https://via.placeholder.com/250">
			</section>
			<section class="webtoon-img">
				<img src="https://via.placeholder.com/250">
			</section>
			<section class="webtoon-img">
				<img src="https://via.placeholder.com/250">
			</section>
			<section class="webtoon-img">
				<img src="https://via.placeholder.com/250">
			</section>
		</div>
	</div>
	<!-- 메인 컨텐츠 영역  (끝) 다른페이지 작업시 삭제할 부분-->
	
	<!-- footer 영역 (시작)-->
	<footer>
		<div id="copyright">
			<p>footer</p>
		</div>
	</footer>
	<!-- footer 영역 (끝)-->
</div>
</body>
</html>