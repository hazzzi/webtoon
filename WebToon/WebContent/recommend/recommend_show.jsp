<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>추천받기</title>
<link href="../main/css/header.css" rel="stylesheet">
<link href="../main/css/test.css" rel="stylesheet">
<link href="../main/css/wbt-content.css" rel="stylesheet">
<link rel="stylesheet"
 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">  
 	
<!--recommend폴더안 -->
<link href="css/recommend_show.css" rel="stylesheet">
<link rel="stylesheet" href="css/fontawesome-stars.css">
<script src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/jquery.barrating.min.js"></script>
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

	<div class="rec_show_top_background">
		<a href="javascript:history.back()"><i class="fa fa-caret-square-o-left"></i>  평가하기</a><b>평가한 웹툰을 기반으로 추천했습니다. </b>
	</div>

	<article class="rec_show_main">
	<%for(int a=0; a<=4; a++){%>
		<div class="rec_show_wrap_div">
			<div class="rec_show_img_div">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/641253/thumbnail/title_thumbnail_20141120112141_t83x90.jpg">
			</div>
			<div class="rec_show_webtoon_div">
				<a>외모지상주의 웹툰제목길이 체크</a>
				<p>박태준</p> 
				<p>스토리 · 네이버</p>
			</div>
			<div class="rec_show_btn_div">
				<button class="rec_show_webtoon_btn">웹툰보기</button>
			</div>
		</div>
		<%} %>
<!-- 		<div id="rec_show_next_div">
			<button>더보기</button>
		</div> -->
		<div style="clear: both;"></div>
		
		<jsp:include page="../main/wbt-content.jsp"></jsp:include>
		
	</article>
	
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>