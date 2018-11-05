<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<!-- wrap 영역 시작 -->
<div id="wrap">
   <!-- header 시작 -->
   <jsp:include page="header.jsp"></jsp:include>
   <!--/ header 끝 -->

   <!-- article 영역 시작 -->
   <article>
     <!-- content 영역 -->
      <div class="content">
           <!-- 페이지 이동 버튼, 검색창, 공지사항 영역 시작 -->
           <jsp:include page="header_main.jsp"></jsp:include>  
    	   <!-- 페이지 이동 버튼, 검색창, 공지사항 영역 끝 -->
       		<script type="text/javascript">
				$(document).ready(function(){
					$('#bdFree').html("★자유게시판★");
				});
			</script>
     <!-- 카테고리 영역 시작-->
        <div class="posting">
        <!--  게시글 영역 테두리 -->
          <div class="bd_content">
    		<table border="1" class="board_table">
          	<tr>         	
          	  <th class="table_sh">글 번호</th>
          	  <th>[말머리]</th>
          	  <th>제목</th>
          	  <th class="table_sh">댓글 수</th>
          	  <th class="table_mid">작성자</th>
          	  <th class="table_sh">조회 수</th>
          	  <th>작성 날짜</th>      	    	  
          	</tr>
          	<% for(int i=0 ; i<5 ; i++){ %>
          	<tr>
          	  <td>1</td>
          	  <td>[자유게시판]</td>
          	  <td><a href="#">안녕하세요</a></td>
          	  <td>5</td>
          	  <td>달자</td>
          	  <td>50</td>
          	  <td>2018.11.02</td>
          	</tr>
          	<tr>
          	  <td>2</td>
          	  <td>[자유게시판]</td>
          	  <td><a href="#">출석체크 합니다~</a></td>
          	  <td>19</td>
          	  <td>달자달자</td>
          	  <td>2</td>
          	  <td>2018.11.02</td>
          	</tr>
          	<tr>
          	  <td>3</td>
          	  <td>[자유게시판]</td>
          	  <td><a href="#">와 이런 웹페이지가 생겼다니 너무 좋아요</a></td>
          	  <td>134</td>
          	  <td>제리</td>
          	  <td>9999</td>
          	  <td>2018.11.02</td>
          	</tr>
          	<tr>
          	  <td>4</td>
          	  <td>[자유게시판]</td>
          	  <td><a href="#">출첵 ㅇㅇ</a></td>
          	  <td>10</td>
          	  <td>토미</td>
          	  <td>78</td>
          	  <td>2018.11.02</td>
          	</tr>
          	<%} %>
          </table>
          	<ul class="paging">  
          		<li><a href="#">&lt;</a></li>
	    		<li><a href="#">1</a></li>  
	    		<li><a href="#">2</a></li>  
	    		<li><a href="#">3</a></li>  
	   		 	<li><a href="#">4</a></li>  
			    <li><a href="#">5</a></li>  
			    <li><a href="#">6</a></li>  
			    <li><a href="#">7</a></li>  
			    <li><a href="#">8</a></li>  
			    <li><a href="#">9</a></li>  
			    <li><a href="#">10</a></li>
			    <li><a href="#">&gt;</a></li> 
			</ul>   
          </div>
               
           <!-- 검색창 영역 시작 -->
               <jsp:include page="search_engine.jsp"></jsp:include>

         <jsp:include page="write.jsp"></jsp:include>


        </div> 
    <!-- 카테고리 영역 끝-->


   </div>
        <!-- 상단 이동 바 -->
		<jsp:include page="top.jsp"></jsp:include>
        <!-- 상단 이동 바 끝-->

   <!-- content 영역 끝 -->
   </article>
 <!-- article 영역 끝 -->
   
   <!-- footer 영역 시작-->
   <jsp:include page="footer.jsp"></jsp:include>
   <!-- footer 영역 끝  -->
</div>
<!-- wrap 영역 끝 -->
</body>
</html>