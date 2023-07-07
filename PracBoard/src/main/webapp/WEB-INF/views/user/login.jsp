<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
.box1{
	width: 70%;
	margin: auto;
	margin-top: 50px;
	border: 1px solid black;
	font-family: 'SBAggroL';
	padding: 50px;
	text-align: center;
}
</style>

<body>


<form action="./login" method="post">
	<div class="box1">
	id <input type="text" name="userId"><br>
	pw <input type="text" name="userPw"><br>
	<button>로그인</button>
	</div>

</form>

</body>
</html>