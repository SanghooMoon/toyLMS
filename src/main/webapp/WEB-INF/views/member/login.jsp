<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp" %>
	
	<form action="/member/signIn" method="post">
		<input type="text" name="id" placeholder="아이디">
		<input type="password" name="pwd" placeholder="비밀번호">
		<input type="submit" value="로그인">
	</form>
	
</body>
</html>