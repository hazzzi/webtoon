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
<script src="./main/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
	<%
		int mem_num = (int) session.getAttribute("mem_num");
		System.out.print(mem_num);
	%>
	<!-- header 영역 시작 -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			$("#header-srch").hide();
			$("#a_srch").click(function() {
				$(".tmp").toggle();
				$("#header-srch").toggle(500);
			});

			
			/* $('#summernote').summernote();
			
			$('#summernote').summernote({
	             height: 300,                 // set editor height
	             minHeight: null,             // set minimum height of editor
	             maxHeight: null,             // set maximum height of editor
	             focus: true                  // set focus to editable area after initializing summernote
	     }); */
			
				});
			
		
	</script>
	<!-- header 영역 끝-->
	<!-- 본문 영역 시작 -->
	<div class="bw_writing">
		<form action="./BoardWriteAction.bo" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="<%=mem_num%>" name="fb_mem_num">
			<div class="bw_subject">
				<input type="text" placeholder="제목" class="bw_sub_tex"
					name="fb_subject"> <select class="bd_sel"
					name="fb_category">
					<option value="자유게시판">자유게시판</option>
					<option value="중고장터">중고장터</option>
					<option value="자유갤러리">자유갤러리</option>
					<option value="홍보게시판">홍보게시판</option>
				</select>
				<div id="bw_img">

					<i class="fa fa-file-image-o" id="bw_pho_icon"
						style="font-size: 48px; color: gray; margin-left: -30px;"><input
						type="file" id="bw_pho_file" class="bw_pho_icon" name="fb_img"></i>

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
			
				<!-- 				  <img id="blah" src="#" alt="your image" /> -->
				 <!-- <textarea rows="30" cols="120" class="tex01" placeholder="내용을 입력하세요"
					name="fb_content"></textarea>  -->
					<textarea rows="30" cols="120" class="tex01" placeholder="내용을 입력하세요" name="fb_content" id="summernote" value="">
					</textarea>
					
				
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