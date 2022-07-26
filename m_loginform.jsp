<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="m_loginform.js"></script>
<link rel="stylesheet" href="m_loginform.css">

</head>
<body>

<form action="m_memberserver.jsp"> 

<table>
	<tr>
		<th><label>*</label>아이디</th>
		<td><input type="text" id="아이디" name="아이디" onkeyUp="keyup()"></td> 
		<td id="sq"></td>
	</tr>
	<tr>
		<th><label>*</label>비밀번호</th>
		<td><input type="password" id="비밀번호" name="비밀번호" onkeyUp="keyup()"></td> 
		<td id="pq"></td>
	</tr>
	<tr>
		<th><label>*</label>비밀번호 확인</th>
		<td><input type="password" id="비밀번호re" name="비밀번호re" onkeyUp="keyup()"></td> 
		<td id="pqre"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" id="이메일" name="이메일" onkeyUp="keyup()"></td> 
		<td id="em"></td>
		</tr>
	<tr>
		<th>이메일 확인</th>
		<td><input type="text" id="이메일re" name="이메일re" onkeyUp="keyup()"></td> 
		<td id="emre"></td>
	</tr>
	<tr>
		<td><input type="submit" id="jobu" value="가입하기">
		<input type="button" id="xbu" value="취소하기"></td>
	</tr>
</table>

</form>

</body>
</html>