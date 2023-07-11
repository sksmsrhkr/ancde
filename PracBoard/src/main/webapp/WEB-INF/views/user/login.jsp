<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
.box1{
	width: 40%;
	margin: auto;
	margin-top: 200px;
	border: none;
	font-family: 'SBAggroL';
	padding: 50px;
	text-align: center;
}

#id, #pw {
	width: 30px;
 	float: left; 
}

#userId, #userPw{

}
</style>

<body>


<form action="./login" method="post">
	<div class="box1">
	<div id="id">id </div><input type="text" name="userId" style="margin-bottom: 10px;" ><br>
	<div id="pw">pw </div><input type="password" name="userPw" id="userPw" style="margin-bottom: 10px;"><br>
	<button>로그인</button>
	</div>

</form>

</body>
</html>