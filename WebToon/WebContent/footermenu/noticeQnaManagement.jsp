<%@page import="net.footer.db.footerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지&문의 관리페이지</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="footermenu/css/noticeQnaManagement.css">

</head>
<body>
	<%request.setCharacterEncoding("utf-8");
	List all= (List)request.getAttribute("all");
	List<footerBean> noticelist = (List<footerBean>)all.get(0);
	List<footerBean> qnalist = (List<footerBean>)all.get(1);
	int noticecount =  ((Integer) request.getAttribute("noticecount")).intValue();
String n_pageNum=(String)request.getAttribute("n_pageNum");
	
	if (n_pageNum == null) {
		n_pageNum = "1";
	}
	
	int n_pageCount = ((Integer) request.getAttribute("n_pageCount")).intValue();
	int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
	int n_startPage = ((Integer) request.getAttribute("n_startPage")).intValue();
	int n_endPage = ((Integer) request.getAttribute("n_endPage")).intValue();

/*---------------------------*/
int qnacount =  ((Integer) request.getAttribute("qnacount")).intValue();
String q_pageNum=(String)request.getAttribute("q_pageNum");

if (q_pageNum == null) {
	q_pageNum = "1";
}
int q_pageCount = ((Integer) request.getAttribute("q_pageCount")).intValue();
int q_startPage = ((Integer) request.getAttribute("q_startPage")).intValue();
int q_endPage = ((Integer) request.getAttribute("q_endPage")).intValue();


%>
	<div class="nq_wrap">
		<jsp:include page="../main/header.jsp"></jsp:include>

		<div class="nq">
			<div class="no">

				<div class="titlesout"><div class="titles">
					<h1>|공지사항|</h1>
				</div></div>
				<% for(footerBean fb:noticelist){ %>
				<a href="footerNoticeupdateAction1.ft?ni_num=<%=fb.getNi_num()%>">
				<div class="nq_header">
					<p><%=fb.getNi_subject() %></p><div class="pdate"><%=fb.getNi_date() %></div>

				</div>
				</a>


				<%} %>
				<div class="paging">
					<%
							if (n_endPage > n_pageCount) {
								n_endPage = n_pageCount;
							}

							if (n_startPage > pageBlock) {
						%><a
						href="./footerNoticeManagerListAction1.ft?q_pageNum=<%=q_pageNum %>&n_pageNum=<%=n_startPage - pageBlock%>">&lt;</a>
					<%
							}

							for (int i = n_startPage; i <= n_endPage; i++) {
						%><a href="./footerNoticeManagerListAction1.ft?q_pageNum=<%=q_pageNum %>&n_pageNum=<%=i%>">[<%=i%>]
					</a>
					<%
							}

							if (n_endPage < n_pageCount) {
						%><a
						href="./footerNoticeManagerListAction1.ft?q_pageNum=<%=q_pageNum %>&n_pageNum=<%=n_startPage + pageBlock%>">&gt;</a>
					<%
							}
						%>

				</div>
			</div>
			<!-- div class="no"> -->

			<div class="qn">
				<div class="titlesout"><div class="titles">
					<h1>|FQA|</h1>
				</div></div>
				<% for(footerBean fb:qnalist){ %>
				<a href="footerNoticeupdateAction1.ft?ni_num=<%=fb.getNi_num()%>">
				<div class="nq_header">
					<p><%=fb.getNi_subject() %></p><div class="pdate"><%=fb.getNi_date() %></div>
				</div>
				</a>



				<%} %>
				<div class="paging">
					<%
							if (q_endPage > q_pageCount) {
								q_endPage = q_pageCount;
							}

							if (q_startPage > pageBlock) {
						%><a
						href="./footerNoticeManagerListAction1.ft?n_pageNum=<%=n_pageNum %>&q_pageNum=<%=q_startPage - pageBlock%>">&lt;</a>
					<%
							}

							for (int i = q_startPage; i <= q_endPage; i++) {
						%><a href="./footerNoticeManagerListAction1.ft?n_pageNum=<%=n_pageNum %>&q_pageNum=<%=i%>">[<%=i%>]
					</a>
					<%
							}

							if (q_endPage < q_pageCount) {
						%><a
						href="./footerNoticeManagerListAction1.ft?n_pageNum=<%=n_pageNum %>&q_pageNum=<%=q_startPage + pageBlock%>">&gt;</a>
					<%
							}
						%>

				</div>
			</div>
			<!-- <div class="qn"> -->

	<div class="notice_btn"><input type="button" value="공지사항작성하기" onclick="location.href='./noticewrite.ft'"></div>


		</div>
		<!-- <div class="nq"> -->




		<script type="text/javascript">
			var acc = document.getElementsByClassName("nq_header");
			var i;
			
		

			/* Start of Tawk.to Script*/
			var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
			(function() {
				var s1 = document.createElement("script"), s0 = document
						.getElementsByTagName("script")[0];
				s1.async = true;
				s1.src = 'https://embed.tawk.to/5becd33970ff5a5a3a723d91/default';
				s1.charset = 'UTF-8';
				s1.setAttribute('crossorigin', '*');
				s0.parentNode.insertBefore(s1, s0);
			})();
			/* 	End of Tawk.to Script */
		</script>






	</div>

</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>