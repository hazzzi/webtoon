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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="css/recommend.css" rel="stylesheet">
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

	<article class="rec_main">
	<%for(int a=0; a<=8; a++){%>
		<div class="rec_wrap_div">
			<div class="rec_img_div">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/641253/thumbnail/title_thumbnail_20141120112141_t83x90.jpg">
			</div>
			<div class="rec_webtoon_div">
				<a>외모지상주의 웹툰제목길이 체크</a>
				<b>박태준 · 스토리 / 네이버</b>
			</div>
			<div class="rec_star_div">
				<button class="rec_webtoon_btn">웹툰보기</button>
				<b class="rec_b">평가하기</b>
				 
				<select id="example<%=a%>">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				
				<script type="text/javascript">
					$('#example<%=a%>').barrating({
						theme : 'fontawesome-stars',
						initialRating : -1
					});

					$('#star_barr').barrating({
					theme : 'fontawesome-stars',
					onSelect : function(value, text, event) {
						// 별점 클릭 후 처리는 여기서 코드 
						// 선택한 별점 값을 value로 받음
						}
					});
						//'set' 을 이용하여 값 설정 
					//$('#example').barrating('set', 2);
				</script>
			</div>

			<div class="rec_intro_div">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의 대학일기</div>
		</div>
		<%} %>
		<div id="rec_next_div">
			<button>더보기</button>
		</div>
		
		<%-- <jsp:include page="../main/wbt-content.jsp"></jsp:include> --%>
		
	</article>
	
	
	
	
	
</body>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</html>