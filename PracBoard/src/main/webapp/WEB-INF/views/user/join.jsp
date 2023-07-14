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
	text-align:left;
	width:30%;
	font-weight:bold;
	margin-bottom: 20px;
}

#gender {
	display:inline-block;
	text-align:left;
	width:28%;
	font-weight:bold;
	margin-bottom: 20px;
}

#joinform{
	width: 30%;
	margin: auto;
	margin-top: 50px;
}

input{
	width: 50%;
}

form{
	text-align: center;
}

</style>

<div id="joinform" >
<form action="./join" method="post">
	
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

	<label for="birth">생년월일</label>
	<input type="text" id="birth" name="userBirth"><br>
	
	<span id="gender">성별</span>
	<label for="m" style="width: 15%; text-align: right;">남자</label>
	<input type="radio"id="m" name="userGender" value="M" style="width: 10%;">
	<label for="f"  style="width: 15%;text-align: right;" >여자</label>
	<input type="radio" id="f" name="userGender" value="F" style="width: 10%;">
	<br>
	<button>가입하기</button>
</form>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />