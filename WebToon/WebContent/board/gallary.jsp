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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
 
 
  
  <style>
      #columns{
        column-width:350px;
        column-gap: 1px;
		position:static;
         text-align: center;
      }
      #columns figure{
        display: inline-block;
        border:1px solid rgba(0,0,0,0.2);
        margin:0;
        margin-bottom: 15px;
        padding:10px;
        box-shadow: 2px 2px 5px rgba(0,0,0,0.5);;
      }
      #columns figure img{
        width:100%;
        resize: both;
        float: center; /* 가운데 정렬 */
 		max-width: 500px; /* 넓이를 지정 */
	    height: auto; /* 높이를 지정 */
        margin: 5px 0;
        
      }
      #columns figure figcaption{
        border-top:1px solid rgba(0,0,0,0.2);
        padding:10px;
        margin-top:11px;
      }
      .gallary {
      width: 1503px;
      padding: 10px;
      margin: auto;
      }
    </style>
</head>
<body>
	<!-- wrap 영역 시작 -->
	<div id="wrap">

		<!-- header 시작 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!--/ header 끝 -->
		
	<div class="gallary">
		<jsp:include page="header_main.jsp"></jsp:include>
		
		<article>

	
	<div class="gallary2">	
	<% for(int i=0 ; i<10 ; i++){%>
		  <div id="columns">
		 <%  for(int a=0; i<4; i++){%>
      		<figure>
      		  <img src="//s3-us-west-2.amazonaws.com/s.cdpn.io/4273/rapunzel.jpg">
        		<figcaption>고</figcaption>
      		</figure>
      
     	    <figure>
       		   <img src="https://via.placeholder.com/285">
        		<figcaption>양</figcaption>
      		</figure>
      
       		<figure>
        		<img src="https://via.placeholder.com/285">
        		<figcaption>이</figcaption>
     		</figure>1
     	
     
	
			
     	
      	<%} %>
      <%} %>
     
</div>
	</div>
		</div>
		</article>
		<span class="fan_paging">
				<a href="#">&lt;</a>
				<%for(int i=0; i<10; i++){ %>
				<a href="#"><%=i+1 %></a>
				<% }%>
				<a href="#">&gt;</a>
			</span>
		<jsp:include page="search_engine.jsp"></jsp:include>
		
</div>
			<!-- top 버튼 -->
			<jsp:include page="top.jsp"></jsp:include>

			<!-- footer 영역 시작-->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- footer 영역 끝  -->

	</div>

</body>
</html>