<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family : SBAggroL;
}
</style>

<div>
	<c:if test="${empty userNo }">
		<a href="/user/login">로그인</a>	
		<a href="/user/join">회원 가입</a>	
		<a href="/board/list">자유 게시판</a>
	</c:if>
	<c:if test="${not empty userNo }">
		<a href="/user/logout">로그아웃</a>
		<a href="/board/list">자유 게시판</a>
		<a href="/user/mypage">마이페이지</a>
	</c:if>
</div>

</body>
</html>
