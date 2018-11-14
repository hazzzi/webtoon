<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과 보기</title>
<script src="../main/js/jquery-3.3.1.js"></script>
<script src="../main/js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/rec_comments.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
<div id="rec_comments_main_wrap">
	
	<script>
		$(document).ready(function(){
			$("#header-srch").hide();
			
			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    });
		});
	</script>
	<div id="rec_c">
		<div id="rec_c_top">
			<a>뒤로 가기</a><br>
			<span id="rec_c_span">코멘트</span>
		</div>
	
	
	</div>
	<jsp:include page="../main/top.jsp"></jsp:include>
	<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>