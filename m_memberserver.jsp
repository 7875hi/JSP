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
	// 사용자가 입력한 id 값을 id 변수에 저장
	String id = request.getParameter("아이디");   // request(요청)
	String pw = request.getParameter("비밀번호");
	String em = request.getParameter("이메일");

		// DB 연결
		Connection conn = null;
		PreparedStatement pstmt = null;

		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql2");
			conn = ds.getConnection();
			
			//System.out.println("DB연결 성공");
			
			// 회원가입을 하기 위한 sql 문장
			// prepareStatement : java -> SQL 실행 위해 (DB에 쿼리를 보내기 위해) 사용하는 객체
			pstmt = conn.prepareStatement("insert into member (id, password, email) values (?, ?, ?)");
			                              // SQL 문장 작성
			
			// 첫 번째 물음표에는 사용자가 입력한 id값(request.getParameter("id"))을 설정
			pstmt.setString(1, id);
			                              
			// 두 번째 물음표에는 사용자가 입력한 password값(request.getParameter("pw"))을 설정
			pstmt.setString(2, pw);
			
			// 세 번째 물음표에는 사용자가 입력한 address값(request.getParameter("addr"))을 설정
			pstmt.setString(3, em);
			
			// 위 sql 문장을 실행(workbench : ctrl+enter)
			// insert가 되었으면 1 값을 result 변수에 저장하고,
			// insert가 되지 않았으면 0 값을 result 변수에 저장
			int result = pstmt.executeUpdate();
			// executeQuery() : select ===> select된 결과를 ResultSet이라는 공간에 저장해서 반환
			// executeUpdate() : insert, update, delete
			
			// insert가 됐다면(회원가입이 되었으면)
			if(result != 0){
				// 로그인 화면으로 이동
				out.println("<script>");
				out.println("location.href='m_loginform.jsp'");
				out.println("</script>");
			}
			else{   // 그렇지 않으면
				// 회원가입 화면으로 아동
				out.println("<script>");
				out.println("location.href='m_loginform.jsp'");
				out.println("</script>");	
			}
			
		}catch(Exception e){
			//System.out.println("DB연결 실패");
			e.printStackTrace();
		}finally{  // 메모리 관리 (사용한것들을 닫아줘야함)
			conn.close();
			pstmt.close();
		}
%>

</body>
</html>