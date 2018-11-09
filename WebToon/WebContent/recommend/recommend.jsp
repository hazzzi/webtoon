<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>추천받기</title>
<link href="../main/css/header.css" rel="stylesheet" >
<link href="../main/css/test.css" rel="stylesheet" >
<link href="css/recommend.css" rel="stylesheet">
<link href="css/star.css" rel="stylesheet">
<link href="../main/css/wbt-content.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../js/jquery-3.3.1.js"></script>
</head>
<body>
<%
//String name = "박태준";
%>
	<script type="text/javascript">

	var starRating = function() {
		var $star = $(".star-input");

		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		})

		.on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		})
		.on("change", ".star-input :radio", function(name) {
			var result = $(this).next().text();
			
<%-- 			var name = '<%=name%>' --%>
			alert(result);
			// ajax사용, 값을 넘겨 DB작업 후 페이지 새로고침
			
		}).on("mouseover", ".star-input label", function() {
			$(this).text();
			
		}).on("mouseleave", ".star-input>.input", function() {
			var $checked = $star.find(":checked");
		});
	};
	starRating();
	
</script>

<jsp:include page="../main/header.jsp" />
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
			<div>
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			
			<span class="star-input"> 
				<span class="input"> 
					<input type="radio" name="star-input" value="1" id="p1"> 
					<label for="p1">1</label> 
					<input type="radio" name="star-input" value="2" id="p2"> 
					<label for="p2">2</label> 
					<input type="radio"	name="star-input" value="3" id="p3"> 
					<label for="p3">3</label>
					<input type="radio" name="star-input" value="4" id="p4"> 
					<label for="p4">4</label> 
					<input type="radio" name="star-input" value="5"	id="p5"> 
					<label for="p5">5</label>
				</span> 
			</span>
			
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
		
		<jsp:include page="../main/wbt-content.jsp"></jsp:include>
		
		
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
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			<span class="star-input"> 
				<span class="input"> 
					<input type="radio" name="star-input" value="1" id="p1"> 
					<label for="p1">1</label> 
					<input type="radio" name="star-input" value="2" id="p2"> 
					<label for="p2">2</label> 
					<input type="radio"	name="star-input" value="3" id="p3"> 
					<label for="p3">3</label>
					<input type="radio" name="star-input" value="4" id="p4"> 
					<label for="p4">4</label> 
					<input type="radio" name="star-input" value="5"	id="p5"> 
					<label for="p5">5</label>
				</span> 
			</span>
			<div class="intro">한태성을 중심으로 벌어지는 다양한 청춘들의 스펙타클한 학원 시트콤 드라마</div>
		</div>
		
		<div class="wrap">
			<div class="rec">
				<img
					src="https://shared-comic.pstatic.net/thumb/webtoon/150388/thumbnail/title_thumbnail_20100331155005_t83x90.jpg" >
			</div>
			<div class="content">
				<a>폭풍의 전학생</a>
			</div>
			<div class="author">
				<b>강냉이 · 스토리 / 네이버</b>
			</div>
			<div>
				<button class="webtoon_btn">웹툰보기</button>
				<b class="bb">평가하기</b>
			</div>
			<span class="star-input"> 
				<span class="input"> 
					<input type="radio" name="star-input" value="1" id="p1"> 
					<label for="p1">1</label> 
					<input type="radio" name="star-input" value="2" id="p2"> 
					<label for="p2">2</label> 
					<input type="radio"	name="star-input" value="3" id="p3"> 
					<label for="p3">3</label>
					<input type="radio" name="star-input" value="4" id="p4"> 
					<label for="p4">4</label> 
					<input type="radio" name="star-input" value="5"	id="p5"> 
					<label for="p5">5</label>
				</span> 
			</span>
			<div class="intro">로망이 꽃피는 캠퍼스는 없다. 극사실주의에 기반한 너무나 현실적인 우리의
				대학일기</div>
		</div>
</article>
</body>
</html>