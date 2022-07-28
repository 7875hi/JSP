<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 한글깨짐 방지 설정 (form 태그에서 method 방식이 post일 때)
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수집
	String title = request.getParameter("title");   // request(요청)
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("id");  // 로그인할 때 사용자가 입력한 id를 가져와라.
	
		// DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;

		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			
			//System.out.println("DB연결 성공");
			
			// sql 문장
			pstmt = conn.prepareStatement("insert into board (title, content, id) values (?, ?, ?)");
			                              		
			pstmt.setString(1, title);
			                              
			pstmt.setString(2, content);
			
			pstmt.setString(3, id);
			
			int result = pstmt.executeUpdate();

			if(result == 1){  // 글쓰기가 성공했으면
				out.println("<script>");
				out.println("location.href='boardlist.jsp'");
				out.println("</script>");
			}
			else{   // 그렇지 않으면
				out.println("<script>");
				out.println("location.href='boardwrite.jsp'");
				out.println("</script>");	
			}
			
		}catch(Exception e){
			//System.out.println("DB연결 실패");
			e.printStackTrace();
		}finally{ 
			conn.close();
			pstmt.close();
		}
%>

</body>
</html>