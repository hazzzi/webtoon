<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>��й�ȣ ����</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/modPass.css">
</head>
   <jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  mdps=modPass		-->
<div id="mdps_wrap">
   <!-- header ���� -->
   <!--/ header �� -->
<!--ȸ�� ���� ���� �κ�  -->	
<div id="mdps_title"><h1>��� ��ȣ ����</h1></div>

<form action="#" method="post">
<div id="mdps"><!--reinfo  -->
	
	
	<div id="mdps_text">
	<table border="0">
	<tr><th>���� ��й�ȣ</th><td><input type="passward" name="pass" readonly></td></tr>
	<tr><th>�� ��й�ȣ</th><td><input type="passward" name="newpass" required></td></tr>
	<tr><th>�� ��й�ȣ Ȯ��</th><td><input type="passward" name="renewpass" required></td></tr>     
	</table>
 	</div> <!--id="rif_text" -->
	<div id="mdps_sub">
	<input type="button" value="�ڷΰ���" onclick="location.href='myProfile.jsp'">
	<input type="submit" value="����">
	</div>
</div>
<!--ȸ�� ���� ���� �κ�   -->


<!-- footer ���� (����)-->
	<!-- footer ���� (��)-->

</form>
</div>
</body>
		<jsp:include page="../main/footer.jsp"></jsp:include>
</html>