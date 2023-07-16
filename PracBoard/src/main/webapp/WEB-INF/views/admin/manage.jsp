<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family: 'SBAggroL';
	heigth: 100%;
}

#adminSlider{
	width: 20%;
	height: 1000px;
	background-color: #E1F6FA;
	padding-top: 50px;
	padding-left: 50px;
	
}
</style>

<div id="adminSlider">

<h3>회원 관리</h3>
<p>회원 정보 수정</p>
<p>블랙 리스트 관리</p>
<br>
<h3>신고 관리</h3>
<p>글 신고 내역</p>
<p>댓글 신고 내역</p>


</div>

</body>
</html>