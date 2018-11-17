<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세 정보</title>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="css/test.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/footer-main.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/search-result.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    items: 3,
		    dots: true
		});
		$('.owl-carousel1').owlCarousel({
		    loop:true,
		    items: 2,
		    dots: true
		});
	});
</script>

</head>
<body>
<div id="main-wrap">
	<jsp:include page="header.jsp" />
	<script>
		$(document).ready(function(){
			$("#header-srch").hide();
			
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
			
			var scrollPosition;
			$(window).scroll(function(){
				scrollPosition = $(this).scrollTop();
				if (scrollPosition > 0) {
					$('#header-head').addClass('fixed');
				} else {
					$('#header-head').removeClass('fixed');
				}
			});
		});
	</script>
	<div id="sr-main">
		 <div id="sr-article">
			 <div id="sr-content">
				<div id="sr-con-background"></div>
			 	<div id="sr-content-box">
					<div id="sr-content-img">
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/708452/thumbnail/thumbnail_IMAG10_a6869252-f41d-4dfc-8f43-db2714798982.jpg">
						<p>냐한남자</p>
						<p>평점 <i class="fa fa-star"></i>4.5</p>
						<p>올소</p>
						<p>스토리  · 드라마</p>
						<p><a href="#">웹툰 보러가기</a></p>
					</div>
			 	</div>
			 </div>
			 
			<div class="sr-content-fill">
			
		 	<div id="sr-content-info">
		 		<div class="sr-content-default">
			 		<h2>기본정보</h2>
			 		<p>냐한남자</p>
			 		<p><i class="fa fa-pencil"></i>올소</p>
			 		<p>2018 · 스토리  · 드라마</p>
			 		<p>네이버 · 연재중</p>
			 		<p>냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)</p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-star">
		 			<h2>평점</h2>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star-half-full"></i>
		 			<p>4.5</p>
		 			<p>100명의 평가</p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-comment">
		 			<h2>리뷰</h2>
		 			<p>+2349</p>
		 			<p><a href="../recommend/rec_comments.jsp">더보기</a></p>
		 			<!-- 상위 2개 리뷰 -->
		 			<br>
		 			<div>
		 				<img src="img/member.png" width="100px">
		 				<p>사용자이름</p>
		 				<hr>
		 				<p>로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의 대학일기</p>
		 				<hr>
		 				<i class="fa fa-thumbs-o-up"></i><p>35</p>
		 			</div>
		 			<div>
		 				<img src="img/member.png" width="100px">
		 				<p>사용자이름</p>
		 				<hr>
		 				<p>로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기</p>
		 				<hr>
		 				<i class="fa fa-thumbs-o-up"></i><p>35</p>
		 			</div>
		 		</div>
		 		<div style="clear: both; margin: inherit; padding: 15px;"></div>
		 		<hr>
		 		<div class="sr-content-rec">
		 			<h2>이 웹툰과 유사한 작품</h2>
		 			<div class="owl-carousel owl-theme">
		 				<!-- 반복문 시작 -->
			 			<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG10_3c7a2e4c-376e-4856-9f03-6ba554dcd62a.jpg">
			 			</a>
		 				<!-- 반복문 끝-->
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/title_thumbnail_20160108202909_t83x90.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/710754/thumbnail/thumbnail_IMAG10_88e596b9-3712-4ff4-95a7-280b663200ae.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/699658/thumbnail/thumbnail_IMAG10_7a3fecc7-6bcf-4fcd-b1cb-101e8b480480.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/715772/thumbnail/thumbnail_IMAG10_45108665-e46e-49f7-9ee5-ded04dbbc6d0.jpg">
			 			</a>
		 			</div>
		 		</div>
		 	</div>
		 	<div class="sr-content-sub">
		 		<div class="sr-content-sub-art">
		 			<h2>팬아트</h2>
		 			<p><a href="../board/fanart.jsp">더보기</a></p>
		 			<div>
		 				<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG10_3c7a2e4c-376e-4856-9f03-6ba554dcd62a.jpg">
			 			</a>
		 				<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG10_3c7a2e4c-376e-4856-9f03-6ba554dcd62a.jpg">
			 			</a>
		 			</div>
		 		</div>
		 		<hr>
		 		<div class="sr-content-sub-star">
		<!--  			<h2>내 별점</h2>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star-half-full"></i>
		 			<p>4.5</p> -->
		 			
		 			<p class="mg">더 많은 웹툰을 평가해주세요!</p>
		 			<a href="../recommend/recommend.jsp">평가하기</a>
		 		</div>
		 	</div>
		 	</div>
		 </div>
	</div>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>