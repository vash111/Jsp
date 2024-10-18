<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseLogin</title>
</head>
<body>
<%

	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	
	if(id.equals("must") && pwd.equals("1234")){
		response.sendRedirect("Responsewelcome.jsp"); //리다이렉션 예
	}else{
		RequestDispatcher dis = request.getRequestDispatcher("ResponseMain.jsp?loginErr=1");
		dis.forward(request,response); //포워드
	}

%>
</body>
</html>