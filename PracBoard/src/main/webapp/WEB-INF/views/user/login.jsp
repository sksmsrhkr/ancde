<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
.box1{
	width: 40%;
	margin: auto;
	font-family: 'SBAggroL';
	padding: 50px;
	text-align: center;
	border: 2px solid #8CBDED;
	margin-top: 200px;
	
}

i{
	font-size:20px;
	vertical-align: sub;
	margin-right: 10px;
}
#id, #pw {
	width: 30px;
 	float: left; 
}

#userId, #userPw{
	margin-bottom: 10px;
	border: 2px solid #B4E5FF;
	border-radius: 10px; 
}

#subBtn {
	margin-top: 20px;
	text-align: center;
	border: 1px solid #8CBDED;
	background-color: #8CBDED;
	color: white;
}

#title {
	width: 40%;
	margin-bottom: 50px;
	margin: auto;
	font-family: 'SBAggroM';	
	text-align: center;
	font-size: 24px;
}

</style>

<body>

<form action="./login" method="post">
	<div class="box1">
	<span id="title">음하하</span><br><br>
	<span><i class="bi bi-file-person"></i><input type="text" name="userId" id="userId" placeholder="아이디"></span><br>
	<span><i class="bi bi-file-lock2"></i><input type="password" name="userPw" id="userPw" placeholder="비밀번호"></span><br>
	<button id="subBtn">로그인</button>
	</div>

</form>

</body>
</html>