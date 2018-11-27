<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐 볼까?</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/border-header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<script src="./main/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<!-- header 영역 시작 -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#header-srch").hide();
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
		});
	</script>
	<!-- header 영역 끝-->
	<!-- 본문 영역 시작 -->
	<div class="bw_writing">
	 <form action="bd_writePro.jsp" method="post">
		<div class="bw_subject">
			<input type="text" placeholder="제목" class="bw_sub_tex">
			<select class="bd_sel" name="">
				<option>자유게시판</option>
				<option>중고장터</option>
				<option>자유갤러리</option>
				<option>홍보게시판</option>
			</select>
			<div id="bw_img">
				<button type="submit" class="bw_pho_icon"><i class="fa fa-file-image-o" id="bw_pho_icon"
					style="font-size: 48px; color: gray; margin-right: 50px; margin-left: -30px;"></i></button>
				<button type="submit" class="bw_pho_icon2"><i class="fa fa-check" id="bw_pho_icon2"
					style="font-size: 48px; color: gray;"></i></button>
			</div>
		</div>
		<!-- class="bw_hr" -->
		<div class="clear"></div>
		<hr>
		<div class="bw_content">
			<textarea rows="30" cols="120" class="tex01" placeholder="내용을 입력하세요"></textarea>
			<hr>
		</div>
	  </form>
	</div>
	<!-- 본문 영역 끝 -->
	<!-- footer 영역 시작-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!-- footer 영역 끝  -->
</body>
</html>