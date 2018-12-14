<%@page import="net.board.db.BoardDAO"%>
<%@page import="net.board.db.BoardBean"%>
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
<script src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
	<%
	String mem_num = (String) session.getAttribute("mem_num");
	int fb_num = Integer.parseInt(request.getParameter("fb_num"));	
	String pageNum = (String) request.getAttribute("pageNum");
	BoardBean bd = (BoardBean)request.getAttribute("bd");
	%>
	<!-- header 영역 시작 -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<!-- header 영역 끝-->
	<script type="text/javascript">
		$(document).ready(
				function(){
					$("#bw_pho_file").on('change',function(){
						readURL(this);
					});
				});
				
				function readURL(input){
					if(input.files && input.files[0]){
						var reader = new FileReader();
						reader.onload = function(e){
							$('#img').attr('src',e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
	
	</script>
	<!-- 본문 영역 시작 -->
	<div class="bw_writing">
		<form action="./boardModifyAction.bo?fb_num=<%=fb_num %>&pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
			<input type="hidden" value="<%=mem_num%>" name="mem_num">
			<div class="bw_subject">
				<input type="text" placeholder="제목" class="bw_sub_tex"	name="fb_subject" value="<%=bd.getFb_subject()%>">
					<select id="bd_sel" name="fb_category">
					<option value="자유게시판">자유게시판</option>
					<option value="중고장터">중고장터</option>
					<option value="자유갤러리">자유갤러리</option>
					<option value="홍보게시판">홍보게시판</option>
				</select>
				<div id="bw_img">

					<i class="fa fa-file-image-o" id="bw_pho_icon"
						style="font-size: 48px; color: gray; margin-left: -30px;">
						<input type="file" id="bw_pho_file" class="bw_pho_icon" name="fb_img">
					</i>

					<button type="submit" class="bw_pho_icon2">
						<i class="fa fa-check" id="bw_pho_icon2"
							style="font-size: 48px; color: gray;"></i>
					</button>
				</div>
			</div>
			<!-- class="bw_hr" -->
			<div class="clear"></div>
			<hr>
			<div class="bw_content">
				<input type="hidden" name="fb_img1" value="<%=bd.getFb_img()%>">
				<input type="image" name="fb_img" src="./upload/<%=bd.getFb_img()%>" disabled="disabled" id="img">
				<textarea rows="30" cols="120" class="tex01" placeholder="수정할 내용을 입력하세요"	name="fb_content"><%=bd.getFb_content()%></textarea>
				<hr>
			</div>
		</form>
	</div>
	<!-- 본문 영역 끝 -->
	<!-- footer 영역 시작-->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<!-- footer 영역 끝  -->
</body>
</html>