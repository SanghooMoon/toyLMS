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
	
	// 댓글작성시 미로그인이면 로그인페이지로, 로그인상태이면 정상
	function addReply(){
		var loginUserInfo = '${loginUserInfo}';
		if(loginUserInfo == ''){
			alert("로그인 후 이용가능합니다.");
			location.href = "/member/login";
		} else {
			var theForm = document.replyFrm;
			theForm.action = "/board/reply/${article.bno }";
			theForm.submit();
		}
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
				<th>조회수</th>
			</tr>
			<tr>
				<td>${article.bno }</td>
				<td>${article.id }</td>
				<td>${article.title }</td>
				<td>${article.content }</td>
				<td>${article.indate}</td>
				<td>${article.hit}</td>
			</tr>
		</table>
		<c:if test="${loginUserInfo.id eq article.id}">
			<button type="button" onclick="domodify();">수정하기</button>
			<button type="button" onclick="dodelete();">삭제하기</button>
		</c:if>
	</form>
	
	<br>
	
	
	<table>
		<tr>
			<th>아이디</th>
			<th>댓글내용</th>
			<th>작성일</th>
		</tr>
		<c:if test="${ empty replyList }">
			<tr>
				<td colspan="3">작성된 댓글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${replyList}" var="reply">
			<tr>
				<td>${reply.replyid }</td>
				<td>${reply.replytext}</td>
				<td>${reply.redate}</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<%--  <c:if test="${ loginUserInfo.id ne article.id or loginUserInfo.id eq article.id}">--%>
		<form action="/board/reply/${article.bno }" name=replyFrm>
			<p>댓글작성</p>
			내용<br>
			<textarea rows="10" cols="70" name="replytext"></textarea><br>
			<input type="button" onclick="addReply();" value="작성">
		</form>
	<%-- </c:if>--%>
</body>
</html>