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
<!--recommend폴더안 -->
<link href="css/recommend.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="css/star2.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.barrating.min.js"></script>
<script src="../js/jquery-3.3.1.js"></script>
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
	<article class="rec_main">
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/641253/thumbnail/title_thumbnail_20141120112141_t83x90.jpg">
			</div>
			<div class="content">
				<a onclick="document.getElementById('webtoon-content').style.display='block'">외모지상주의</a>
			</div>
			<div class="author">
				<b>박태준 · 스토리 / 네이버</b>
				
			</div>
			<div class="rec_select">
				<button class="webtoon_btn">웹툰보러 갈까?</button>
				<b class="bb">평가하기</b>
			
				<jsp:include page="star_barr.jsp"></jsp:include>
				
				<script type="text/javascript">
					$('#aaaa').barrating({
						theme : 'fontawesome-stars',
						initialRating : -1
					});

					$('#aaaa').barrating({
						theme : 'fontawesome-stars',
						onSelect : function(value, text, event) {
							// 별점 클릭 후 처리는 여기서 코드 
							// 선택한 별점 값을 value로 받음
						}
					});
					// 'set' 을 이용하여 값 설정 
					// 		$('#example').barrating('set', 2);
				</script>
			</div>
			
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의 대학일기</div>
		</div>
		
	

		<jsp:include page="../main/wbt-content.jsp"></jsp:include>
		
		<!-- 2  -->
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/325629/thumbnail/title_thumbnail_20110508235932_t83x90.jpg">
			</div>
			<div class="content">
				<a>패션왕</a>
			</div>
			<div class="author">
				<b>기안84 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보러 갈까?</button>
				<b class="bb">평가하기</b>
			</div>

			<div class="intro">한태성을 중심으로 벌어지는 다양한 청춘들의 스펙타클한 학원 시트콤 드라마</div>
		</div>
		<!-- 3  -->
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/150388/thumbnail/title_thumbnail_20100331155005_t83x90.jpg">
			</div>
			<div class="content">
				<a>폭풍의 전학생</a>
			</div>
			<div class="author">
				<b>강냉이 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보러 갈까?</button>
				<b class="bb">평가하기</b>
			</div>

			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
	</article>
</body>
</html>