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
<link rel="stylesheet" href="css/wbt-review.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">

	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    items: 3,
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
			/* $("#header-srch").hide(); */
			
			/* 헤더 부분 상단바 검색 토글 기능 */
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
			
			/* 스크롤시 헤더 아래쪽 그림자 생성 */
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
	<!-- search-result header 영역 (끝) -->
	
	<!-- search-result content 영역(시작) -->
	<div id="sr-main">
		 <div id="sr-article">
			 <div id="sr-content">
				<div id="sr-con-background"></div>
			 	<div id="sr-content-box">
			 	<!-- 주소줄에 넘어온 파라미터가지고 디비 select-->
			 	<!-- select * from webtoon where id=?? -->
					<div id="sr-content-img">
						<!-- webtoon 썸네일 -->
						<img src="https://shared-comic.pstatic.net/thumb/webtoon/708452/thumbnail/thumbnail_IMAG06_917b189b-7c3c-44c4-a732-9d53da41240c.jpg">
						<!-- 제목 -->
						<p>냐한남자</p>
						<!-- db 쿼리문 이용-->
						<!-- select mean(grade) from recommend where id=?? -->
						<p>평점 <i class="fa fa-star"></i>4.5</p>
						<!-- 작가 -->
						<p>올소</p>
						<!-- 장르 -->
						<p>스토리  · 드라마</p>
						<!-- a태그 링크 : 웹툰 바로이동 링크 -->
						<p><a href="#">웹툰 보러가기</a></p>
					</div>
			 	</div>
			 </div>
			 
			<!-- 웹툰 세부사항 -->
			<div class="sr-content-fill">
			
		 	<div id="sr-content-info">
		 		<div class="sr-content-default">
			 		<h2>기본정보</h2>
			 		<!-- 제목 -->
			 		<p>냐한남자</p>
			 		<!-- 작가 -->
			 		<p><i class="fa fa-pencil"></i>올소</p>
			 		<!-- 연재시작일(start), 장르 -->
			 		<p>2018 · 스토리  · 드라마</p>
			 		<!-- 연재사이트(potal), 연재여부(ing) -->
			 		<p>네이버 · 연재중</p>
			 		<!-- 웹툰 정보 (info) -->
			 		<p>냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)냥줍을 잘못하면...남자친구가 생깁니다(?)</p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-star">
		 			<h2>평점</h2>
					<!-- db 쿼리문 이용-->
					<!-- select mean(grade) from recommend where web_num=?? -->
					<!-- ex) 평균 3.37  조정값 : 3.5 , 평균평점에는 3.4값이 보여짐-->
					<!-- ex) 평균 4.12  조정값 : 4, 평균평점에는 4.1값이 보여짐 -->
					<!-- 소숫점 존재할 시 fa-star-half-full 클래스 추가  -->
					<!-- 존재하지 않을시 소숫점 앞자리 수대로  fa-star 추가-->
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star-half-full"></i>
		 			<!-- 평균평점 -->
		 			<p>4.5</p>
		 			<!-- 평가자 수 -->
		 			<!-- select count(mem_num) from recommend where web_num=??-->
		 			<p>100명의 평가</p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-comment">
		 			<h2>리뷰</h2>
		 			<!-- db이용 -->
		 			<!-- 리뷰의 갯수 -->
		 			<!-- select count(wbb_bdnum) from webtoon_borad where web_num=??-->
		 			<p>+2349</p>
		 			<!-- 로그인 제어 필요, 로그인시 사용가능합니다  -->
		 			<!-- 제이쿼리 이용해서 div영역 보여줌 -->
		 			<p><a class="review-action" style="cursor: pointer;">리뷰남기기</a>|
		 			   <!-- 리뷰 더보기 이동 -->
		 			   <a href="../recommend/rec_comments.jsp">더보기</a></p>
		 			<br>
		 			<!-- 추천수 상위 2개 리뷰 -->
		 			<div>
		 				<img src="img/member.png" width="100px">
		 				<!-- webtoon_borad -->
		 				<!-- join 이용해서 member_nik -->
		 				<p>사용자별명</p>
		 				<hr>
		 				<!-- wbb_content -->
		 				<p>로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의 대학일기</p>
		 				<hr>
		 				<!-- wbb_sumlike -->
		 				<i class="fa fa-thumbs-o-up"></i><p>35</p>
		 			</div>
		 			<div>
		 				<img src="img/member.png" width="100px">
		 				<p>사용자별명</p>
		 				<hr>
		 				<p>로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기</p>
		 				<hr>
		 				<i class="fa fa-thumbs-o-up"></i><p>35</p>
		 			</div>
		 		</div>
		 		<div style="clear: both; margin: inherit; padding: 15px;"></div>
		 		<hr>
		 		<!-- 같은 장르, 별점이 같은 장르(또는 평균 별점), 같은 연재처중 랜덤하게 -->
		 		<!-- 갯수는 약 10개 정도 추후 더 고민해봄 -->
		 		<div class="sr-content-rec">
		 			<h2>이 웹툰과 유사한 작품</h2>
		 			<div class="owl-carousel owl-theme">
		 				<!-- 반복문 시작 -->
			 			<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			 			</a>
		 				<!-- 반복문 끝-->
		 				<!-- 반복문은 여러개 생길 수 있음 -->
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/title_thumbnail_20160108202909_t125x101.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/670143/thumbnail/title_thumbnail_20160108202909_t125x101.jpg">
			 			</a>
			 			<a href="#">
			 			<img src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			 			</a>
		 			</div>
		 		</div>
		 	</div>
		 	<div class="sr-content-sub">
		 		<div class="sr-content-sub-art">
		 			<h2>팬아트</h2>
		 			<!-- 링크는 추후수정 -->
		 			<!-- get방식 이용 id 파라미터 값 넘기기 -->
		 			<p><!-- <a href="../board/fanart_write.jsp?" style="cursor: pointer;">팬아트남기기</a>| -->
		 			   <a href="../board/fanart.jsp">더보기</a></p>
		 			<div>
		 				<!-- 링크는 fanart content 영역으로 수정 -->
		 				<!-- db 이용 -->
		 				<!-- webtoon_fanart 디비 참조 -->
		 				<!-- 최근에 올라간 팬아트 상위 2개 -->
		 				<!-- where webtoon-number=?? -->
		 				<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			 			</a>
		 				<a href="#">
				 		<img src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
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
		 			<!-- 웹툰 추천 영역으로 이동 -->
		 			<p class="mg">더 많은 웹툰을 평가해주세요!</p>
		 			<a href="../recommend/recommend.jsp">평가하기</a>
		 		</div>
		 	</div>
		 	</div>
		 </div>
	</div>
	
	<!-- 웹툰 리뷰 작성 영역 -->
	<jsp:include page="wbt-review.jsp"></jsp:include>
	<script type="text/javascript">
	$(document).ready(function(){
		/* 웹툰 리뷰 남기기 영역 보여주기 */
		$('.review-action').click(function(index){
			$('#webtoon-content').show();
		});
	});
	</script>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>