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
	// 데이터 수집
	String title = request.getParameter("title");   // request(요청)
	String content = request.getParameter("content");
	int bno =  Integer.parseInt(request.getParameter("bno"));
	
		// DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;

		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			
			//System.out.println("DB연결 성공");
			
			// sql 문장
			pstmt = conn.prepareStatement("update board set title = ?, content = ? where bno=?");
			                              		
			pstmt.setString(1, title);
			                              
			pstmt.setString(2, content);
			
			pstmt.setInt(3,bno);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1){  // 수정이 성공했으면
				out.println("<script>");
				out.println("location.href='boarddetail.jsp?bno="+bno+"'");
				out.println("</script>");
			}
			else{   // 그렇지 않으면
				out.println("<script>");
				out.println("location.href='boardmodify.jsp?bno="+bno+"'");
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