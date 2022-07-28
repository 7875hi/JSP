<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardwriteServer.jsp" method="post">

<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" size="23" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea cols="25px" rows="20px" name="content"></textarea></td>
	</tr>
	<%
	// 로그인이 되었으면(session이 널이 아니면)
	if(session.getAttribute("id") != null){
	%>	
	<tr>
		<td colspan="2"><input type="submit" value="저장하기"></td>
	</tr>
	<%
	}
	%>
</table>

</form>
</body>
</html>