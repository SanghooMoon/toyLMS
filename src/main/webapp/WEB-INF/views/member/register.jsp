<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	
	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp" %>
	
	<h1>회원가입</h1>
	<form action="/member/signUp" method="post">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="pwd"><br>
		비밀번호 재입력 : <input type="password" name="rePwd"><br>
		이름 : <input type="text" name="name"><br>
		핸드폰번호 : <input type="tel" name="phone"><br>
		전공 : 
		<select name="major">
			<option value="스마트웹">스마트웹</option>	
			<option value="빅데이터">빅데이터</option>	
		</select>
		<input type="submit" value="가입">
	</form>
	
</body>
</html>