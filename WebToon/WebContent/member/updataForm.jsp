<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���� ����</title>
<link rel="stylesheet" href="../main/css/test.css">
<link rel="stylesheet" href="../main/css/header-main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/myProfile.css">
<link rel="stylesheet" href="css/updataForm.css">
</head>
<body>
<div id="wrap">
 <!-- header ���� -->
   <jsp:include page="../main/header.jsp"></jsp:include>
   <!--/ header �� -->
   
   
   
    <!-- article ���� ���� -->

 	<div class="wrap">
 	<div class="update_page">
 	<div id="update"><h1>�� ���� ����</h1></div>
 	<div id="form_div">
	<form action="#">
	<table border="0">
	<tr><th>���̵�</th><td><input type="text" value="���̵�" id="id" required></td></tr>
	<tr><th>�̸���</th><td><input type="email" value="�̸���" id="email" required></td></tr>
	<tr><th>�г���</th><td><input type="text" value="�г���" id="nik" required></td></tr>
	<tr><th>��Ʈ ����</th><td><select name="sel_hint" required>
<option value="">��й�ȣ ��Ʈ�� �����ϼ���</option>
<option value="1">���� �¿����?</option>
<option value="2">���� ���� ��1ȣ��?</option>
<option value="3">���� �����ϴ� ���������� �̸���?</option>
<option value="4">���� ���������?</option>
<option value="5">���� �����ϴ� ������?</option>
</select></td></tr>
	<tr><th>��Ʈ �亯</th><td><input type="text" value="��Ʈ" required id="answer"></td></tr>
	<tr><th>���ɴ�</th><td><select name="sel_age" required>
<option value="">����</option>
<option value="1">10��</option>
<option value="2">20��</option>
<option value="3">30��</option>
<option value="4">40��</option>
<option value="5">50�� �̻�</option>
</select></td></tr>
<tr><td colspan="2"><input type="submit" value="�����Ϸ�"></td></tr>
	</table>
	
	</form>
	</div>
	</div>
	</div>
    <!-- article ���� �� -->
<!-- footer ���� (����)-->
	 <div class="clear"></div>
	<hr>
	
	<footer>
		<div id="copyright">
			<a href="#">����</a>|
			<a href="#">���ǻ���</a>|
			<a href="#">��������ó����ħ</a>|
			<a href="#">���</a>
		</div>
	</footer>
	<!-- footer ���� (��)-->


</div>
</body>
</html>