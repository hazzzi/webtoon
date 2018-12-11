<%@page import="net.footer.db.footerBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지&문의</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="footermenu/css/noticeQna.css">

</head>
<body>
<%request.setCharacterEncoding("utf-8");
	List all= (List)request.getAttribute("all");
	List<footerBean> noticelist = (List<footerBean>)all.get(0);
	List<footerBean> qnalist = (List<footerBean>)all.get(1);
	
%>
	<div class="nq_wrap">
		 <jsp:include page="../main/header.jsp"></jsp:include> 

		<div class="nq">
			<div class="no">

				<div class="titles">
					<h1>공지사항</h1>
				</div>
				<% for(footerBean fb:noticelist){ %>

				<div class="nq_header">
					<%=fb.getNi_subject() %>
					
				</div>
				<div class="nq_massage">
					<p><%=fb.getNi_content() %></p>
				</div>

				
				<%} %>

			</div>
			<!-- div class="no"> -->

			<div class="qn">
				<div class="titles">
					<h1>FQA</h1>
				</div>
				<% for(footerBean fb:qnalist){ %>
				<div class="nq_header">
					<%=fb.getNi_subject() %>
				</div>
				<div class="nq_massage">
					<p><%=fb.getNi_content() %></p>
				</div>

				

				<%} %>

			</div>
			<!-- <div class="qn"> -->




		</div>
		<!-- <div class="nq"> -->




		<script type="text/javascript">
			var acc = document.getElementsByClassName("nq_header");
			var i;
			
			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.display === "block") {
						panel.style.display = "none";
					} else {
						panel.style.display = "block";
					}
				});
			}

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