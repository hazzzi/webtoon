<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="webtoon-content" class="modal">
	<div class="modal-content animate">
		<div class="imgcontainer">
			<span class="close">&times;</span>
			<!-- 웹툰 제목 부분 -->
			<p>냐한남자</p>
		</div>
		
		<!-- db insert 작업 필요, action은 임시링크 -->
		<form action="../recommend/rec_comments.jsp" method="post">
			<div class="container review_block">
				<!-- <p>리뷰 남기기</p> -->
				<hr style="border-color: white;">
				<textarea placeholder="작품에 대한 리뷰를 작성해주세요."></textarea>
				<input type="submit" value="작성">
			</div>
		</form>
	</div>
</div>

<script>
	// Get the modal
	var modal = document.getElementById('webtoon-content');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	$(document).ready(function(){
		$('.close').click(function(){
			$('#webtoon-content').hide();
		});
		
	});
	
</script>


