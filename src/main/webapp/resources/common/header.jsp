<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="GRADE" value="${sessionScope.loginUserInfo.grade}"/>

<%-- 공통 헤더 마크업(디자인) 영역--%>
<!-- header -->
<header id="header">
	<div id="tnbWrap">
		<div class="section">
			<div class="util">
				<ul>
					<c:choose>
						<c:when test="${ GRADE eq 'ADMIN' }">
							<li><a href="/admin/index" title="홈으로">홈으로</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/" title="홈으로">홈으로</a></li>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<%-- 비로그인 상태일때, 로그인정보 세션이 비어있을때 --%>
						<c:when test="${ empty sessionScope.loginUserInfo }">
							<li><a href="/member/login" title="로그인">로그인</a></li>
							<li><a href="/member/register" title="회원가입">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/member/logout" title="로그아웃">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="/board/list" title="게시판">게시판</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>
<!-- // header -->