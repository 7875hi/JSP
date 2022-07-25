<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	Connection conn = null;

	try{
		// 드라이브 로드
		Class.forName("com.mysql.jdbc.Driver");  // "드라이브명"
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?serverTimezone=Asia/Seoul","root","1234");  // ("url/db명","id","pw")
	                                                                      // serverTimezone=Asia/Seoul : 현재시간을 우리나라 시간으로 바꿔주기 위해
	    
	    System.out.println("DB연결 성공");
		
	    conn.close();
	}catch(Exception e){
		System.out.println("DB연결 실패");
		e.printStackTrace();
	}

%>
</head>
<body>

</body>
</html>