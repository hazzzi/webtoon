<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- wrap 영역 시작 -->
	<div id="wrap">

		<!-- header 시작 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!--/ header 끝 -->

		<div class="fan_content">
			<jsp:include page="header_main.jsp"></jsp:include>
			<script type="text/javascript">
				$(document).ready(function(){
					$('#bd_fan').html("★팬아트★");
				});
			</script>
			<article>
			<div class="fan_posting">
				<div class="fan_content2">
				
					<!-- 팬아트의 콘텐츠가 들어갈 영역 (시작) -->
<!-- 					인기순으로 5개를 상단에 배치하고 금띠 또는 장식을 추가할 예정이므로 넉넉하게 공간 잡아 놓은 것  -->
					<% for(int i=0 ; i<5 ; i++){ %>
					<img src="https://via.placeholder.com/285">
					<img src="https://via.placeholder.com/285"> 
					<img src="https://via.placeholder.com/285"> 
					<img src="https://via.placeholder.com/285"> 
					<img src="https://via.placeholder.com/285">
					<%} %>
				</div>
				
				
				<span class="fan_paging">
				<a href="#">&lt;</a>
				<%for(int i=0; i<10; i++){ %>
				<a href="#"><%=i+1 %></a>
				<% }%>
				<a href="#">&gt;</a>
				</span>
				<!-- 팬아트의 콘텐츠가 들어갈 영역 (끝) -->
				
				<jsp:include page="search_engine.jsp"></jsp:include>
			</div>
		</div>
		</article>

			<!-- top 버튼 -->
			<jsp:include page="top.jsp"></jsp:include>

			<!-- footer 영역 시작-->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- footer 영역 끝  -->

		</div>
</body>
</html>