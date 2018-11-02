<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천받기</title>

<link rel="stylesheet" href="../main/css/header.css">
<link href="css/recommend.css" rel="stylesheet">
<script src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<article>
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			</div>
			<div class="content">
				<b>대학일기</b>
			</div>
			<div class="author">
				<b>자까 · 에피소드 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
			</div>
			<div class="star"> <b>평가하기</b>
				<p class="star_rating">
					<a href="#" >★</a> 
					<a href="#" >★</a> 
					<a href="#" >★</a>
					<a href="#" >★</a> 
					<a href="#" >★</a>
				</p>
				<script type="text/javascript">
					$(".star_rating a").click(function() {
						$(this).parent().children("a").removeClass("on");
						$(this).addClass("on").prevAll("a").addClass("on");
						return false;
					});
				</script>
			</div>
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
		
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/597447/thumbnail/title_thumbnail_20150410225440_t125x101.jpg">
			</div>
			<div class="content">
				<b>프리드로우</b>
			</div>
			<div class="author">
				<b>전선욱 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
			</div>
			<div class="star"> <b>평가하기</b>
				<p class="star_rating">
					<a href="#" >★</a> 
					<a href="#" >★</a> 
					<a href="#" >★</a>
					<a href="#" >★</a> 
					<a href="#" >★</a>
				</p>
				<script type="text/javascript">
					$(".star_rating a").click(function() {
						$(this).parent().children("a").removeClass("on");
						$(this).addClass("on").prevAll("a").addClass("on");
						return false;
					});
				</script>
			</div>
			<div class="intro">한태성을 중심으로 벌어지는 다양한 청춘들의 스펙타클한 학원 시트콤 드라마</div>
		</div>
		
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/679519/thumbnail/title_thumbnail_20160601180804_t125x101.jpg">
			</div>
			<div class="content">
				<b>대학일기</b>
			</div>
			<div class="author">
				<b>자까 · 에피소드 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
			</div>
			<div class="star"> <b>평가하기</b>
				<p class="star_rating">
					<a href="#" >★</a> 
					<a href="#" >★</a> 
					<a href="#" >★</a>
					<a href="#" >★</a> 
					<a href="#" >★</a>
				</p>
				<script type="text/javascript">
					$(".star_rating a").click(function() {
						$(this).parent().children("a").removeClass("on");
						$(this).addClass("on").prevAll("a").addClass("on");
						return false;
					});
				</script>
			</div>
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
</article>
</body>
</html>