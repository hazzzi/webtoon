<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="member/css/forgetid.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<body>
<form action="MemberForgetidAction.me" method="post">
<div class="div">
<div class="forgetid">
<a href="forgetid.me"><strong>���̵� ã��</strong></a>
</div>

<div class="forgetpw">
<a href="forgetpw.me"><strong>��й�ȣ ã��</strong></a>
</div>
<% request.setCharacterEncoding("utf-8");
String flag="1";
flag=(String)request.getAttribute("flag");
String DBId =(String)request.getAttribute("DBId");
	System.out.println(DBId);
	System.out.println(flag);
%>

<div class="ex"><% if(DBId!=null){%>ȸ������ ���̵�� [<%=DBId%>] �Դϴ�!<%}else{%>��ϵ� �̸����� �Է��ϼ���<%}%></div>

<div class="email"><input type="email" name="email" placeholder="�̸���" required></div>
<div class="email"><input type="text" name="nik" placeholder="�г���" required></div>
<div class="getid">
<input type="submit" value="���̵� ã��">
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
			alert('�̸��� Ȥ�� �г����� Ȯ���ϼ���.');
			
		}	
	}
	
	findfail();
</script>
</body>
</html>