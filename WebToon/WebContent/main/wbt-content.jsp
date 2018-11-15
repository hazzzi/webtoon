<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//	name age 파라미터 받아서
	request.setCharacterEncoding("utf-8");
 	String src=request.getParameter("src");
 	
%>
<div id="webtoon-content" class="modal">
	<div class="modal-content animate">
		<div class="imgcontainer">
			<span class="close">&times;</span> 
			<div id="wbt-info">
				<img
					src=<%=src %>
					alt="Avatar" class="avatar">
				<div id="wbt-content">
					<a>유미의세포들</a><!-- 웹툰 제목 -->
				</div>
				<div id="wbt-author">
					<b>이동건 · 에피소드 / 네이버</b><!-- 웹툰 작가/장르/포털 -->
				</div>
				<div id="wbt-search">
					<a href="#">웹툰보기</a><!-- 웹툰 링크 -->
				</div>
			</div>
		</div>

		<div class="container" id="wbt-bo-cont">
			<table id="wbt-board">
			    <tr>
			      <th rowspan="4">리뷰/한줄평</th>
			    </tr>
			    <tr>
			      <td>ㅎ</td>
			      <td>품으며, 못할 봄바람을 무엇을 가치를 사막이다. 끝에 이것은 하였으며, 커다란 교향악이다.</td>
			      <td>커다란 교향악</td>
			      <td>2018-11-11</td>
			    </tr>
			    <tr>
			      <td>ㅎ</td>
			      <td>품으며, 못할 봄바람을 무엇을 가치를 사막이다. 끝에 이것은 하였으며, 커다란 교향악이다.</td>
			      <td>커다란 교향</td>
			      <td>2018-11-11</td>
			    </tr>
			    <tr>
			      <td>ㅎ</td>
			      <td>품으며, 못할 봄바람을 무엇을 가치를 사막이다. 끝에 이것은 하였으며, 커다란 교향악이다.</td>
			      <td>커다란 교향</td>
			      <td>2018-11-11</td>
			    </tr>
			    <tr>
			      <td>ㅎ</td>
			      <td>품으며, 못할 봄바람을 무엇을 가치를 사막이다. 끝에 이것은 하였으며, 커다란 교향악이다.</td>
			      <td>커다란 교향</td>
			      <td>2018-11-11</td>
			    </tr>
			    <tr>
			      <td>ㅎ</td>
			      <td>품으며, 못할 봄바람을 무엇을 가치를 사막이다. 끝에 이것은 하였으며, 커다란 교향악이다.</td>
			      <td>커다란 교향</td>
			      <td>2018-11-11</td>
			    </tr>
			</table> 
			<a href="#">더보기</a>
		</div>
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
			$('#webtoon-content').remove();
		});
		
	});
	
</script>


