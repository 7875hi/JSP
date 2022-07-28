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
			pstmt = conn.prepareStatement("delete from board where bno=?");
			
			pstmt.setInt(1,bno);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1){  // 삭제가 성공했으면
				out.println("<script>");
				out.println("location.href='boardlist.jsp?bno="+bno+"'");
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