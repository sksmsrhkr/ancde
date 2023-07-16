<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음하하 관리자</title>

<link href="/resources/common/css/font.css" rel="stylesheet">
</head>
<style>
body{
	font-family: 'SBAggroL';
}

label {
	display:inline-block;
	text-align:left;
	width:20%;
	font-weight:bold;
	margin-bottom: 20px;
}

#loginBox{
	width:30%;
	margin: auto;
	margin-top: 20%;
	text-align: center;
}

#loginBtn{
	font-family: 'SBAggroL';
	background-color: #A0D1F7;
	color: white;
	border: none;
	padding: 7px;
	font-size: 15px;
}

</style>

<body>

<div id="loginBox">
<form action="./login" method="post">
	<label for="id">아이디</label>
	<input type="text" id="id" name="adminId"><br>
	
	<label for="pw">비밀번호</label>
	<input type="password" id="pw" name="adminPw"><br>
	
	<button id="loginBtn">로그인</button>
</form>
</div>

</body>
</html>