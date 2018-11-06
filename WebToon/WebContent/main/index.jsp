<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 볼까?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="css/test.css">
<link rel="stylesheet" href="css/header-main.css">
<link rel="stylesheet" href="css/footer-main.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/owl.carousel.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var owl = $('.owl-carousel');
		owl.owlCarousel({
			items:6, // width에 슬라이드를 2개만 보여주겠다는 뜻이다. 1을 입력하면 1개의 슬라이드가 한번에 표시된다.
			loop:true,
			nav:true,
			navText: ['◀','▶'],
			dots:false
		});
	});
</script>
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
	<% for(int i=0 ; i<10 ; i++){ %>

	<div id="sildeshow">
		<div id="content">
			<h2>장르</h2>
			<div id="con-img" class="owl-carousel owl-theme">
					<!-- <a class=".owl-nav">&#10094;</a> -->
				<div class="webtoon-img">
					<a href="#">
						<img class="webtoon-img" src="https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG10_3c7a2e4c-376e-4856-9f03-6ba554dcd62a.jpg">
						<label>유미의 세포들</label>
						<!-- <label>이동건</label> -->
					</a>
				</div>
				<div class="webtoon-img"> 
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/title_thumbnail_20160108202909_t83x90.jpg">
						<label>헬퍼 2 : 킬베로스</label>
						<!-- <label>삭</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/708452/thumbnail/thumbnail_IMAG10_a6869252-f41d-4dfc-8f43-db2714798982.jpg">
						<label>냐한남자</label>
						<!-- <label>올소</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/710754/thumbnail/thumbnail_IMAG10_88e596b9-3712-4ff4-95a7-280b663200ae.jpg">
						<label>화장 지워주는 남자</label>
						<!-- <label>이연</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/699658/thumbnail/thumbnail_IMAG10_7a3fecc7-6bcf-4fcd-b1cb-101e8b480480.jpg">
						<label>오늘도 사랑스럽개</label>
						<!-- <label>이혜</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/715772/thumbnail/thumbnail_IMAG10_45108665-e46e-49f7-9ee5-ded04dbbc6d0.jpg">
						<label>좀비딸</label>
						<!-- <label>이혜</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/710754/thumbnail/thumbnail_IMAG10_88e596b9-3712-4ff4-95a7-280b663200ae.jpg">
						<label>화장 지워주는 남자</label>
						<!-- <label>이연</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/699658/thumbnail/thumbnail_IMAG10_7a3fecc7-6bcf-4fcd-b1cb-101e8b480480.jpg">
						<label>오늘도 사랑스럽개</label>
						<!-- <label>이혜</label> -->
					</a>
				</div>
				<div class="webtoon-img">
					<a href="#">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/715772/thumbnail/thumbnail_IMAG10_45108665-e46e-49f7-9ee5-ded04dbbc6d0.jpg">
						<label>좀비딸</label>
						<!-- <label>이혜</label> -->
					</a>
				</div>
		  			<!-- <a class=".owl-nav">&#10095;</a> -->
			</div>
			
			
		</div>
	</div>
	<%} %>
	<!-- 메인 컨텐츠 영역  (끝) 다른페이지 작업시 삭제할 부분-->
	
	<!-- 상단 이동 바 -->
		<jsp:include page="top.jsp"></jsp:include>
    <!-- 상단 이동 바 끝-->
	
	<!-- footer 영역 (시작)-->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer 영역 (끝)-->
</div>
</body>
</html>