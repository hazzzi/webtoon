<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="member/css/forgetpw.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<% 
request.setCharacterEncoding("utf-8");
String flag="1";
flag=(String)request.getAttribute("flag");
String DBPw =(String)request.getAttribute("DBPw");
	System.out.println(DBPw);
%>
<form action="MemberForgetpwAction.me" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.me"><strong>���̵� ã��</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.me"><strong>��й�ȣ ã��</strong></a>
</div>

<div class="ex"><% if(DBPw!=null){%>ȸ������ ��й�ȣ�� [<%=DBPw%>] �Դϴ�!<%}else{%>��ϵ� ���̵�� ��й�ȣ ��Ʈ�� �Է��ϼ���<%}%></div>

<div class="id"><input type="text"name="id" placeholder="���̵�" ></div>

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
<div class="answer_input"><input type="text" name="ans" placeholder="�亯" required></div>

<div class="getpw">
<input type="submit" value="��й�ȣ ã��">
</div>
<div class="loginpage"><a href="login.me">�α��� �ϱ�</a></div>

<div class="hpname">
<i class="fa fa-search co"></i>
���� �� ����?
</div>

</div>
</form>
<script type="text/javascript">
var ckflag=<%=flag%>
	function findfail(){
		if(ckflag=="0"){
			alert('���̵�,��Ʈ ���� Ȥ�� ��Ʈ�� Ȯ���ϼ���.');
			
		}	
	}
	
	findfail();
</script>
</body>
</html>