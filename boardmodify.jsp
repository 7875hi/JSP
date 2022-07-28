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
	int bno =  Integer.parseInt(request.getParameter("bno"));

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
		pstmt.setInt(1,bno);
		// 위 sql 문장을 실행(workbench : ctrl+enter)
		// executeQuery() : select ===> select된 결과를 ResultSet이라는 공간에 저장해서 반환
		// executeUpdate() : insert, update, delete
		rs = pstmt.executeQuery();  // select 된 결과 전체 다 들어가있음
		

		if(rs.next()){  
%>	
<h1>수정 화면</h1>
<form>
<!--  bno를 읽기모드로 해서 수정 불가
<input type="text" value="<%= rs.getString("bno") %>" name = "bno" size =1 readonly>
-->

<!-- bno 숨기기 -->
<input type="hidden" value="<%= rs.getString("bno") %>" name = "bno" size =1 readonly>

<table border = '1'>
	<tr>
		<td>제목</td>
		<td><input type="text" value="<%= rs.getString("title") %>" name = "title"></td>
	</tr>
			
	<tr>
		<td>내용</td>
		<td><textarea cols="25px" rows="20px" name = "content"><%= rs.getString("content") %></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="submit" value="수정완료" formaction="boardmodifyServer.jsp">
						<input type="submit" value="삭제하기" formaction="boardremoveServer.jsp">
		</td>
	</tr>			
</table>

</form>
						
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