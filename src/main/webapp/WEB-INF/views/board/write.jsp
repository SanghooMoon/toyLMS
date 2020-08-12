<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp"%>
	
	<form action="/board/dowrite">
		제목 : <input type="text" name="title"><br>
		내용<br>
		<textarea rows="30" cols="30" name="content"></textarea>
		<input type="submit" value="작성">
	</form>
	
	
</body>
</html>