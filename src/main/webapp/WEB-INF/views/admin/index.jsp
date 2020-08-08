<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>ADMIN sanghoo_LMS</title>
</head>
<body>
	
	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp" %>
	
	
	<h1>관리자 메인화면</h1>
	
	<a href="/admin/memberList">회원 목록</a>
	<a href="/admin/approvalList">가입요청 목록</a>
	
</body>
</html>
