<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/approval.css">
	<title>가입 요청 목록</title>
	
	<script>
		function doApproval(){
			
			var checked = document.getElementsByName("checked");
			var check = false;
			// 모두 확인하여 하나라도 체크가 되어있으면 true
			for(var i=0; i<checked.length; i++){
				if(checked[i].checked) {
					check = true;
				}
			}
			// 만약 체크가 아무것도 안되있으면 종료
			if(!check) {
				alert("아무것도 선택되지않았습니다.");
				return false;
			}
				
			var theForm = document.approvalFrm;
			theForm.method = "post";
			theForm.action = "/admin/doApproval";
			theForm.submit(); 
			
		};
		
		function reject(){
			var checked = document.getElementsByName("checked");
			var check = false;
			// 모두 확인하여 하나라도 체크가 되어있으면 true
			for(var i=0; i<checked.length; i++){
				if(checked[i].checked) {
					check = true;
				}
			}
			// 만약 체크가 아무것도 안되있으면 종료
			if(!check) {
				alert("아무것도 선택되지않았습니다.");
				return false;
			}
			
			var theForm = document.approvalFrm;
			theForm.method = "post";
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
			<c:if test="${ empty approvalList }">
				<tr>
					<td colspan="7">가입요청한 회원이 없습니다.</td>
				</tr>
			</c:if>
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
				<button type="button" onclick="reject();">가입 취소</button>
		</div>
	</form>
	

</body>
</html>
