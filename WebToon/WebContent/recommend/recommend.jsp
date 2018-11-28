<%@page import="net.webtoon.db.WebtoonBean"%>
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"> <!-- 별점 - 외부css파일 -->
	
<link href="./recommend/css/recommend.css" rel="stylesheet"> <!-- recommend.jsp - css파일 -->
<link rel="stylesheet" href="./recommend/css/fontawesome-stars.css"> <!-- 별점 css파일 -->
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./recommend/js/jquery.barrating.min.js"></script> <!-- 별점 - script파일 -->
</head>
<body>
 	<jsp:include page="../main/header.jsp" /> 
	<script>
		var RecentView;
		$(document).ready(function(){
			$("#header-srch").hide();
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
		});
	</script>
	
	<script> /* 고정바 그림자 효과 */
		$(document).ready(function(){
			var scrollPosition;
			$(window).scroll(function(){
				scrollPosition = $(this).scrollTop();
				if (scrollPosition > 0) {
					$('.rec_top_background').addClass('fixed');
				} else {
					$('.rec_top_background').removeClass('fixed');
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		$(function() {
			$('.rec_wrap_div').slice(0, 15).show();
			$('#load').click(function(e) {
				e.preventDefault();
				$(".rec_wrap_div:hidden").slice(0, 6).fadeToggle('slow');
				if($('.rec_wrap_div:hidden').length == 0) {
					$('#load').hide()
				}
			});
		});
	</script>
<%
	List<WebtoonBean> webtoonList = (List<WebtoonBean>)request.getAttribute("webtoonList"); //웹툰 리스트
	int num = (int)request.getAttribute("count_Recommend");
%>
	<div class="rec_top_background">
		평가한 웹툰 수 : <span><%=num%></span>
		<div id="rec_star_menu">
			<a href="./recommend_show.rec">★추천 받기★</a>
			<!-- * 눌렸을때 추천사이트로 페이지 이동(recommend DB 불러옴) **협업 필터링 -->
		</div>
	</div>
	<article class="rec_main">
	<%for(WebtoonBean wb:webtoonList){%>
		<div class="rec_wrap_div" style="display: none;">
			<div class="rec_img_div">
				<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"><img
					src="<%=wb.getWeb_thumb_link()%>"></a>
			</div>
			<div class="rec_webtoon_div">
				<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"><%=wb.getWeb_subject()%></a>
				<b><%=wb.getWeb_author()%> / <%=wb.getWeb_genre()%> · <%=wb.getWeb_portal() %></b>
			</div>
			
			<div class="rec_star_div">
				<a href="<%=wb.getWeb_link()%>"><button class="rec_webtoon_btn">웹툰보기</button></a>
				<b class="rec_b">평가하기 test:웹툰ID=<%=wb.getWeb_num() %></b>
				 
				<select id="example<%=wb.getWeb_num()%>">
					<option value="">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				
				<script type="text/javascript">
					$('#example<%=wb.getWeb_num()%>').barrating({
						theme : 'fontawesome-stars',
						initialRating : null, // 초기값 설정
						deselectable : true,  // 별 취소
						
						onSelect : function(value, text, event) { // 별점 클릭 후 처리는 여기서 코드 
							/*	mem_num : session
								wb.getWeb_num() : 웹툰고유번호
								text : 별점 값  */
							$.ajax('recDB_insert.rec',{
								data:{
									rec_web_num:<%=wb.getWeb_num()%>,
									rec_web_grade:text
								},success:function(data){
									$('.rec_top_background>span').html(data)
								}
							});
						}
					});
					//'set' 을 이용하여 값 설정 
					<%-- $('#example<%=3%>').barrating('set', 2); --%>
				</script>
			</div>

			<div class="rec_intro_div"><%=wb.getWeb_info() %></div>
		</div>
		<%} %>
		<div id="rec_next_div">
			<button id="load">더보기</button>
		</div>
		
		<div style="clear: both;"></div>
		
		<jsp:include page="../main/wbt-review.jsp"></jsp:include>
		
		<script type="text/javascript">
			$(document).ready(function() {
				/* 웹툰 리뷰 남기기 영역 보여주기 */
				$('.review-action').click(function(index) {
					$('#webtoon-content').show();
				});
			});
		</script>
		
	</article>
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>