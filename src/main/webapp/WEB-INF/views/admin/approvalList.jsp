<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/approval.css">
	<title>가입 요청 목록</title>
	
	<script>
		function doApproval(){
			/* 체크안되있을 시 예외처리 추가해야함  */
			
			var theForm = document.approvalFrm;
			theForm.method = "get";
			theForm.action = "/admin/doApproval";
			theForm.submit(); 
			
		};
		
		function doReject(){
			var theForm = document.approvalFrm;
			theForm.method = "get";
			theForm.action = "/admin/reject";
			theForm.submit();
		}
	</script>
	
</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp"%>


	<h1>가입 요청 목록</h1>
	<form name="approvalFrm">
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>전공</th>
				<th>가입일</th>
				<th>등급</th>
				<th>승인</th>
			</tr>
			<c:forEach items="${approvalList}" var="member">
				<tr>
					<td>${member.id }</td>
					<td>${member.name }</td>
					<td>${member.phone }</td>
					<td>${member.major}</td>
					<td>${member.indate }</td>
					<td>${member.grade }</td>
					<td><input type="checkbox" value="${member.id }" name="checked"></td>
				</tr>
			</c:forEach>
		</table>
		<div class="buttons">
				<button type="button" onclick="doApproval();">가입 승인</button>
				<button type="button" onclick="doReject();">가입 취소</button>
		</div>
	</form>
	

</body>
</html>
