<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>

body{
	font-family: 'SBAggroL';
}

label {
	display:inline-block;
	text-align:center;
	width:200px;
	font-weight:bold;
}
</style>

<form action="./userInfo" method="post">
	
	<label for="name">이름</label>
	<input type="text"id="name" name="userName"><br>
	
	<label for="id">아이디</label>
	 <input type="text" id="id" name="userId"><br>
	
	<label for ="pw">비밀 번호</label>
	<input type="text" id="pw" name="userPw"><br>
	
	<label for="pwChk">비밀 번호 확인</label>
	<input type="text" id="pwChk" name="pwChk"><br>
	
	<label for="nick">닉네임</label>
	<input type="text" id="nick" name="userNick"><br>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="userEmail"><br>
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="userPhone"><br>
	
	<label for="m">남자</label>
	<input type="radio"id="m" name="userGender" value="M">
	<label for="f">여자</label>
	<input type="radio" id="f" name="userGender" value="F">
	
	<button>가입하기</button>
</form>

</body>
</html>