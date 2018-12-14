<%@page import="net.board.db.FanBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐 볼까?</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="./js/jquery-3.3.1.js"></script>
</head>
<body>
	<%
		FanBean fb = new FanBean();
		
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();

		List<FanBean> likeList = (List<FanBean>)request.getAttribute("likeList");
		List<FanBean> fanboardList = (List<FanBean>) request.getAttribute("fanboardList");
		
		String mem_num = (String)session.getAttribute("mem_num");
	
	%>
	<!-- wrap 영역 시작 -->
	<div id="wrap">

		<!-- header 시작 -->
		<jsp:include page="../main/header.jsp"></jsp:include>

		<!--/ header 끝 -->
		
		<div class="fan_content">
			<jsp:include page="header_main.jsp"></jsp:include>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#bd_fan').css('color', '#514862');
					$('#bd_fan').html("｜ 팬아트 ｜ ");
				});
			</script>
			<article class="fan_detailContent">
			<div class="fan_content_like">
			
			
				<!-- 팬아트의 콘텐츠가 들어갈 영역 (시작) -->
				<!-- 인기순으로 5개를 상단에 배치하고 금띠 또는 장식을 추가할 예정이므로 넉넉하게 공간 잡아 놓은 것  -->
				<div id="likethat">
				<table>
				<!-- 게시물 없으면 게시물 없음 뜨도록 -->
				<%
				if(count ==0){
				%>
				<tr>
					<td colspan="8" rowspan="8" align="center">해당 게시물을 찾을 수 없습니다.</td>
				</tr>
				<%
				}
				%>
				<div id="top_rank">🏆&nbsp; 이번 주 탑 랭킹&nbsp; 🏆</div>
				<%
				for(int j=0; j<likeList.size(); j++){
					fb=likeList.get(j);%>
					
					<%
						if (j== 0 || (j %4) + 1 == 1) {
					%>
					<tr alt="줄바꿈">
						<%
							}
						%>
					
					<td alt="사진"> 
						<a href="./fanboardContent.fo?fa_num=<%=fb.getFa_num()%>&pageNum=<%=pageNum%>" >
						<div class="fb_img2">
							
								<img style="width: 300px; height: 300px;"
								src="./upload/<%=fb.getFa_img()%>" class="like_img">
									
							 <div class="img_hover2"><br>
							 		<div class="hover_div0">[<%=fb.getFa_category1() %>]</div>
									<div class="hover_div1"><%=fb.getFa_subject()%></div>  
									<div class="hover_div2"><%=fb.getFa_mem_nik() %></div>
								</div> 
							</div>
						</a>
						</td>
						
					<%
							if ((j % 4) + 1 == 0) {
						%>
						
					</tr>
					<%
						}
					%>
					<%
						}
					%>
					
					</tr>
					</table>
					</div>
					</div>
				<hr class="hr">
				
				<div class="fan_content2">
				<table>
				<!-- 일반 게시글 영역 -->
					<%
						for (int i = 0; i < fanboardList.size(); i++) {
							fb = fanboardList.get(i);
					%>
					<%
						if (i == 0 || (i % 4) + 1 == 1) {
					%>
					<tr alt="줄바꿈">
						<%
							}
						%>
						<td alt="사진"> 
						<a href="./fanboardContent.fo?fa_num=<%=fb.getFa_num()%>&pageNum=<%=pageNum%>" >
						<div class="fb_img">
								<img style="width: 300px; height: 300px;"
								src="./upload/<%=fb.getFa_img()%>" >
										
							 <div class="img_hover"><br>
							 		<div class="hover_div0">[<%=fb.getFa_category1() %>]</div>
									<div class="hover_div1"><%=fb.getFa_subject()%></div>  
									<div class="hover_div2"><%=fb.getFa_mem_nik() %></div>
								</div> 
							</div>
						</a>
						</td>
						<%
							if ((i % 4) + 1 == 0) {
						%>
					</tr>
					<%
						}
					%>
					<%
						}
					%>
				</table>
			</div>

			<span class="fan_paging"> <%
 			if (endPage > pageCount) {
 				endPage = pageCount;
 				}

 			if (startPage > pageBlock) {
 			%><a href="./fanboardList.fo?pageNum=<%=startPage - pageBlock%>">&lt;</a>
				<%
				}

			for (int i = startPage; i <= endPage; i++) {
				%><a href="./fanboardList.fo?pageNum=<%=i%>">[<%=i%>]
			</a> <%
 				}

 			if (endPage < pageCount) {
 			%><a href="./fanboardList.fo?pageNum=<%=startPage + pageBlock%>">&gt;</a>
				<%
					}
				%>
			</span> <!-- 팬아트의 콘텐츠가 들어갈 영역 (끝) --> 
			<jsp:include page="fb_search_engine.jsp"></jsp:include>
			
			<%if(mem_num!=null) {	%>
			<input type="button" value="글 쓰기" class="write"
				onclick="location.href='./fan_writingPage.fo'">
				<%
				}
				%>
		</div>
		<!-- 카테고리 영역 끝-->


			<!-- 상단 이동 바 --> <jsp:include page="top.jsp"></jsp:include> <!-- 상단 이동 바 끝-->

		</article>

		<!-- footer 영역 시작-->
		<jsp:include page="../main/footer.jsp"></jsp:include>
		<!-- footer 영역 끝  -->
	</div>
</body>
</html>