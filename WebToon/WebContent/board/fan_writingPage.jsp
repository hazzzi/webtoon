<%@page import="net.board.db.FanDAO"%>
<%@page import="net.webtoon.db.WebtoonBean"%>
<%@page import="java.util.ArrayList"%>
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
	%>
	<!-- header 영역 시작 -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<script>
	
		$(document).ready(
				function() {

					$(function() {
						$("#bw_pho_file").on('change', function() {
							readURL(this);
						});
					});

					function readURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();

							reader.onload = function(e) {
								$('#blah').attr('src', e.target.result);
							}

							reader.readAsDataURL(input.files[0]);
						}
					}

					$("#bd_sel").change(
							function() {
								//alert($("#bd_sel option:selected").text());
								$.ajax('fanCategory.fo', {
									data : {
										fan_category : $(
												"#bd_sel option:selected")
												.val()
									},
									success : function(data) {

										$('.option').remove();

										var op = data.split(",");

										$.each(op, function(i) {

											$('#bd_sel2').append('<option class="option">'+ op[i]+ '</option>');

										});

									}

								});
							});
				});

	</script>
	<!-- header 영역 끝-->
	<!-- 본문 영역 시작 -->
	<div class="bw_writing">
		<form action="./fanboardWriteAction.fo" method="post"
			enctype="multipart/form-data">
			<input type="hidden" value="<%=mem_num%>" name="fa_mem_num">
			<div class="bw_subject">
				<input type="text" placeholder="제목" class="bw_sub_tex" name="fa_subject"> 
					<select id="bd_sel" name="fa_category1">
					<optgroup label="장르 선택"></optgroup>
					<option id="daily" value="일상" class="fan_cate">일상</option>
					<option id="gag" value="개그" class="fan_cate">개그</option>
					<option id="fantasy" value="판타지" class="fan_cate">판타지</option>
					<option id="action" value="액션" class="fan_cate">액션</option>
					<option id="drama" value="드라마" class="fan_cate">드라마</option>
					<option id="love" value="순정" class="fan_cate">순정</option>
					<option id="sensitivity" value="감성" class="fan_cate">감성</option>
					<option id="thriller" value="스릴러" class="fan_cate">스릴러</option>
					<option id="period" value="시대극" class="fan_cate">시대극</option>
					<option id="sports" value="스포츠" class="fan_cate">스포츠</option>
				</select> 
				
				<select id="bd_sel2" name="fa_category2">
				<input type="hidden" value="fa_web_num">
					<optgroup label="웹툰 선택"></optgroup>
				</select>

				<div id="bw_img">
					<i class="fa fa-file-image-o" id="bw_pho_icon"
						style="font-size: 48px; color: gray; margin-left: -30px;">
						<input type="file" id="bw_pho_file" class="bw_pho_icon" name="fa_img">
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
			<form id="form1" runat="server" >
        			<img id="blah" onerror="this.style.visibility='none'">
  					  </form>
				<textarea rows="25" cols="120" class="tex01" placeholder="내용을 입력하세요" name="fa_content"></textarea>
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