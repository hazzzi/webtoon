<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>���� �� �� ����</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/myArticle.css">
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  ma=myArticle  
							  		-->
<div id="ma_wrap">
   <!-- header ���� -->
   <!--/ header �� -->
<!--ȸ�� ���� ���� �κ�  -->	
<div id="ma_title"><h1>���� �� �� ����</h1></div>

<div class="mya_back">
<input type="button" value="�ڷΰ���" onclick="location.href='myProfile.jsp'">
</div>

<div class="clear"></div>

<form action="#" method="post">
<div id="ma"><!--reinfo  -->

	<div id="ma_text">
		<table border="0">
			<tr>
				<th>�� ��ȣ</th>
				<th>
				
					<select name="sel_text" required>	
						<option value="1">��ü��</option>
						<option value="2">�����Խ���</option>
						<option value="3">������</option>
						<option value="4">�Ҿ�Ʈ</option>
					</select>
					
				</th>
				<th>����</th>
				<th>��� ��</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
				<th>�ۼ� ��¥</th>
			</tr>
				
				
				<% for(int i=0 ; i<2 ; i++){ %>
			<tr>
				<td>1</td>
				<td>[�����Խ���]</td>
				<td><a href="#">�ȳ��ϼ���</a></td>
				<td>5</td>
				<td>��</td>
				<td>50</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>2</td>
				<td>[�����Խ���]</td>
				<td><a href="#">�⼮üũ �մϴ�~</a></td>
				<td>19</td>
				<td>��</td>
				<td>2</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>3</td>
				<td>[�����Խ���]</td>
				<td><a href="#">�� �̷� ���������� ����ٴ� �ʹ� ���ƿ�</a></td>
				<td>134</td>
				<td>��</td>
				<td>9999</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>4</td>
				<td>[�����Խ���]</td>
				<td><a href="#">��ý ����</a></td>
				<td>10</td>
				<td>��</td>
				<td>78</td>
				<td>2018.11.02</td>
			</tr>
			<tr>
				<td>5</td>
				<td>[�����Խ���]</td>
				<td><a href="#">��ý ����</a></td>
				<td>10</td>
				<td>��</td>
				<td>78</td>
				<td>2018.11.02</td>
			</tr>
						<%} %>			
			
		</table>
 	</div> <!--id="rif_text" -->
	<div id="ma_sub">
	<input type="search" id="mt_search" name="mt_search">
	<input type="submit" id="mt_submit" value="�˻�">
	</div>
	
	<div class="clear"></div>
	
</div>
<!--ȸ�� ���� ���� �κ�   -->


<!-- footer ���� (����)-->
	<!-- footer ���� (��)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>