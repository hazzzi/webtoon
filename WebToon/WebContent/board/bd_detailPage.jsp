<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.comm.db.CommentBean"%>
<%@page import="java.util.List"%>
<%@page import="net.board.db.BoardBean"%>
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
<link rel="stylesheet" href="./main/css/footer-main.css">
<script src="./js/jquery-3.3.1.js"></script>
<%
	String mem_num = (String) session.getAttribute("mem_num");

	int fb_num = Integer.parseInt(request.getParameter("fb_num"));
	String pageNum = (String) request.getAttribute("pageNum");

	BoardBean bd = (BoardBean) request.getAttribute("bd");
	boolean check = (boolean) request.getAttribute("check");

	int nextNum = (Integer) request.getAttribute("nextNum");
	int preNum = (Integer) request.getAttribute("preNum");
	BoardBean bd2 = (BoardBean) request.getAttribute("bd2");
	BoardBean bd3 = (BoardBean) request.getAttribute("bd3");
%>

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
	
	
	/* 게시글 삭제할 때 묻는 것 */
	function del(fb_num){
		if(confirm("해당 글을 삭제하시겠습니까?")==true){
			location.href="./boardDelete.bo?fb_num=<%=fb_num%>&pageNum=<%=pageNum%>";
		}
	};
</script>

</head>

<body>


	<!-- wrap 영역 시작 -->
	<div id="wrap">
		<!-- header 영역 시작 -->
		<jsp:include page="../main/header.jsp"></jsp:include>
		<!-- header 영역 끝-->

		<div class="detail">
			<div class="fi">

				<!-- 이전 글 없을 경우 제어 -->
				<%
					if (preNum != 0) {
				%>

				<input type="button" class="bt" value="이전 글"
					onclick="location.href='./boardContent.bo?fb_num=<%=preNum%>&pageNum=<%=pageNum%>'" />
				<%
					} else {
				%><input type="button" class="bt-if"
					onclick="location.href='./boardList.bo'" value="목록" />
				<%
					}
				%>

				<!-- 다음 글 없을 경우 제어 -->
				<%
					if (nextNum != 0) {
				%>
				<input type="button" class="bt" value="다음 글"
					onclick="location.href='./boardContent.bo?fb_num=<%=nextNum%>&pageNum=<%=pageNum%>'" /><br>
				<%
					} else {
				%><input type="button" class="bt-if"
					onclick="location.href='./boardList.bo'" value="목록" />
				<%
					}
				%>
			</div>

			<%
				if (nextNum != 0 && preNum != 0) {
			%>
			<input type="button" class="bt-pri"
				onclick="location.href='./boardList.bo'" value="목록" />
			<%
				}
			%>
			<div class="clear"></div>

			<article>
				<div class="detail_content">
					<table class="main">
						<tr>
							<th
								style="text-align: left; vertical-align: center center; font-size: 30px; display: inline;">&nbsp;&nbsp;</th>
							<th style="text-align: left; font-size: 30px;">[<%=bd.getFb_category()%>]
								<%=bd.getFb_subject()%></th>
						</tr>
						<hr>
					</table>
					<div id="content">
						<hr>
						<div id="date-writer-hit">
							<span><%=bd.getFb_date()%> | </span> <span>닉네임 : <%=bd.getFb_mem_nik()%>
								|
							</span> <span>조회수 : <%=bd.getFb_readcount()%> |
							</span>
						</div>

						<!-- 내용 영역 -->
						<div id="article-content">
							<%
								if (bd.getFb_img() != null) {
							%>
							<img src="./upload/<%=bd.getFb_img()%>"><br> <br>
							<%
								}
							%>
							<%=bd.getFb_content()%><br> <br>
						</div>
					</div>
					<!-- LikeBtn 시작 -->

					<i class="fa fa-heart-o like" id="likeIcon"
						style="margin: 10px 0 0 15px; font-size: 32px; cursor: pointer; color: red;">
					</i> <span class="likeBtnSp">좋아요 <%=bd.getFb_sumlike()%></span>
					<!-- LikeBtn 끝 -->
				</div>
				<script>
							$('.like').each(function(){
								var check = <%=check%>
								if(check==true){
									$(this).removeClass('fa-heart-o');
									$(this).addClass('fa-heart');
								}
							});
														
							$("i.like").click(function(){
								if(<%=mem_num%>==null){
									alert('로그인이 필요합니다');
								}else{
									$.ajax('boardLikeAction.bo',{
										context:this,
										data: {
											fb_num : <%=fb_num%>
										},success: function(data){
											var op = data.split(",");
											if(op[0]=='true'){
												$(this).removeClass('fa-heart');
												$(this).addClass('fa-heart-o');
												$(this).next().html('좋아요 '+op[1]);
											}else{
												$(this).removeClass('fa-heart-o');
												$(this).addClass('fa-heart');
												$(this).next().html('좋아요 '+op[1]);
											}
										}
									});
								}
							});
						
					</script>
				
						<br>
						<%
							if (mem_num != null) {
								if (mem_num.equals(bd.getFb_mem_num()) || mem_num.equals("18121220303328")) {
						%>
						<input type="button" class="bt" value="수정"
							onclick="location.href='./boardModify.bo?fb_num=<%=fb_num%>&pageNum=<%=pageNum%>'" />
						<input type="button" class="bt" value="삭제"
							onclick="del(<%=fb_num%>)"> 
						<%
								}
							}
						%>
					
				<!-- 수정 삭제 다음글 이전글 버튼끝 -->

			</article>
			<!--  댓글 쓰기 -->
			<div class="clear"></div>
			<form id="addCommentForm" style="margin: 10px 0;" action="CommWriteAction.bo" method="post">
				<div id="addComment">
					<input type="hidden" name="fb_num" value="<%=fb_num%>">
					<textarea id="dtl_tex" rows="4" cols="100" placeholder="댓글을 입력하세요." name="fbcom_content"></textarea>
				</div>

				<input type="submit" class="bt_c_write" value="댓글 등록" />

			</form>
			<%if(mem_num==null){ %>
			<div class="clear"></div>

			<!--  댓글 반복 시작 -->
			<%
				List<CommentBean> CommentList = (List<CommentBean>) request.getAttribute("CommentList");

				for (int i = 0; i < CommentList.size(); i++) {
					CommentBean cb = CommentList.get(i);
			%>

			<div class="comments">
			
				<% 
				if(bd.getFb_mem_nik() == cb.getFbcom_mem_nik()) {
				%>
				<span class="writer"> <%=cb.getFbcom_mem_nik()%>&nbsp;&nbsp;</span><p>글쓴이</p>
				
				<%}else{ %>
				<span class="writer"> <%=cb.getFbcom_mem_nik()%>&nbsp;&nbsp;</span> 
				
				<%}%>
				
				
				<span class="date"> 
				<%=cb.getFbcom_date()%>
				</span>

				<%if(mem_num!=null){
					if (mem_num.equals(cb.getFbcom_mem_num())) {
				%>
				<span class="modify-del"> <a href="javascript:modifyCommentToggle('5')">수정</a> | <input type="button"
					onclick="location.href='./CommDelete.bo?fbcom_bdnum=<%=cb.getFbcom_bdnum()%>&fb_num=<%=fb_num%>'"
					value="삭제하기" class="del_butt">
				</span>
				<%
					}
				}
				%>
				<p id="comment5"><%=cb.getFbcom_content()%>
				</p>
				<br>
				<br>
				<form id="modifyCommentForm5" class="comment-form"
					action="./CommModifyAction.bo?fbcom_bdnum=<%=cb.getFbcom_bdnum()%>"
					method="post" style="display: none;">
					<input type="hidden" name="commentNo" value="5" /> <input
						type="hidden" name="boardCd" value="free" /> <input type="hidden"
						name="articleNo" value="12" /> <input type="hidden"
						name="curPage" value="1" /> <input type="hidden"
						name="searchWord" value="" />
					<!-- 수정버튼 -->
					<div>
						<input type="hidden" name="fb_num" value="<%=fb_num%>">
						<textarea class="comment-textarea" name="new_content" rows="7"
							cols="50"><%=cb.getFbcom_content()%></textarea>
					</div>
					<div class="fr">

						<input type="submit" value="수정하기" class="modify_butt"> | <a
							href="javascript:modifyCommentToggle('5')">취소</a>
					</div>
					<!-- 수정버튼 -->

				</form>
			</div>
			<%
				}
			%>
			<!--  댓글 반복 끝 -->
			<%}else{ %>
			<!--  댓글 쓰기 -->
			<div class="clear"></div>
			<form id="addCommentForm" style="margin: 10px 0;"
				action="CommWriteAction.bo" method="post">
				<div id="addComment">
					<input type="hidden" name="fb_num" value="<%=fb_num%>">
					<textarea id="dtl_tex" rows="4" cols="100" placeholder="댓글을 입력하세요."
						name="fbcom_content"></textarea>
				</div>

		
				<input type="submit" class="bt_c_write" value="댓글 남기기" />

			</form>
			<div class="clear"></div>

			<!--  댓글 반복 시작 -->
			<%
				List<CommentBean> CommentList = (List<CommentBean>) request.getAttribute("CommentList");

				for (int i = 0; i < CommentList.size(); i++) {
					CommentBean cb = CommentList.get(i);
			%>

			<div class="comments">
				<span class="writer"> <%=cb.getFbcom_mem_nik()%>&nbsp;&nbsp;
				</span> <span class="date"> 
				<% 
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String inputDate = date.format(cb.getFbcom_date());
				%>
				
				
				<%=inputDate%>
				</span>

				<%if(mem_num!=null){
					if (mem_num.equals(cb.getFbcom_mem_num())) {
				%>
				<span class="modify-del"> <a
					href="javascript:modifyCommentToggle('5')">수정</a> | <input
					type="button"
					onclick="location.href='./CommDelete.bo?fbcom_bdnum=<%=cb.getFbcom_bdnum()%>&fb_num=<%=fb_num%>'"
					value="삭제하기">
				</span>
				<%
					}}
				%>
				<p id="comment5"><%=cb.getFbcom_content()%>
				</p>
				<br>
				<br>
				<form id="modifyCommentForm5" class="comment-form"
					action="./CommModifyAction.bo?fbcom_bdnum=<%=cb.getFbcom_bdnum()%>"
					method="post" style="display: none;">
					<input type="hidden" name="commentNo" value="5" /> <input
						type="hidden" name="boardCd" value="free" /> <input type="hidden"
						name="articleNo" value="12" /> <input type="hidden"
						name="curPage" value="1" /> <input type="hidden"
						name="searchWord" value="" />
					<!-- 수정버튼 -->
					<div>
						<input type="hidden" name="fb_num" value="<%=fb_num%>">
						<textarea class="comment-textarea" name="new_content" rows="7"
							cols="50"><%=cb.getFbcom_content()%></textarea>
					</div>
					<div class="fr">
						<input type="submit" value="수정하기"> | <a
							href="javascript:modifyCommentToggle('5')">취소</a>
					</div>
					<!-- 수정버튼 -->

				</form>
			</div>
			<%
				}
			}
			%>
			<!--  댓글 반복 끝 -->
			<br> <br>
			<div id="next-prev">
				<%
					if (nextNum == 0) {
				%>
				<p>다음 글이 존재하지 않습니다.</p>
				<%
					} else {
				%>
				<p>
					다음 글 : <a
						href="./boardContent.bo?fb_num=<%=nextNum%>&pageNum=<%=pageNum%>"><%=bd2.getFb_subject()%></a>
				</p>
				<%
					}
				%>

				<%
					if (preNum == 0) {
				%>
				<p>이전 글이 존재하지 않습니다.</p>
				<%
					} else {
				%>
				<p>
					이전 글 : <a
						href="./boardContent.bo?fb_num=<%=preNum%>&pageNum=<%=pageNum%>"><%=bd3.getFb_subject()%></a>
				</p>
				<%
					}
				%>
			</div>

		</div>

	</div>
	<!-- footer 영역 시작-->
	<jsp:include page="../main/footer.jsp" />
	<!-- footer 영역 끝  -->
	</div>

	<div class="clear"></div>
	<!-- 본문 영역 끝 -->

</body>
</html>