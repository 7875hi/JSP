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

	// 데이터 수집(bno값)
	int bno =  Integer.parseInt(request.getParameter("bno"));
             // String -> int 로 형변환

	//DB 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		// login을 하기 위한 sql 문장
		// prepareStatement : java -> SQL 실행 위해 (DB에 쿼리를 보내기 위해) 사용하는 객체
		pstmt = conn.prepareStatement("select * from board where bno=?");
		                              // SQL 문장 작성
		// 첫번째 물음표에는 bno 셋팅
		pstmt.setInt(1,bno);
		                              
		// 위 sql 문장을 실행(workbench : ctrl+enter)
		// executeQuery() : select ===> select된 결과를 ResultSet이라는 공간에 저장해서 반환
		// executeUpdate() : insert, update, delete
		rs = pstmt.executeQuery();  // select 된 결과 전체 다 들어가있음
		

		if(rs.next()){  
%>	

<table border = '1'>
	<tr>
		<td>제목</td>
		<td><%= rs.getString("title") %></td>
	</tr>
			
	<tr>
		<td>내용</td>
		<td><%= rs.getString("content") %></td>
	</tr>
	
	<tr>
		<td colspan="2"><a href="boardmodify.jsp?bno=<%= rs.getString("bno") %>">수정하기</a></td>
	</tr>			
</table>
						
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{  // 메모리 관리 (사용한것들을 닫아줘야함)
		conn.close();
		rs.close();
		pstmt.close();
	}	
%>


</body>
</html>