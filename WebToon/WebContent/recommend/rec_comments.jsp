<%@page import="net.member.db.MemberBean"%>
<%@page import="net.webtoon.db.WebtoonBoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>코멘트 보기</title>
<script src="./js/jquery-3.3.1.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="./recommend/css/rec_comments.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="">

		<script>
			$(document).ready(function() {
				var scrollPosition;
				$(window).scroll(function() {
					scrollPosition = $(this).scrollTop();
					if (scrollPosition > 0) {
						$('#rec_c_top').addClass('fixed');
					} else {
						$('#rec_c_top').removeClass('fixed');
					}
				});
			});
		</script>

<%
	List<WebtoonBoardBean> webtoonBoardList = (List<WebtoonBoardBean>)request.getAttribute("webtoonBoardList");
	System.out.println(webtoonBoardList);
	List<Integer> check = (List<Integer>)request.getAttribute("check");
	List<MemberBean> wbbimg = (List<MemberBean>)request.getAttribute("wbbimg");
	String mem_num = (String)session.getAttribute("mem_num");
%>
		<div id="rec_c">
			<div id="rec_c_top">
				<a href="javascript:history.back()"><i
					class="fa fa-caret-square-o-left"></i> 웹툰 정보</a> <b>REVIEW</b>
			</div>
			<div id="line"></div>
			<div class="rec_comments_main_wrap">
			<%if(webtoonBoardList.size() != 0){ %>
				<%for(WebtoonBoardBean wbb : webtoonBoardList){%>
				<div class="rec_box1">
					<div class="rec_user_name">
						<%
						int a = 0;
						for(MemberBean mb : wbbimg){
							//System.out.println("mb.getNum():"+mb.getNum()+" ,wbb.getWbb_mem_num():"+wbb.getWbb_mem_num());
							
							if(mb.getNum().equals(wbb.getWbb_mem_num())){
								//System.out.println("실행");
								if(mb.getProfileimg()!=null){
									%><img src="./upload/<%=mb.getProfileimg() %>" class="rec_memberimg"><%
									a++;
								}
								break;
							}
						  }
						System.out.println(a);
						if(a==0){
							%><img src="./main/img/member.png" class="rec_memberimg"><%
						}
						%>
						<p><%=wbb.getWbb_mem_nik() %></p>
					</div>
					<hr>
					<div class="rec_comment">
						<p><%=wbb.getWbb_comment() %></p>
					</div>
					<div class="rec_comment_date"><%=wbb.getWbb_date() %></div>
					<hr>
					<div class="rec_comment_like">
						<i class="fa fa-heart-o like" title="<%=wbb.getWbb_bdnum()%>" style="cursor: pointer;"></i>
						<p><%=wbb.getWbb_sumlike() %></p>
					</div>
					
				</div><%}%>
			</div><%} else{%><h2 style="text-align: center; line-height: 15; font-size: 38px; margin: 20px auto;">
				<i class="fa fa-search"></i>작성 된 리뷰가 없습니다.
			</h2><%}%>
			<script>
				$(document).ready(function(){
					$('.like').each(function(index){
						var check = <%=check%>;
						if(check.length!=0){
							for(var i=0; i<check.length; i++){
								//alert(check[i]);
								if(check[i]==$(this).attr('title')){
									$(this).removeClass('fa-heart-o');
									$(this).addClass('fa-heart');
								}
							}
						}
					});	
					$('i.like').click(function(){
						if(<%=mem_num%>==null){
							alert('로그인이 필요한 서비스 입니다.');
						}else{
							$.ajax('comment_like.wbt',{
								context: this,
								data:{	
									wbb_bdnum: $(this).attr('title')
								},success:function(data){
									// 이미 좋아요를 했을때
									//alert(data);
									var op = data.split(",");
									if(op[0]=='true'){
										$(this).removeClass('fa-heart');
										$(this).addClass('fa-heart-o');
										$(this).next().html(op[1]);
									// 좋아요 안눌렀을때
									}else{
										$(this).removeClass('fa-heart-o');
										$(this).addClass('fa-heart');
										$(this).next().html(op[1]);
									}
								}
							});
						}
					});
				});
			</script>
		</div>
		<jsp:include page="../main/top.jsp"></jsp:include>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>