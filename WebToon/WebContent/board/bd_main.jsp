<%@page import="java.util.Date"%>
<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>
	<%
		int count = ((Integer) request.getAttribute("count")).intValue();
		String pageNum = (String) request.getAttribute("pageNum");

		if (page == null) {
			pageNum = "1";
		}

		int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
		int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
		int startPage = ((Integer) request.getAttribute("startPage")).intValue();
		int endPage = ((Integer) request.getAttribute("endPage")).intValue();

		List<BoardBean> boardList = (List<BoardBean>) request.getAttribute("boardList");
	%>
	<!-- wrap 영역 시작 -->
	<div id="wrap">
		<!-- header 영역 시작 -->
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

		<!-- header 영역 끝 -->

		<!-- article 영역 시작 -->
		<article> <!-- content 영역 -->
		<div class="content">
			<!-- 페이지 이동 버튼, 검색창, 공지사항 영역 시작 -->
			<jsp:include page="header_main.jsp"></jsp:include>

			<!-- 페이지 이동 버튼, 검색창, 공지사항 영역 끝 -->
			<script type="text/javascript">
				$(document).ready(function() {
					$('#bdFree').css('color', '#514862');
					$('#bdFree').html("｜ 자유게시판 ｜ ");
				});
			</script>
			<!-- 카테고리 영역 시작-->
			<div class="posting">
				<!--  게시글 영역 테두리 -->
				<div class="bd_content">
					<table border="1" class="board_table">
						<tr>
							<th class="table_sh">글 번호</th>
							<th>[말머리]</th>
							<th class="table_img"></th>
							<th>제목</th>
							<th class="table_sh">댓글 수</th>
							<th class="table_mid">작성자</th>
							<th class="table_sh">조회 수</th>
							<th>작성 날짜</th>
						</tr>
						<%
							if (count == 0) {
						%>
						<td>게시판 글 없음</td>
						</tr>
						<%
							} else {
								for (BoardBean bb : boardList) {
						%>
						<tr
							onclick="location.href='./boardContent.bo?fb_num=<%=bb.getFb_num()%>&pageNum=<%=bb.getFb_num()%>'">
							<td><%=bb.getFb_num()%></td>
							<td>[<%=bb.getFb_category()%>]
							</td>
							<td class="table_img">
								<%
									System.out.print(bb.getFb_img());
											if (bb.getFb_img() != null) {
								%> <img src="./images/bd_img.png" width="30px" height="30px">

								<%
									} else {
								%> <img src="./images/bd_none_img.png" width="30px"
								height="30px"> <%
 	}
 %>
							</td>
							<td><a
								href="./boardContent.bo?fb_num=<%=bb.getFb_num()%>&pageNum=<%=bb.getFb_num()%>"><%=bb.getFb_subject()%></a>
								<%
									SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

											String inputDate = sf.format(bb.getFb_date());

											String now = sf.format(new Date());

											if (inputDate.equals(now)) {
								%> <img src="./images/63_0000.gif" alt="new"> <%
 	}
 %></td>
							<td>5</td>
							<td><%=bb.getFb_mem_nik()%></td>
							<td><%=bb.getFb_readcount()%></td>
							<td><%=bb.getFb_date()%></td>
						</tr>
						<%
							}
							}
						%>
					</table>
					<div class="board_paging">
						<%
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) {
						%><a href="./boardList.bo?pageNum=<%=startPage - pageBlock%>">&lt;</a>
						<%
							}

							for (int i = startPage; i <= endPage; i++) {
						%><a href="./boardList.bo?pageNum=<%=i%>">[<%=i%>]
						</a>
						<%
							}

							if (endPage < pageCount) {
						%><a href="./boardList.bo?pageNum=<%=startPage + pageBlock%>">&gt;</a>
						<%
							}
						%>
					</div>
				</div>

				<!-- 검색창 영역 -->

				<jsp:include page="search_engine.jsp"></jsp:include>
				
				<!-- 검색창 영역 -->
				
					<input type="button" value="글 쓰기" class="write"
						onclick="location.href='./bd_writingPage.bo'">
			</div>
			<!-- 카테고리 영역 끝-->


		</div>
		<!-- 상단 이동 바 --> <jsp:include page="top.jsp"></jsp:include> <!-- 상단 이동 바 끝-->

		<!-- content 영역 끝 --> </article>
		<!-- article 영역 끝 -->

		<!-- footer 영역 시작-->
		<jsp:include page="../main/footer.jsp"></jsp:include>
		<!-- footer 영역 끝  -->
	</div>
	<!-- wrap 영역 끝 -->
</body>
</html>