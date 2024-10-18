<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id"); //입력값을 변수로 받아옴
		String sex = request.getParameter("sex"); //naem이 동일해야 입력값을 받을수있음
		String[] favo = request.getParameterValues("favo"); //값이 여러게일 경우 배열로 받는다
		String favoStr = "";
		
		if(favo != null){
			for(String s : favo)
				favoStr += s + " ";
		}
		
		String intro = request.getParameter("intro").replace("\r\n","<br>");
		
	%>
	
		<ul>
			<li>아이디 : <%=id %></li>
			<li>성별 : <%=sex %></li>
			<li>관심사항 : <%=favoStr %></li>
			<li>자기소개 : <%=intro %></li>
		</ul>
</body>
</html>