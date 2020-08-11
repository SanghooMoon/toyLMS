<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/approval.css">
<title>게시판</title>
</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp"%>

	<h1>게시판 페이지</h1>
	<table>
		<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>본문</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${article.bno }</td>
			<td>${article.id }</td>
			<td>${article.title }</td>
			<td>${article.content }</td>
			<td>${article.indate}</td>
		</tr>
	</table>


</body>
</html>