<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 볼까?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="css/test.css">
<link rel="stylesheet" href="css/main-header.css">
<link rel="stylesheet" href="css/footer-main.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/wbt-content.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    items: 6,
		    dots: true
		})
	});
</script>
</head>
<body>
<div id="wrap">
	<!-- Home 페이지 , 로고누를시 돌아오는 홈 페이지 부분-->
	
	<!-- header 영역 (시작) -->
	<jsp:include page="main-header.jsp" />
	<!-- header 영역 (끝) -->
	<script>
		var RecentView;
		$(document).ready(function(){
			var scrollPosition;
			$(window).scroll(function(){
				scrollPosition = $(this).scrollTop();
				if (scrollPosition > 0) {
					$('#head').addClass('fixed');
				} else {
					$('#head').removeClass('fixed');
				}
			});
		});
	</script>
 <div id="main-banner">
 	<div>
 		<div>
	 		<nav id="main-banner-nav">
				<ul>
					<li>
						<a href="#">추천</a>
					</li>
					<li>
						<a href="#">게시판</a>
					</li>
				</ul>
			</nav>
 			<span>지금까지 ★ 437,108,374 개의 평가가 쌓였어요. 내 취향에 딱 맞는 웹툰 추천을 받아보세요.</span>
 		</div>
 	</div>
 </div>
 <div id="main-content-div">
	<div id="sildeshow">
		<div id="content">
			<h3>로맨스</h3>
			<div id="con-img" class="owl-carousel owl-theme">
					<!-- <a class=".owl-nav">&#10094;</a> -->
				<div class="webtoon-img">
					<a onclick="document.getElementById('webtoon-content').style.display='block'">
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
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/715772/thumbnail/thumbnail_IMAG10_45108665-e46e-49f7-9ee5-ded04dbbc6d0.jpg">
						<label>좀비딸</label>
						<!-- <label>이혜</label> -->
					</a>
				</div>
		  			<!-- <a class=".owl-nav">&#10095;</a> -->
			</div>
		</div>
	</div>
	 </div>
<%-- 	<%} %> --%>
	<!-- 웹툰정보  -->
			<jsp:include page="wbt-content.jsp"></jsp:include>
	<!-- 웹툰정보  -->
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