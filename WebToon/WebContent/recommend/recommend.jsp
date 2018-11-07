<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천받기</title>

<link href="../main/css/header.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="../main/css/test.css">
<link href="css/recommend.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../js/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
<article>
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/641253/thumbnail/title_thumbnail_20141120112141_t83x90.jpg">
			</div>
			<div class="content">
				<b>외모지상주의</b>
			</div>
			<div class="author">
				<b>박태준 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			<div class="star"> 
				<p class="star_rating">
					<a href="#" >★</a> 
					<a href="#" id="2">★</a> 
					<a href="#" >★</a>
					<a href="#" >★</a> 
					<a href="#" >★</a>
				</p>
			</div>
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
		
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/325629/thumbnail/title_thumbnail_20110508235932_t83x90.jpg">
			</div>
			<div class="content">
				<b>패션왕</b>
			</div>
			<div class="author">
				<b>기안84 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			<div class="star"> 
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
					src="https://shared-comic.pstatic.net/thumb/webtoon/150388/thumbnail/title_thumbnail_20100331155005_t83x90.jpg" >
			</div>
			<div class="content">
				<b>폭풍의 전학생</b>
			</div>
			<div class="author">
				<b>강냉이 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			<div class="star">
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