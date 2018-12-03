<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 볼까?</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/main-header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="./main/css/owl.carousel.min.css">
<link rel="stylesheet" href="./main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    items: 5,
		    dots: true
		})
	});
</script>
</head>
<body>
<%
	List<WebtoonBean> webtoonList = (List<WebtoonBean>)request.getAttribute("webtoonList");
	List<String> genre = (List<String>)request.getAttribute("genre");
	int count_Recommend = (int)request.getAttribute("count_Recommend"); //총 평가한 갯수
	System.out.println(webtoonList.size());
	System.out.println(genre.size());
%>
<div id="main-wrap">
<%-- 	Home 페이지 , 로고누를시 돌아오는 홈 페이지 부분
	
	header 영역 (시작) 이부분 복사해서 가져가세요 
					헤드 부분 								
	 <link rel="stylesheet" href="css/header.css">
		 <link rel="stylesheet" href="css/footer-main.css">  
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 
 	<jsp:include page="header.jsp" />
	
<!-- 	<script>
		$(document).ready(function(){
			$("#header-srch").hide();
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
		});
	</script> -->
	
	header 영역 (끝)  이부분 복사해서 가져가세요--%>
	
	
	<!-- main-home header 영역 (시작) -->	
	<jsp:include page="main-header.jsp"/>
	
	<!-- 스크롤시 헤더 아래쪽에 그림자 생성 --> 
	<script>
		$(document).ready(function(){
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
	<!-- main-home header 영역 (끝) -->
	
	<!-- main-home banner 영역(시작) -->
		<div id="main-banner">
			<div>
				<div>
					<nav id="main-banner-nav">
						<ul>
							<!-- 추천 서비스로 이동 -->
							<li><a href="./main_recommend.rec">추천</a></li>
							<!-- 자유 게시판으로 이동 -->
							<li><a href="./boardList.bo">게시판</a></li>
						</ul>
					</nav>
					<!-- ★이후의 평가 갯수는 db에서 쿼리문 이용 -->
					<!-- select count(*) from recommend (쿼리는 수정될 수 있음) -->
					<span>지금까지 ★ <%=count_Recommend%> 개의 평가가 쌓였어요. 내 취향에 딱 맞는 웹툰 추천을
						받아보세요.</span>
				</div>
			</div>
		</div>
	<!-- main-home banner 영역(끝) -->
	
	<!-- 메인 컨텐츠 영역  (시작) -->
		<div id="main-content-div">
			<% //for(int i=0; i<15; i++) {%>
			<!-- db 장르별, 연령별, 연재사이트별, 연재여부별, 연재시작년도별 등등 -->
			<!-- select ~~ from webtoon where ~~ -->
			<!-- 반복문 시작1 -->
			<% for(String g:genre){ %>
			<div id="sildeshow">
				<div id="content">
					<!-- 주제 이름  -->
					<h3><%=g %></h3>
					<div id="con-img" class="owl-carousel owl-theme">
						<!-- db에서 webtoon의 정보 가져오기  -->
						<!-- 반복문 시작2 -->
						<% for(WebtoonBean wb:webtoonList){
							if(wb.getWeb_genre().equals(g)){
						%>						
						<div class="webtoon-img">
							<!-- 웹툰 이미지 클릭시, 웹툰 num get방식으로 값 넘어감 -->
							<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"> 
							    <!-- 웹툰의 썸네일 링크, src="" -->
								<img class="a1"
									src="<%=wb.getWeb_thumb_link()%>">
								<!-- 웹툰의 제목 webtoon.getsubject --> 
								<label id="label"><%=wb.getWeb_subject() %></label>
							</a>
						</div>
						<%		}
							} %>
						<!-- 반복문 끝2 -->
					</div>
				</div>
			</div>
			<%} %>
			<!-- 반복문 끝1 -->
		</div>
	
	<!-- 메인 컨텐츠 영역  (끝) -->
	
	
	<!-- 상단 이동 바 -->
		<jsp:include page="top.jsp"></jsp:include>
    <!-- 상단 이동 바 끝-->
	
	<!-- footer 영역 (시작)-->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer 영역 (끝)-->
</div>

</body>
</html>