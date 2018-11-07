<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="webtoon-content" class="modal">

	<div class="modal-content animate">
		<div class="imgcontainer">
			<span
				onclick="document.getElementById('webtoon-content').style.display='none'"
				class="close" title="Close Modal">&times;</span> 
			<img
				src="https://shared-comic.pstatic.net/thumb/webtoon/651673/thumbnail/thumbnail_IMAG10_3c7a2e4c-376e-4856-9f03-6ba554dcd62a.jpg"
				alt="Avatar" class="avatar">
			<div class="content">
				<b>유미의세포들</b>
			</div>
			<div class="author">
				<b>이동건 · 에피소드 / 네이버</b>
			</div>
			<div>
				<a href="#">웹툰보기</a>
			</div>
		</div>

		<div class="container">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Type</th>
			      <th scope="col">Column heading</th>
			      <th scope="col">Column heading</th>
			      <th scope="col">Column heading</th>
			    </tr>
			  </thead>
			    <tr class="table-dark">
			      <th scope="row">Dark</th>
			      <td>Column content</td>
			      <td>Column content</td>
			      <td>Column content</td>
			    </tr>
			  </tbody>
			</table> 
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
</script>


