<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>회원 목록관리</title>
<link rel="stylesheet" href="./main/css/test.css">
<link rel="stylesheet" href="./main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./main/css/footer-main.css">
<link rel="stylesheet" href="member/css/myArticle.css">
</head>
<body>
<%
List<MemberBean> list = (List<MemberBean>)request.getAttribute("list");
List<MemberBean> mt_search = (List<MemberBean>)request.getAttribute("mt_search");

%>

<div id="ma_wrap">
   <!-- header 시작 -->
<jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header 끝 -->
<!--회원 정보 수정 부분  -->	
<div id="ma_title"><h1>회원 목록관리</h1></div>

<div class="mya_back">
<input type="button" value="뒤로가기" onclick="location.href='myProfile.me'">
</div>

<div class="clear"></div>

<form action="memberSearch.me" method="post">
<div id="ma"><!--reinfo  -->

	<div id="ma_text">
		<table border="0">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>연령대</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>회원삭제</th>
			</tr>
				
				
				<% 	if(mt_search==null){
					for(int i=0; i<list.size(); i++){
//				 	데이터 가져오기 list.get(순서);
//				 	MemberBean mb = (MemberBean)list.get(i);
//				 	제네릭타입 설정하면 형변환없이 사용
					MemberBean mb = list.get(i); %>
			<tr>
				<td><%=mb.getNum()%></td>
				<td><%=mb.getId()%></td>
				<td><%=mb.getNik()%></td>
				<td><%=mb.getAges()%></td>
				<td><%=mb.getEmail()%></td>
				<td><%=mb.getDate()%></td>
				<td><a href="MembermanagementDelete.me?mem_num=<%=mb.getNum()%>"><input class="del_member" type="button" value="회원삭제"></a></td>
			</tr>
			
			
						<%}
					}else {
					for(int i=0; i<mt_search.size(); i++){
//				 	데이터 가져오기 list.get(순서);
//				 	MemberBean mb = (MemberBean)list.get(i);
//				 	제네릭타입 설정하면 형변환없이 사용
					MemberBean mb = mt_search.get(i); %>
					<tr>
				<td><%=mb.getNum()%></td>
				<td><%=mb.getId()%></td>
				<td><%=mb.getNik()%></td>
				<td><%=mb.getAges()%></td>
				<td><%=mb.getEmail()%></td>
				<td><%=mb.getDate()%></td>
				<td><a href="MembermanagementDelete.me?mem_num=<%=mb.getNum()%>"><input class="del_member" type="button" value="회원삭제"></a></td>
			</tr>		
					<%}}%>
		</table>
 	</div> <!--id="rif_text" -->
	<div id="ma_sub">
	<select name="opt_sel">
	<option value="id" name="opt_id">아이디</option>
	<option value="email" name="opt_email">이메일</option>
	</select>
	<input type="text" id="mt_search" name="mt_search">
	<input type="submit" id="mt_submit" value="검색">
	</div>
	
	<div class="clear"></div>
	
</div>
<!--회원 정보 수정 부분   -->


<!-- footer 영역 (시작)-->
	<!-- footer 영역 (끝)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>