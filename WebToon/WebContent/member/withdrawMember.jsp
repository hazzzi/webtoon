<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>ȸ�� Ż��</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../main/css/footer-main.css">
<link rel="stylesheet" href="css/withdrawMember.css">
</head>
   <jsp:include page="../main/header.jsp"></jsp:include>
<body>
						<!--  wdm=withdrawMember		-->
<div id="update_wrap">
   <!-- header ���� -->
   <!--/ header �� -->
<!--ȸ�� ���� ���� �κ�  -->	
<div id="wdm_title"><h1>ȸ�� Ż��</h1></div>

<form action="#" method="post">
<div id="wdm"><!--reinfo  -->
	<div id="wdm_exp"><p>ȸ�� Ż�� �� ��� ������ �����Ǹ�, �簡���� �����մϴ�.</p></div>
	
	<div id="wdm_text">
	<table border="0">
	<tr><th>���� ��й�ȣ</th><td><input type="passward" name="pass" readonly></td></tr>
	</table>
 	</div> <!--id="rif_text" -->
	<div id="wdm_sub">
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