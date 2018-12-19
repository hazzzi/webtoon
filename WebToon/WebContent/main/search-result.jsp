<%@page import="net.board.db.FanBean"%>
<%@page import="net.webtoon.db.WebtoonBoardBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@page import="net.webtoon.db.WebtoonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세 정보</title>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="./main/css/owl.carousel.min.css">
<link rel="stylesheet" href="./main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="./main/css/search-result.css">
<link rel="stylesheet" href="./main/css/wbt-review.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">

	$(document).ready(function(){
		$('.owl-carousel').owlCarousel({
		    loop:true,
		    items: 3,
		    dots: true
		});
	});
</script>

</head>
<body>
<%
	WebtoonBean wb = (WebtoonBean)request.getAttribute("wb");
	int count = (int)request.getAttribute("count");
	List<WebtoonBoardBean> wbb = (List<WebtoonBoardBean>)request.getAttribute("wbb");
	List<MemberBean> wbbimg = (List<MemberBean>)request.getAttribute("wbbimg");
	List<WebtoonBean> similar = (List<WebtoonBean>)request.getAttribute("similar");
	List<FanBean> fanList = (List<FanBean>)request.getAttribute("fanList");
	int reviewcount = (int)request.getAttribute("reviewcount");
	List<Integer> check = (List<Integer>)request.getAttribute("check");
	String mem_num = (String)session.getAttribute("mem_num");

	
	// 별점 제어 부분
	double score = (double)request.getAttribute("score"); // double 형태의 평균별점, 소숫점 첫째자리까지
	int tmp0 = (int)(score*10); // ex) score = 3.7 -> tmp0 = 37 로 변환
	int tmp1 = tmp0%10; // tmp1 = 7 : 소숫점 첫째자리 제어하기위해서 10으로 나눈 나머지값
	int tmp2 = 0;
	if(tmp1>=5){ // tmp1을 10으로 나눈 나머지가 5보다 높으면
		tmp2 = tmp1; // tmp2는 7의 값을 가짐 (나머지값)
	}
%>
<div id="main-wrap">
	<jsp:include page="header.jsp" />
	<script>
		$(document).ready(function(){
			
			/* 헤더 부분 상단바 검색 토글 기능 */
/* 			$("#a_srch").click(function(){
				$(".tmp").toggle();
		        $("#header-srch").toggle(500);
		    }); */
			
			/* 스크롤시 헤더 아래쪽 그림자 생성 */
			var scrollPosition;
			$(window).scroll(function(){
				scrollPosition = $(this).scrollTop();
				if (scrollPosition > 0) {
					$('#header-head').addClass('fixed');
				} else {
					$('#header-head').removeClass('fixed');
				}
			});
		});
	</script>
	<!-- search-result header 영역 (끝) -->
	
	<!-- search-result content 영역(시작) -->
	<div id="sr-main">
		 <div id="sr-article">
			 <div id="sr-content">
				<div id="sr-con-background"></div>
			 	<div id="sr-content-box">
			 	<!-- 주소줄에 넘어온 파라미터가지고 디비 select-->
			 	<!-- select * from webtoon where id=?? -->
					<div id="sr-content-img">
						<!-- webtoon 썸네일 -->
						<img src="<%=wb.getWeb_thumb_link()%>">
						<!-- 제목 -->
						<p><%=wb.getWeb_subject() %></p>
						<!-- db 쿼리문 이용-->
						<!-- select mean(grade) from recommend where id=?? -->
						<p>평점 <i class="fa fa-star"></i><%=score %></p>
						<!-- 작가 -->
						<p><%=wb.getWeb_author() %></p>
						<!-- 장르 -->
						<p><%=wb.getWeb_genre() %></p>
						<!-- a태그 링크 : 웹툰 바로이동 링크 -->
						<p><a href="<%=wb.getWeb_link()%>">웹툰 보러가기</a></p>
					</div>
			 	</div>
			 </div>
			 
			<!-- 웹툰 세부사항 -->
			<div class="sr-content-fill">
			
		 	<div id="sr-content-info">
		 		<div class="sr-content-default">
			 		<h2>기본정보</h2>
			 		<!-- 제목 -->
			 		<p><%=wb.getWeb_subject() %></p>
			 		<!-- 작가 -->
			 		<p><i class="fa fa-pencil"></i><%=wb.getWeb_author() %></p>
			 		<!-- 연재시작일(start), 장르 -->
			 		<p><%=wb.getWeb_start() %> · <%=wb.getWeb_genre() %></p>
			 		<!-- 연재사이트(potal), 연재여부(ing) -->
			 		<p><%=wb.getWeb_portal() %> · <%=wb.getWeb_ing() %></p>
			 		<!-- 웹툰 정보 (info) -->
			 		<p><%=wb.getWeb_info() %></p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-star">
		 			<h2>평점</h2>
					<!-- db 쿼리문 이용-->
					<!-- select avg(grade) from recommend where web_num=?? -->
					<!-- ex) 평균 3.37  조정값 : 3.5 , 평균평점에는 3.4값이 보여짐-->
					<!-- ex) 평균 4.12  조정값 : 4, 평균평점에는 4.1값이 보여짐 -->
					<!-- 소숫점 존재할 시 fa-star-half-full 클래스 추가  -->
					<!-- 존재하지 않을시 소숫점 앞자리 수대로  fa-star 추가-->
		 			<i class="fa fa-star-o star"></i>
		 			<i class="fa fa-star-o star"></i>
		 			<i class="fa fa-star-o star"></i>
		 			<i class="fa fa-star-o star"></i>
		 			<i class="fa fa-star-o star"></i>
		 			<!-- 평균평점 -->
		 			<p><%=score %></p>
		 			<!-- 평가자 수 -->
		 			<!-- select count(mem_num) from recommend where web_num=??-->
		 			<p><%=count %>명의 평가</p>
		 		</div>
		 		<hr>
		 		<div class="sr-content-comment">
		 			<h2>리뷰</h2>
		 			<!-- db이용 -->
		 			<!-- 리뷰의 갯수 -->
		 			<!-- select count(wbb_bdnum) from webtoon_borad where web_num=??-->
		 			<p>+<%=reviewcount %></p>
		 			<!-- 로그인 제어 필요, 로그인시 사용가능합니다  -->
		 			<!-- 제이쿼리 이용해서 div영역 보여줌 -->
		 			<p><a class="review-action" style="cursor: pointer;">리뷰남기기</a>|
		 			   <!-- 리뷰 더보기 이동 -->
		 			   <a href="./getReview.wbt?num=<%=wb.getWeb_num()%>">더보기</a></p>
		 			<br>
		 			<!-- 추천수 상위 2개 리뷰 -->
		 			<%
		 			if(wbb.size()==0){%>
		 				<h3 style="text-align: center;">아직 리뷰가 없습니다! 리뷰를 작성해 주세요</h3>
		 			<%}else{
			 			int i=0;
			 			for(WebtoonBoardBean bb:wbb){ %>
			 			<div>
			 				<% if(wbbimg.get(i).getProfileimg()==null){%>
			 				<img src="./main/img/member.png">
			 				<%}else{%>
			 				<img src="./upload/<%=wbbimg.get(i).getProfileimg()%>">
			 				<%}%>
			 				<!-- webtoon_borad -->
			 				<!-- join 이용해서 member_nik -->
			 				<p><%=bb.getWbb_mem_nik() %></p>
			 				<hr>
			 				<!-- wbb_content -->
			 				<p><%=bb.getWbb_comment() %></p>
			 				<hr>
			 				<!-- wbb_sumlike -->
			 				<i class="fa fa-heart-o like" title="<%=bb.getWbb_bdnum()%>" style="cursor: pointer;"></i><p><%=bb.getWbb_sumlike() %></p>
			 			</div>
			 			<%i++;}
		 			} %>
<!-- 		 			<div> -->
<%-- 		 				<%// if(wbbimg.get(1).getProfileimg()==null){%> --%>
<!-- 		 				<img src="./main/img/member.png"> -->
<%-- 		 				<%//}else{%> --%>
<%-- 		 				<img src="./upload/<%//=wbbimg.get(1).getProfileimg()%>"> --%>
<%-- 		 				<%//}%> --%>
<!-- 		 				<p>사용자별명</p> -->
<!-- 		 				<hr> -->
<!-- 		 				<p>로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기로망이 꽃피는 캠퍼스는 없다. 현실적인 우리의 대학일기</p> -->
<!-- 		 				<hr> -->
<!-- 		 				<i class="fa fa-thumbs-o-up"></i><p>35</p> -->
<!-- 		 			</div> -->
		 		</div>
		 		<div style="clear: both; margin: inherit; padding: 15px;"></div>
		 		<hr>
		 		<!-- 같은 장르, 별점이 같은 장르(또는 평균 별점), 같은 연재처중 랜덤하게 -->
		 		<!-- 갯수는 약 10개 정도 추후 더 고민해봄 -->
		 		<div class="sr-content-rec">
		 			<h2>이 웹툰과 유사한 작품</h2>
		 			<div class="owl-carousel owl-theme">
		 				<!-- 반복문 시작 -->
		 				<% for(WebtoonBean s:similar){ %>
			 			<a href="./detail.wbt?num=<%=s.getWeb_num()%>">
				 		<img src="<%=s.getWeb_thumb_link()%>" width="150px" height="120px">
				 		<b style="color:#1b1526; text-align: center;"><%=s.getWeb_subject() %></b>
			 			</a>
			 			<%} %>
		 				<!-- 반복문 끝-->
		 				<!-- 반복문은 여러개 생길 수 있음 -->
		 			</div>
		 		</div>
		 	</div>
		 	<div class="sr-content-sub">
		 		<div class="sr-content-sub-art">
		 			<h2>팬아트</h2>
		 			<!-- 링크는 추후수정 -->
		 			<!-- get방식 이용 id 파라미터 값 넘기기 -->
		 			<p><!-- <a href="../board/fanart_write.jsp?" style="cursor: pointer;">팬아트남기기</a>| -->
		 			   <a href="./fanboardList.fo">더보기</a></p>
		 			<div>
		 			<%
		 			if(fanList.size()==0){%>
		 				<h3 style="text-align: center; line-height: 5;">아직 팬아트가 없습니다!</h3>
		 			<%}else{
		 				for(FanBean f:fanList){
		 			%>
			 				<!-- 링크는 fanart content 영역으로 수정 -->
			 				<!-- db 이용 -->
			 				<!-- webtoon_fanart 디비 참조 -->
			 				<!-- 최근에 올라간 팬아트 상위 2개 -->
			 				<!-- where webtoon-number=?? -->
			 				<a href="./fanboardContent.fo?fa_num=<%=f.getFa_num()%>">
					 			<img src="./upload/<%=f.getFa_img()%>">
				 			</a>
		 			<%} 
		 			}%>
		 			</div>
		 		</div>
		 		<hr>
		 		<div class="sr-content-sub-star">
		<!--  			<h2>내 별점</h2>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star"></i>
		 			<i class="fa fa-star-half-full"></i>
		 			<p>4.5</p> -->
		 			<!-- 웹툰 추천 영역으로 이동 -->
		 			<p class="mg">더 많은 웹툰을 평가해주세요!</p>
		 			<a href="./main_recommend.rec">평가하기</a>
		 		</div>
		 	</div>
		 	</div>
		 </div>
	</div>
	
	<!-- 웹툰 리뷰 작성 영역 -->
	<div id="webtoon-content" class="modal">
	<div class="modal-content animate">
			<div class="imgcontainer">
				<span class="close">&times;</span>
				<!-- 웹툰 제목 부분 -->
				<p><%=wb.getWeb_subject() %></p>
			</div>
			
			<!-- db insert 작업 필요, action은 임시링크 -->
			<form action="./writeReview.wbt" method="post">
				<input type="hidden" name="num" value="<%=wb.getWeb_num()%>">
				<div class="container review_block">
					<!-- <p>리뷰 남기기</p> -->
					<hr style="border-color: white;">
					<textarea placeholder="작품에 대한 리뷰를 작성해주세요." name="wbb_comment"></textarea>
					<input type="submit" value="작성">
				</div>
			</form>
		</div>
	</div>

	<script>
		var modal = document.getElementById('webtoon-content');
	
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		$(document).ready(function(){
			$('.review-action').click(function(index){
				if(<%=mem_num%>==null){
					alert('로그인이 필요한 서비스입니다.');
				}else{
					$.ajax('check_member.wbt',{
						data:{
							web_num:<%=wb.getWeb_num()%>
						},success:function(data){
							if($.trim(data)=='true'){
								$('#webtoon-content').show();
							}else{
								alert("평가후 이용가능한 서비스입니다.");
							}
						}
					});
				}
			});
			
			$('.close').click(function(){
				$('#webtoon-content').hide();
			});
			
			// 별점 제어
			$('.star').html(function(index){
				// index는 star 갯수만큼 반복됨, star는 5개임			
				if(index<<%=tmp0/10%>){ // index 값이 반복되면서 tmp0/10의 몫에 해당하면 별을 채우고
					$(this).removeClass('fa-star-o');
					$(this).addClass('fa-star');
				}
				if(index==<%=tmp0/10%>&&<%=tmp2%>!=0){ // index값이 몫과 같고(마지막 인덱스..?), 나머지값이 0이아니면  
					$(this).removeClass('fa-star-o');
					$(this).addClass('fa-star-half-full');
				}
				// 3.5 -> 3번째까지 별을 채우고
				// 0.5부분은 3번째의 바로 다음요소에만 별을 반 채움
			});
			
			// 좋아요를 이미 했을때 보여지는 값
			$('.like').each(function(index){
				var check = <%=check%>;
				if(check.length!=0){
					for(var i=0; i<check.length; i++){
						//alert(check[i]);
						if(check[i]==$(this).attr('title')){
							$(this).removeClass('fa-heart-o');
							$(this).addClass('fa-heart');
							//$(this).css("color", "#1b1526");
						}
					}
				}
			});	
			// 좋아요 기능 구현
			$('i.like').click(function(){
				if(<%=mem_num%>==null){
					alert('로그인이 필요한 서비스 입니다.');
				}else{
					$.ajax('comment_like.wbt',{
						context: this,
						data:{	
							wbb_bdnum: $(this).attr('title')
						},success:function(data){
							//alert(data);
							var op = data.split(",");
							// 이미 좋아요를 했을때
							if(op[0]=='true'){
								$(this).removeClass('fa-heart');
								$(this).addClass('fa-heart-o');
								//$(this).css("color", "#c0c0c0");
								$(this).next().html(op[1]);
							// 좋아요 안눌렀을때
							}else{
								$(this).removeClass('fa-heart-o');
								$(this).addClass('fa-heart');
								//$(this).css("color", "#1b1526");
								$(this).next().html(op[1]);
							}
						}
					});
				}
			});
		});
	</script>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>