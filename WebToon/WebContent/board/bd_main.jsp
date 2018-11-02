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
       
     <!-- 카테고리 영역 시작-->
        <div class="posting">
         <div class="cont_category"><span>글번호 | </span>
                              <span>[말머리] | </span>
                              <span>제목 | </span>
                              <span>댓글 수 | </span>
                              <span>작성자 | </span>
                              <span>조회 수 | </span>
                              <span>작성날짜</span></div>
        <!--  게시글 영역 테두리 예제입니다 나중에 지워도 돼요-->
          <div class="bd_content">
    
         </div>
      <!--  게시글 영역 테두리 예제입니다 나중에 지워도 돼요-->
         <!-- 검색창 영역 시작 -->
               <jsp:include page="search_engine.jsp"></jsp:include>
           <!-- 검색창 영역 끝-->
        </div> 
    <!-- 카테고리 영역 끝-->
    
    
    <!-- 이 곳에 게시물 영역이 들어갑니다. --> 



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