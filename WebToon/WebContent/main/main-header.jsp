<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<% String mem_num = (String)session.getAttribute("mem_num"); 
   	%>
	<header id="header-head">
		<div id="header-top">
			<div id="header-inner-top">
			<div id="header-logo">
			<h1>
				<i class="fa fa-search" style="color:#fff"></i>
				<a href="./home.today">오늘 뭐 볼까?</a>
			</h1>
			</div>
			<nav id="header-menu" style="width: 70%">
				<ul>
					<li>
						<!-- 검색 영역 form tag 통해서 값이 넘어감 -->
						<form action="./search.wbt" method="get" style="display: unset;" class="example">
							<div id="header-srch">
								<input type="text" name="query" placeholder="웹툰 검색">
								<button type="submit"><i class="fa fa-search"></i></button>
							</div>
						</form>
					</li>
					<li>
					<li>
						<div id="header-profile">
							<a>
								<!-- if(사용자의 세션값이 존재하면) -->
								<% if(mem_num!=null){ %>
								<!-- db에서 사용자의 닉네임을 가져옴 -->
									<span><%=session.getAttribute("mem_nik") %></span>
								<%}else{ %>
								<!-- else(세션값이 존재하지않으면) -->
									 <span>시작하기</span> 
								<%} %>
								<i class="fa fa-caret-down"></i>
							</a>
							<div class="dropdown-content">
							<!-- if(사용자의 세션값이 존재하면) -->
							  <% if(mem_num!=null){ %>
						      <a href="./myProfile.me">회원정보</a>
						      <a href="#">내 평가</a>
						      <a href="./MemberLogoutAction.me">로그아웃</a>
						      <%}else{ %>
						     <!-- else(사용자의 세션값이 존재하지않으면, ) -->
						      <a href="./login.me">로그인</a>
						      <a href="./join.me">회원가입</a>
						     <%} %>
						    </div>
						</div>
					</li>
				</ul>
			</nav>
			</div>
		</div>
	<!-- 헤더 확장, 홈에만 사용되는 부분이므로 지우시면 됩니다 (끝) -->
	</header>


