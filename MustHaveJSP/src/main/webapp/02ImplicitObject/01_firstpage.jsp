<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h2>01_firstpage.jsp</h2>
<%
	

	pageContext.setAttribute("name", "page man");
	request.setAttribute("name", "requst man");
	request.setAttribute("name", "session man");
	application.setAttribute("name", "application man");
	
	System.out.println("01_firstPage.jsp");
	System.out.println("하나의 페이지 속성 : " + pageContext.getAttributesScope("name"));
	System.out.println("하나의 세션 속성 : " + session.getAttribute("name"));
	System.out.println("하나의 요청 속성 : " + request.getAttribute("name"));
	System.out.println("하나의 애플리케이션 속성 : "+ application.getAttribute("name"));
	
	request.getRequestDispatcher("02_secondPage.jsp").forward(request,response);	
%>