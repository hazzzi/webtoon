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

<style>

.detail {
/*    border: 1px solid blue; */
   width: 1400px;
   display: block;
   margin: 20px auto;
   font-family: 'NanumBarunpenR'
}
/*본문내용*/
#article-content {
    font-size: 25px;
    color: #333;
    min-height:300px;
}
#date-writer-hit {
    display: block;
    margin: 30ox;
    padding: 30px;
    font-size: 20px;
    color: #555;
    text-align: right;
}
.attach-file {
    font-size: 11px;
    line-height: 1.3;
}
/* 댓글과 댓글을 테두리로 구분 */
.comments {
    border-top: 1px solid #ebebeb;
}
/* 댓글 작성자 ID */
.comments > span.writer {
    display: block;
    float: left;
    margin: 3px;
    padding: 0;
    font-size: 20px;
    font-weight: bold;
    color: #555;
}
/* 댓글 작성일 */
.comments > span.date {
    display: block;
    float: left;
    margin: 3px;
    padding: 0;
    font-size: 20px;
    color: #555;
}
/* 댓글 수정|삭제 */
 .comments > span.modify-del {
    display: block;
    float: right;
    margin: 3px;
    padding: 0;
    font-size: 12px;
    color: #555;
}
/* 댓글 수정|삭제 링크 */
.comments a {
    color: #555;
    text-decoration: none;
    font-size: 15px;
}
.comments a:hover {
    color: #555;
    text-decoration: underline;
}
/* 댓글 내용 */
.comments > p {
    clear: both;
    margin: 0;
    padding: 0 3px 3px 3px;
    color: #555;
    font-size: 15px;
}
.comment-form {
    clear: both; 
    padding: 0.22em 2.22em 0.22em 3.22em; 
}
.comment-textarea {
    border: 1px solid silver;
    padding-bottom: 30px;
/*     width: 99%; */
    color:#555;
    background-color: #eee;
    font-size: 15px; 
}
/* #addComment {
    margin-bottom: 5px;
    padding: 0.22em;
    border: 1px solid #eee;
    background-color: #fafbf7;
} */
/* #addComment textarea {
    width: 99%;
    padding: 3px;
    border: 0;
    color: #555;
} */

#addComment{
float: left;
}

/*이전글 다음글*/
#next-prev {
    margin-top: 80px;
    border-top: 1px solid #e1e1e1;
}
#next-prev > p {
    margin: 5px 0;
    padding: 10px;
    border-bottom: 1px solid #e1e1e1;
    font-size: 20px;
    color: #333;

}
 #next-prev > p > a {
    color: #333;
    text-decoration: none;
 	font-size: 20px;
}
#next-prev > p > a:hover {
    color: #333;
    text-decoration: underline;
}

/*수정 삭제 다음글 이전글 */
#view-menu {
    height: 22px;
}
.fl {
    float: left;
}
.fr {
    float: right;
}
.fi {
	float: left;
    margin: 20px 0;
}
hr {
	color: #74668c;
}

/*버튼 호버*/
.bt{
	width: 100px;
    height: 41px;
    background-color: white;
    margin-left: 10px;/* 345px; */
    position: relative;
    /* top: -80px; */
    /* border-collapse: collapse; */
    border: 2px solid #74668c;
    border-radius: 30px;
    font-family: 'NanumBarunpenR', sans-serif;
    font-size: 20px;
    font-weight: bold;
    margin-bottom:10px;
}

.bt:HOVER{
	background-color: #74668c;
	color: #fff;
}

.bt_c_write{
	width: 100px;
    height: 106px;
    background-color: white;
    margin-left: 10px;
    position: relative;
    border: 2px solid #74668c;
    border-radius: 30px;
    font-family: 'NanumBarunpenR', sans-serif;
    font-size: 20px;
    font-weight: bold;
    margin-bottom:10px;
}

.bt_c_write:HOVER{
	background-color: #74668c;
	color: #fff;
}


#dtl_tex{
	border-style: none;
	font-family: 'NanumBarunpenR';
	resize: none;
	width: 1283px;
	height: 136px;
	}

/*좋아요*/

 svg{
  cursor:pointer; overflow:visible; width:60px;
  #heart{transform-origin:center; animation:animateHeartOut .3s linear forwards;}
  #main-circ{transform-origin:29.5px 29.5px;}
}

 #checkbox{display:none;}

 #checkbox:checked + label svg{
  #heart{transform:scale(.2); fill:#E2264D; animation:animateHeart .3s linear forwards .25s;}
    #main-circ{transition:all 2s; animation:animateCircle .3s linear forwards; opacity:1;}


 @keyframes animateCircle{
  40%{transform:scale(10); opacity:1; fill:#DD4688;}
  55%{transform:scale(11); opacity:1; fill:#D46ABF;}
  65%{transform:scale(12); opacity:1; fill:#CC8EF5;}
  75%{transform:scale(13); opacity:1; fill:transparent; stroke:#CC8EF5; stroke-width:.5;}
  85%{transform:scale(17); opacity:1; fill:transparent; stroke:#CC8EF5; stroke-width:.2;}
  95%{transform:scale(18); opacity:1; fill:transparent; stroke:#CC8EF5; stroke-width:.1;}
  100%{transform:scale(19); opacity:1; fill:transparent; stroke:#CC8EF5; stroke-width:0;}
}

 @keyframes animateHeart{
  0%{transform:scale(.2);}
  40%{transform:scale(1.2);}
  100%{transform:scale(1);}
}

 @keyframes animateHeartOut{
  0%{transform:scale(1.4);}
  100%{transform:scale(1);}
}



</style>



</head>

<body>
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
    <th style="text-align: left;vertical-align: center center; font-size: 30px; display:inline;">TITLE&nbsp;&nbsp;</th>
    <th style="text-align: left;font-size: 30px;">제목입니다 제목입니다</th>
</tr>
<hr>
</table>
		<div id="content">
		<hr>
		<div id="date-writer-hit">
		<span>2018.11.19 | </span>
		<span>김야옹 | </span>
		<span>조회수가 들어갈 거햐 | </span>
		</div>  
		<div id="article-content">
		내용입니다 내용입니다 내용입니다
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
        <input type="button" class="bt" value="수정" />
        <input type="button" class="bt" value="삭제" />
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
<!--        				 <textarea id="addComment-ta" name="memo" rows="5" cols="50" ></textarea> -->
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