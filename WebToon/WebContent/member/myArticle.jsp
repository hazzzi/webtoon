<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>내가 쓴 글 보기</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/myArticle.css">
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  ma=myArticle  
							  		-->
<div id="ma_wrap">
   <!-- header 시작 -->
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="ma_title"><h1>내가 쓴 글 보기</h1></div>

<div class="mya_back">
<input type="button" value="뒤로가기" onclick="location.href='myProfile.jsp'">
</div>

<div class="clear"></div>

<form action="#" method="post">
<div id="ma"><!--reinfo  -->

	<div id="ma_text">
		<table border="0">
			<tr>
				<th>글 번호</th>
				<th>
				
					<select name="sel_text" required>	
						<option value="1">전체글</option>
						<option value="2">자유게시판</option>
						<option value="3">갤러리</option>
						<option value="4">팬아트</option>
					</select>
					
				</th>
				<th>제목</th>
				<th>댓글 수</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성 날짜</th>
			</tr>
				
				
				<% for(int i=0 ; i<2 ; i++){ %>
			<tr>
				<td>1</td>
				<td>[자유게시판]</td>
				<td><a href="#">안녕하세요</a></td>
				<td>5</td>
				<td>나</td>
				<td>50</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>2</td>
				<td>[자유게시판]</td>
				<td><a href="#">출석체크 합니다~</a></td>
				<td>19</td>
				<td>나</td>
				<td>2</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>3</td>
				<td>[자유게시판]</td>
				<td><a href="#">와 이런 웹페이지가 생겼다니 너무 좋아요</a></td>
				<td>134</td>
				<td>나</td>
				<td>9999</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>4</td>
				<td>[자유게시판]</td>
				<td><a href="#">출첵 ㅇㅇ</a></td>
				<td>10</td>
				<td>나</td>
				<td>78</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>5</td>
				<td>[자유게시판]</td>
				<td><a href="#">출첵 ㅇㅇ</a></td>
				<td>10</td>
				<td>나</td>
				<td>78</td>
				<td>2018.11.02</td>
			</tr>
						<%} %>			
			
		</table>
 	</div> <!--id="rif_text" -->
	<div id="ma_sub">
	<input type="search" id="mt_search" name="mt_search">
	<input type="submit" id="mt_submit" value="검색">
	</div>
	
	<div class="clear"></div>
	
</div>
<!--회원 정보 수정 부분   -->


<!-- footer 영역 (시작)-->
	<!-- footer 영역 (끝)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>