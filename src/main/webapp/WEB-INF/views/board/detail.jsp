<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/approval.css">
<title>게시판</title>
<script type="text/javascript">
	
	// 삭제
	function dodelete(){
			var theForm = document.articleFrm;
			theForm.method = "post";
			theForm.action = "/board/delete/${article.bno }";
			theForm.submit();
	}
	
	// 수정
	function domodify(){
		var theForm = document.articleFrm;
		theForm.method = "post";
		theForm.action = "/board/modify/${article.bno }";
		theForm.submit();
}
	</script>
</head>
<body>

	<!-- 공통 header 마크업 -->
	<%@ include file="/resources/common/header.jsp"%>

	<h1>게시판 페이지</h1>

	<form action="/board/modify/${article.bno }" name="articleFrm">
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
		<c:if test="${loginUserInfo.id eq article.id}">
			<button type="button" onclick="domodify();">수정하기</button>
			<button type="button" onclick="dodelete();">삭제하기</button>
		</c:if>
	</form>


</body>
</html>