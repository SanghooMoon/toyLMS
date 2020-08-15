<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>sanghoo_LMS</title>
</head>
<body>
	
	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp" %>
	
	<h1>메인화면</h1>
	<h2>조회수 TOP 5</h2>
	<table>
		<tr>
			<th>글번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${ empty list }">
			<tr>
				<td colspan="7">가입요청한 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${list}" var="article">
			<tr>
				<td>${article.bno }</td>
				<td>${article.id }</td>
				<td><a href="/board/view/${article.bno }">${article.title }</a></td>
				<td>${article.indate}</td>
				<td>${article.hit}</td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>
