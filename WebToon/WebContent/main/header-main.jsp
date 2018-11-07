<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<header id="head">
		<div id="top">
			<div id="logo">
			<h1>
				<i class="fa fa-search" style="color:#fff"></i>
				<a href="#">오늘 뭐 볼까?</a>
			</h1>
			</div>
			<nav id="menu">
				<ul>
					<li>
<!-- 						<div id="srch">
							<input type="text" placeholder="작품 검색">
							<a href="#"></a>		
						</div> -->
						<a href="#">검색</a>
					</li>
					<li>
						<a href="#">추천</a>
					</li>
					<li>
						<a href="#">게시판</a>
					</li>
					<li>
						<div id="profile">
							<a href="#">
								<span>닉네임</span>
							</a>
						</div>
					</li>
				</ul>
			</nav>
				<!-- 프로필 이미지  -->
		</div>
<!-- 		
		<div id="navbar">
		  <a class="active" href="javascript:void(0)">Home</a>
		  <a href="javascript:void(0)">News</a>
		  <a href="javascript:void(0)">Contact</a>
		</div> -->
		
	<!-- 헤더 확장, 홈에만 사용되는 부분이므로 지우시면 됩니다 (시작) -->
<<<<<<< HEAD
=======
		<div id="banner">
			<div id="menu">
				<a href="../member/join.jsp">추천 받기</a>
				<a href="../recommend/recommend.jsp">추천 받기</a>
				<a href="../board/bd_main.jsp">자유 게시판</a>
			</div>
			<div id="srch">
				<input type="text" placeholder="작품 검색">
				<a href="#"></a>		
			</div>
			<div id="info">
				<span>지금까지 ★ 437,108,374 개의 평가가 쌓였어요. 내 취향에 딱 맞는 웹툰 추천을 받아보세요.</span>
			</div>
			<div class="clear"></div>
		</div>
>>>>>>> branch 'master' of https://github.com/petbe/webtoon.git
	<!-- 헤더 확장, 홈에만 사용되는 부분이므로 지우시면 됩니다 (끝) -->
	</header>
	<script>
		// When the user scrolls the page, execute myFunction 
		window.onscroll = function() {myFunction()};
	
		// Get the navbar
		var navbar = document.getElementById("navbar");
	
		// Get the offset position of the navbar
		var sticky = navbar.offsetTop;
	
		// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
		function myFunction() {
		  if (window.pageYOffset >= sticky) {
		    navbar.classList.add("sticky")
		  } else {
		    navbar.classList.remove("sticky");
		  }
		}
	</script>

