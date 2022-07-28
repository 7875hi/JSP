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
	// session 에 있는 모든 값 초기화
	session.invalidate();
	out.println("<script>");
	out.println("location.href='loginform.jsp'");
	out.println("</script>");	
%>

</body>
</html>