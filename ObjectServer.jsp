<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String name = request.getParameter("name");

	String id = request.getParameter("id");
	
	String pw = request.getParameter("pw");
	
	session.setAttribute("id", id);  // String id를 "id"라는 곳에 저장해라
	                 //(변수명, String id)
	                 
	session.setAttribute("pw", pw);
%>

</head>
<body>

<%=name %>
<%=session.getAttribute("id") %>
<%=session.getAttribute("pw") %>

</body>
</html>