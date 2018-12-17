<%@page import="net.board.db.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>내가 쓴 글 보기</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/myArticle.css">
</head>
<body>
<%	request.setCharacterEncoding("utf-8");
	int count =  ((Integer) request.getAttribute("count")).intValue();
	String pageNum=(String)request.getAttribute("pageNum");
	
	if (pageNum == null) {
		pageNum = "1";
	}
	
	int pageCount = ((Integer) request.getAttribute("pageCount")).intValue();
	int pageBlock = ((Integer) request.getAttribute("pageBlock")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	
	List<BoardBean> myBoardList =(List<BoardBean>)request.getAttribute("myBoardList");
	List<BoardBean> myBoardList_search =(List<BoardBean>)request.getAttribute("myBoardList_search");
%>

						<!--  ma=myArticle  
							  		-->
<div id="ma_wrap">
   <!-- header 시작 -->
<jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="ma_title"><h1>내가 쓴 글 보기</h1></div>

<div class="mya_back">
<input type="button" value="뒤로가기" onclick="location.href='myProfile.me'">
</div>

<div class="clear"></div>

<form action="myArticleSearchAction.me" method="post">
<div id="ma"><!--reinfo  -->

	<div id="ma_text">
		<table border="0">
			<tr>
				<th>글 번호</th>
				<th>
				
					<select name="jump" onchange="location.href=this.value">
						<option value="./MembermyarticleListAction.me?pageNum=<%=pageNum%>">자유게시판</option>
						<option value="./MembermyarticleListAction2.me?pageNum=<%=pageNum%>">팬아트</option>
					</select>

					
				</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성 날짜</th>
			</tr>
				
				
				<%
			if(myBoardList_search==null){
				if(myBoardList==null){%>
				 <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
    		<td></td>
    		<td></td>
         </tr>
         	<tr>
         	<td colspan="6">게시글이 없습니다.</td>
         	</tr>
				
				<%}else{
				for(BoardBean bb: myBoardList){ %>
			<tr>
				<td><%=bb.getFb_num()%></td>
				<td>[자유게시판]</td>
				<td><a href="./boardContent.bo?fb_num=<%=bb.getFb_num()%>&pageNum=<%=pageNum%>"><%=bb.getFb_subject()%></a></td>
				<td><%=bb.getFb_mem_nik()%></td>
				<td><%=bb.getFb_readcount()%></td>
				<td><%=bb.getFb_date()%></td>
			</tr>
			
						<%}} 
			}else{
				
				for(BoardBean bb: myBoardList_search){ %>
			<tr>
				<td><%=bb.getFb_num()%></td>
				<td>[<%=bb.getFb_category()%>]</td>
				<td><a href="./boardContent.bo?fb_num=<%=bb.getFb_num()%>&pageNum=<%=pageNum%>"><%=bb.getFb_subject()%></a></td>				
				<td><%=bb.getFb_mem_nik()%></td>
				<td><%=bb.getFb_readcount()%></td>
				<td><%=bb.getFb_date()%></td>
			</tr>
			
						<%}
			
			}%>			
			
		</table>
 	</div> <!--id="rif_text" -->
 	<div class="paging">
 	<%
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) {
						%><a href="./MembermyarticleListAction.me?pageNum=<%=startPage - pageBlock%>">&lt;</a>
						<%
							}

							for (int i = startPage; i <= endPage; i++) {
						%><a href="./MembermyarticleListAction.me?pageNum=<%=i%>">[<%=i%>]
						</a>
						<%
							}

							if (endPage < pageCount) {
						%><a href="./MembermyarticleListAction.me?pageNum=<%=startPage + pageBlock%>">&gt;</a>
						<%
							}
						%>
 	
 	</div>
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