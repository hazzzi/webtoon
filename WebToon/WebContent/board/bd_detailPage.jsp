<%@page import="net.board.db.BoardBean"%>
<%@page import="net.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘 뭐 볼까?</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/border-header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<script src="./main/js/jquery-3.3.1.js"></script>

<script type="text/javascript">
function modifyCommentToggle(articleNo) {
    var p_id = "comment" + articleNo;
    var p = document.getElementById(p_id);
    
    var form_id = "modifyCommentForm" + articleNo;
    var form = document.getElementById(form_id);
    
    var p_display;
    var form_display;
    
    if (p.style.display) {
            p_display = '';
            form_display = 'none';
    } else {
            p_display = 'none';
            form_display = '';
    }
    p.style.display = p_display;
    form.style.display = form_display;
}
</script>

</head>

<body>
<%
int fb_num = Integer.parseInt(request.getParameter("fb_num"));
String pageNum = (String)request.getAttribute("pageNum");

BoardDAO bdao = new BoardDAO();
BoardBean bd = bdao.getBoard(fb_num);
%>
<!-- wrap 영역 시작 -->
	<div id="wrap">
		<!-- header 영역 시작 -->
		<jsp:include page="../main/header.jsp"></jsp:include>
<!-- header 영역 끝-->

<div class="detail">
<div class="fi">
<input type="button" class="bt" value="다음 글" />
<input type="button" class="bt" value="이전 글" /><br><br>
</div>

<div class="clear"></div>

<article>
<div class="detail_content">
<table class="main">
<tr>
    <th style="text-align: left;vertical-align: center center; font-size: 30px; display:inline;">&nbsp;&nbsp;</th>
    <th style="text-align: left;font-size: 30px;"><%=bd.getFb_subject() %></th>
</tr>
<hr>
</table>
		<div id="content">
		<hr>
		<div id="date-writer-hit">
		<span><%=bd.getFb_date() %> | </span>
		<span><%=bd.getFb_mem_nik() %> | </span>
		<span><%=bd.getFb_readcount() %> | </span>
		</div>  
		<div id="article-content">
		<%=bd.getFb_content() %>
		</div>
</div>
<!-- LikeBtn.com BEGIN -->
<span class="likebtn-wrapper" data-theme="disk" data-lang="ko" data-ef_voting="heartbeat" data-identifier="item_1"></span>
<script>(function(d,e,s){if(d.getElementById("likebtn_wjs"))return;a=d.createElement(e);m=d.getElementsByTagName(e)[0];a.async=1;a.id="likebtn_wjs";a.src=s;m.parentNode.insertBefore(a, m)})(document,"script","//w.likebtn.com/js/w/widget.js");</script>
	
	<!-- LikeBtn.com END -->		
</div>

	<!-- 파일 다운 및 삭제  -->	
<div id="file-list" style="text-align: right;">
    <div class="attach-file">
        <a href="#" title="filename" class="download">TEST.png</a>
        <a href="#" title="filekey">삭제</a>
    </div>
</div>

	<!-- 파일 다운 및 삭제 끝 -->
			
	<!-- 수정삭제 다음글 이전글 -->
<div class="view-menu" style="margin-bottom: 47px;">
    <div class="fl">
    <br>
        <input type="button" class="bt" value="수정" onclick="location.href='./BoardModify.bo?fb_num=<%=fb_num %>&pageNum=<%=pageNum%>'" />
        <input type="button" class="bt" value="삭제" onclick="location.href='./BoardDelete.bo?fb_num=<%=fb_num %>&pageNum=<%=pageNum%>'" />
    </div>
    <div class="fr">
    <br>
        <input type="button" class="bt" onclick="location.href='bd_main.jsp'" value="목록" />
        <input type="button" class="bt" onclick="location.href='bd_writingPage.jsp'" value="새 글쓰기" />
    </div>
	</div>

<!-- 수정 삭제 다음글 이전글 버튼끝 -->	

			</article>
			<!--  댓글 쓰기 -->
			<div class="clear"></div>
				<form id="addCommentForm" style="margin: 10px 0;" action="addComment.jsp" method="post" >
    				<div id="addComment">

       				 <textarea id="dtl_tex" rows="7" cols="202"></textarea>
   					 </div>
   			
      				  <input type="button" class="bt_c_write" value="댓글 남기기" />
   				
				</form>
				<div class="clear"></div>
				
				
<!--  댓글 반복 시작 -->
<div class="comments">
    <span class="writer">야옹</span>
    <span class="date">2018.11.16</span>
    <span class="modify-del">
        <a href="javascript:modifyCommentToggle('5')">수정</a>
         | <a href="javascript:deleteComment('5')">삭제</a>
    </span>
    <p id="comment5">야오오ㅗㅇㅇ</p>
    <form id="modifyCommentForm5" class="comment-form" action="updateComment.jsp" method="post" style="display: none;">
    <input type="hidden" name="commentNo" value="5" />
    <input type="hidden" name="boardCd" value="free" />
    <input type="hidden" name="articleNo" value="12" />
    <input type="hidden" name="curPage" value="1" />
    <input type="hidden" name="searchWord" value="" />
    <div class="fr">
            <a href="javascript:document.forms.modifyCommentForm5.submit()">수정하기</a>
            | <a href="javascript:modifyCommentToggle('5')">취소</a>
    </div>
    <div>
        <textarea class="comment-textarea" name="memo" rows="7" cols="50">김야옹</textarea>
    </div>
    </form>
</div>
<!--  댓글 반복 끝 -->
<br><br>
<div id="next-prev">
    <p>다음 글 : <a href="#">고양이세요?</a></p>
    <p>이전 글 : <a href="#">고양이애오</a></p>
</div>

</div>			
		
	</div>

</div>
</body>

	

<div class="clear"></div>
<!-- 본문 영역 끝 -->
	<!-- footer 영역 시작-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!-- footer 영역 끝  -->
</body>
</html>