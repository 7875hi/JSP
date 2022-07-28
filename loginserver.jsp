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
    // loginform.jsp에 있는 데이터 수집
	String id = request.getParameter("id");   // request(요청)
	String pw = request.getParameter("pw");

	System.out.println(id);
	System.out.println(pw);
	
	
	// DB 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		conn = ds.getConnection();
		
		//System.out.println("DB연결 성공");
		
		// login을 하기 위한 sql 문장
		// prepareStatement : java -> SQL 실행 위해 (DB에 쿼리를 보내기 위해) 사용하는 객체
		pstmt = conn.prepareStatement("select * from member where id = ? and password = ?");
		                              // SQL 문장 작성
		
		// 첫 번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
		pstmt.setString(1, id);
		                              
		// 두 번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
		pstmt.setString(2, pw);
		
		// 위 sql 문장을 실행(workbench : ctrl+enter)
		// executeQuery() : select ===> select된 결과를 ResultSet이라는 공간에 저장해서 반환
		// executeUpdate() : insert, update, delete
		rs = pstmt.executeQuery();
		// ResultSet : DBMS에서 생성된 결과물을 자바로 끌고 오기 위해 사용(SQL -> java)
		
		// rs.next() : 아래열로 한 칸 이동해라?
		if(rs.next()){  // ResultSet에 데이터가 있으면
			// login을 해라(session)
			// session영역에 id값을 유지시킴으로 로그인 된 채로 서비스 이용
			session.setAttribute("id", id);  // 로그인이 된 채로
			
			// 메인페이지로 이동
			out.println("<script>");
			out.println("location.href='boardlist.jsp'");
			out.println("</script>");
		}
		else{  // 그렇지 않으면
			// loginform 화면으로 이동
			out.println("<script>");
			out.println("location.href='loginform.jsp'");
			out.println("</script>");
			
		}
		
	}catch(Exception e){
		//System.out.println("DB연결 실패");
		e.printStackTrace();
	}finally{  // 메모리 관리 (사용한것들을 닫아줘야함)
		conn.close();
		rs.close();
		pstmt.close();
	}
	
%>


</body>
</html>