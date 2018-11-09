<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<!-- <link rel="stylesheet" href="../main/css/test.css"> -->
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="../main/js/jquery-3.3.1.js"></script>


<style>
#columns {
	flex: 50%;
	padding: 0 4px;
	column-width: 350px;
	column-gap: 1px;
	position: static;
	text-align: center;
}

#columns figure {
	display: inline-block;
	border: 1px solid rgba(0, 0, 0, 0.2);
	margin: 0;
	margin-bottom: 15px;
	padding: 10px;
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);;
}

#columns figure img {
	width: 100%;
	resize: both;
	float: center; /* 가운데 정렬 */
	max-width: auto; /* 넓이를 지정 */
	height: auto; /* 높이를 지정 */
	margin: 5px 0;
	margin-top: 8px;
	vertical-align: middle;
}

#columns figure figcaption {
	border-top: 1px solid rgba(0, 0, 0, 0.2);
	padding: 10px;
	margin-top: 11px;
}

.gallary {
	width: 1503px;
	margin: auto;
}
-->
</style>
</head>
<body>
	<!-- wrap 영역 시작 -->
	<div id="wrap">

		<!-- header 시작 -->
		<jsp:include page="../main/header.jsp"></jsp:include>

		<script>
			$(document).ready(function() {
				$("#header-srch").hide();
				$("#a_srch").click(function() {
					$(".tmp").toggle();
					$("#header-srch").toggle(500);
				});
			});
		</script>

		<!--/ header 끝 -->

		<div class="gallary">
			<jsp:include page="header_main.jsp"></jsp:include>

			<script type="text/javascript">
				$(document).ready(function() {
					$('#bd_gall').css('color', '#514862');
					$('#bd_gall').html("｜ 갤러리 ｜ ");
				});
			</script>
			<article>


			<div class="gallary2">
				<% for(int i=0 ; i<10 ; i++){%>
				<%  for(int a=0; i<4; i++){%>
				<div id="columns">
					<!-- 사진영역  -->
					<figure> <img
						src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/rapunzel.jpg"
						style="width: 100%"> <figcaption>고</figcaption> </figure>

					<figure> <img src="https://via.placeholder.com/285"
						style="width: auto;"> <figcaption>양</figcaption> </figure>

					<%} %>
					<%} %>

				</div>
			</div>

			<span class="gallary_paging"> <a href="#">&lt;</a> <%for(int i=0; i<10; i++){ %>
				<a href="#"><%=i+1 %></a> <% }%> <a href="#">&gt;</a>
			</span> <jsp:include page="search_engine.jsp"></jsp:include> <jsp:include
				page="write.jsp"></jsp:include>
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