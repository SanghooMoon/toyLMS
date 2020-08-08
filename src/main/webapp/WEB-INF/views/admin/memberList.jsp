<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/approval.css">
	<title>회원 목록</title>
</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp"%>


	<h1>회원목록</h1>

	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>전공</th>
			<th>가입일</th>
			<th>등급</th>
		</tr>
		<c:forEach items="${memberList}" var="member">
			<tr>
				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.phone }</td>
				<td>${member.major}</td>
				<td>${member.indate }</td>
				<td><select name="grade">
						<option>${member.grade }</option>
						<option>ADMIN</option>
						<option>NORMAL</option>
				</select></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
