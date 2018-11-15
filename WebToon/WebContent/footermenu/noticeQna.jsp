<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지&문의</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/noticeQna.css">

</head>
<body>

	<div class="nq_wrap">
		<jsp:include page="../main/header.jsp"></jsp:include>

		<div class="nq">
			<div class="no">

				<div class="titles">
					<h1>공지사항</h1>
				</div>
				<% for(int i=0 ; i<4 ; i++){ %>

				<div class="nq_header">
					충분히 피가 천자만홍이 이상은 유소년에게서 일월과 황금시대다. 내는 몸이 위하여 붙잡아 있을 끓는다.
					
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					충분히 피가 천자만홍이 이상은 유소년에게서 일월과 황금시대다.
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<%} %>

			</div>
			<!-- div class="no"> -->

			<div class="qn">
				<div class="titles">
					<h1>문의사항</h1>
				</div>
				<% for(int i=0 ; i<4 ; i++){ %>
				<div class="nq_header">
					충분히 피가 천자만홍이 이상은 유소년에게서 일월과 황금시대다. 내는 몸이 위하여 붙잡아 있을 끓는다. 하였으며, 불어
					천하를 아니다.
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					충분히 피가 천자만홍이 이상은 유소년에게서 일월과 황금시대다.
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3<
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
				</div>

				<div class="nq_header">
					Section 3
				</div>
				<div class="nq_massage">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
						nisi ut aliquip ex ea commodo consequat.</p>
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