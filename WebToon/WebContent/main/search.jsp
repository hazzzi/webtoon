<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색 결과</title>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/search.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="main-wrap">
	<!-- search-result header 영역 (시작) -->
	<jsp:include page="header.jsp" />
	<script>
		$(document).ready(function(){
			$("#header-srch").show();
			$(".tmp").hide();
			
// 			$("#a_srch").click(function(){
// 				$(".tmp").toggle();
// 		        $("#header-srch").toggle(500);
// 		    });
			
			$('#srch-q').val('<%=(String)request.getAttribute("query")%>');
			
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
	<!-- search-result header 영역 (끝) -->
		<%
			List<WebtoonBean> result = (List<WebtoonBean>) request.getAttribute("result");
			
			System.out.println(result);
			String query = (String)request.getAttribute("query");
			
			int index = 0;
		%>

		<div class="sach-background">
			<h2>'<%=query %>' 검색 결과</h2>
			<%if(result.size()!=0){ %>
				<h3> <%=result.size() %>건이 검색되었습니다.</h3>
			<%} %>
		</div>
		<div class="sach-main">
		<!-- 넘어온 파라미터기준으로 디비에서 검색 select where절 이용해서 -->
		<!-- webtoon 디비에서만 검색, subject, author 까지-->
			<!-- 반복문 시작 -->
			  <%for(WebtoonBean wb:result){ 
			  	if(wb.getWeb_subject().contains(query)){
			  		if(index==0){
			  			%><h2>제목</h2><%
			  			index++;
			  		}%>
			  		<div class="sach-rt">
						<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"> 
							<!-- webtoon 썸네일  -->
							<img src="<%=wb.getWeb_thumb_link()%>">
							<!-- 제목 -->
							<span><%=wb.getWeb_subject() %></span> 
							<!-- 작가 -->
							<span><%=wb.getWeb_author() %></span> 
							<!-- 포털  -->
						</a>
					</div>
			  	<%
			  	}
			  }
			  index=0;
			  for(WebtoonBean wb:result){
			   if(wb.getWeb_author().contains(query)){
			  		if(index==0){
			  			%><h2>작가</h2><%
			  			index++;
			  		}%>
			  		<div class="sach-rt">
						<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"> 
							<!-- webtoon 썸네일  -->
							<img src="<%=wb.getWeb_thumb_link()%>">
							<!-- 제목 -->
							<span><%=wb.getWeb_subject() %></span> 
							<!-- 작가 -->
							<span><%=wb.getWeb_author() %></span> 
							<!-- 포털  -->
						</a>
					</div>
			  	<%
			  	}
			  }
			  index=0;
			  for(WebtoonBean wb:result){
				  if(wb.getWeb_portal().contains(query)){
			  		if(index==0){
			  			%><h2>연재 포털</h2><%
			  			index++;
			  		}%>
			  		<div class="sach-rt">
						<a href="./detail.wbt?num=<%=wb.getWeb_num()%>"> 
							<!-- webtoon 썸네일  -->
							<img src="<%=wb.getWeb_thumb_link()%>">
							<!-- 제목 -->
							<span><%=wb.getWeb_subject() %></span> 
							<!-- 작가 -->
							<span><%=wb.getWeb_author() %></span> 
							<!-- 포털  -->
						</a>
					</div>
			  	<%
			  	}
			  }
			 if(result.size()==0){%>
				 <h2 style="text-align: center;line-height: 15;"><i class="fa fa-search"></i>검색 결과가 존재하지 않습니다.</h2>
			<% }
			%>
			<!-- 반복문 끝 -->
		</div>
		<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>