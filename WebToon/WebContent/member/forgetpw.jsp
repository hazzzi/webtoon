<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/forgetpw.css">
</head>
<body>
<form action="#" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.jsp"><strong>���̵� ã��</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.jsp"><strong>��й�ȣ ã��</strong></a>
</div>
<div class="ex"><p>ȸ�����Կ� ��Ȥ�� ������ ��й�ȣ�� ã�� �� �ֽ��ϴ�.</p></div>

<div class="id"><input type="text"name="id"  readonly value="���̵�" ></div>

<div class="pwd_hint">
<select name="sel_hint" required>
<option value="">��й�ȣ ��Ʈ�� �����ϼ���</option>
<option value="1">���� �¿����?</option>
<option value="2">���� ���� ��1ȣ��?</option>
<option value="3">���� �����ϴ� ���������� �̸���?</option>
<option value="4">���� ���������?</option>
<option value="5">���� �����ϴ� ������?</option>
</select>
</div>

<!--// ���� 2��
 <div class="pwd_hint">
<p>��� �Էµ� ����</p>
</div> -->
<div class="answer_input"><input type="text" name="name" placeholder="�亯" required></div>

<div class="getpw">
<input type="submit" value="��й�ȣ ã��">
</div>
<div class="loginpage"><a href="login.jsp">�α��� �ϱ�</a></div>
</div>
</form>


</body>
</html>