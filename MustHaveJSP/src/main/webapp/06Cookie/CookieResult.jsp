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
		Cookie cookie = new Cookie("myCookie","쿠키");
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
	%>
	
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.println(String.format("%s : %s<br>", cookieName,cookieValue));
			}
		}
	%>
	
	<h2> 페이지 이동 쿠키값 확인</h2>
	<a href="CookieResult.jsp">
		다음 페이지에서 쿠키값 확인
	</a>
</body>
</html>