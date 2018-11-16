<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과 보기</title>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/recommend_show.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<div id="main-wrap">
		<jsp:include page="../main/header.jsp" />
		<script>
			$(document).ready(function() {
				$("#header-srch").hide();

				$("#a_srch").click(function() {
					$(".tmp").toggle();
					$("#header-srch").toggle(500);
				});

				var scrollPosition;
				$(window).scroll(function() {
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
							<img
								src="https://shared-comic.pstatic.net/thumb/webtoon/708452/thumbnail/thumbnail_IMAG10_a6869252-f41d-4dfc-8f43-db2714798982.jpg">
							<p>냐한남자</p>
							<p>
								평점 <i class="fa fa-star"></i>4.5
							</p>
							<p>올소</p>
							<p>스토리 · 드라마</p>
							<p>
								<a href="#">웹툰 보러가기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../main/top.jsp"></jsp:include>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>