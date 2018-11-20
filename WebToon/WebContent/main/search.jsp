<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과</title>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/search.css">
<link rel="stylesheet" href="css/footer-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
		<div class="sach-background">
			<h2>검색 결과</h2>
		</div>
	<div class="sach-main">
		<!-- 반복문 돌아가는 부분 -->
		<%for(int i=0; i<5; i++){ %>
		<div class="sach-rt">
			<a href="search-result.jsp">
				<img src="https://shared-comic.pstatic.net/thumb/webtoon/708452/thumbnail/thumbnail_IMAG10_a6869252-f41d-4dfc-8f43-db2714798982.jpg">
				<span>냐한남자</span>
				<span>올소</span>
				<span>네이버</span>
			</a>
		</div>
		<%} %>
	</div>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>