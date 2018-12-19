<%@page import="net.rec.db.RecommendBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="org.apache.mahout.cf.taste.recommender.RecommendedItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>추천받기</title>
<link href="./main/css/header.css" rel="stylesheet">
<link href="./main/css/test.css" rel="stylesheet">
<link href="./main/css/wbt-review.css" rel="stylesheet">
<link rel="stylesheet"
 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">  
 	
<!--recommend폴더안 -->
<link href="./recommend/css/recommend_show.css" rel="stylesheet">
<link rel="stylesheet" href="css/fontawesome-stars.css">
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/jquery.barrating.min.js"></script>
</head>

<body>
	<jsp:include page="../main/header.jsp" /> 
 	
	<script>
		$(document).ready(function(){
			var scrollPosition;
			$(window).scroll(function(){
				scrollPosition = $(this).scrollTop();
				if (scrollPosition > 0) {
					$('.rec_show_top_background').addClass('fixed');
				} else {
					$('.rec_show_top_background').removeClass('fixed');
				}
			});
			
		});
	</script>
<%
	List<WebtoonBean> rec_list = (List<WebtoonBean>)request.getAttribute("rec_list"); //추천 리스트
%>
	<div class="rec_show_top_background">
		<a href="./main_recommend.rec"><i
			class="fa fa-caret-square-o-left"></i> 평가하기</a><b>평가한 웹툰을 기반으로 추천했습니다. </b>
	</div>

	<article class="rec_show_main">
	<%if(rec_list.size() != 0){ %>
	<%for(WebtoonBean wb : rec_list){%>
		<div class="rec_show_wrap_div">
			<div class="rec_show_img_div">
				<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"><img
					src="<%=wb.getWeb_thumb_link()%>"></a>
			</div>
			<div class="rec_show_webtoon_div">
				<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"><%=wb.getWeb_subject() %></a>
				<p><%=wb.getWeb_author() %></p> 
				<p><%=wb.getWeb_genre() %> · <%=wb.getWeb_portal() %></p>
				<p style="color: #210042;">평점<i class="fa fa-star"></i><%=wb.getScore() %>
			</div>
			<div class="rec_show_btn_div">
				<a href="<%=wb.getWeb_link()%>"><button class="rec_show_webtoon_btn">웹툰 보러가기</button></a>
			</div>
		</div><%} %>
		<%}else{%>
		<div><h2 style="text-align: center; line-height: 15; font-size: 38px; margin-left: -110px;">웹툰 평가 후 이용해주세요.</h2></div><%} %>

		<div style="clear: both;"></div>
		
<!-- 		<script type="text/javascript">
			$(document).ready(function() {
				/* 웹툰 리뷰 남기기 영역 보여주기 */
				$('.review-action').click(function(index) {
					$('#webtoon-content').show();
				});
			});
		</script> -->

	</article>
	
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>