<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경창</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/resources/common/css/font.css" rel="stylesheet">

</head>
<style>
body{font-family: 'SBAggroL'}
	
label {
	display:inline-block;
	text-align:left;
	width:30%;
	font-weight:bold;
}

form{
	text-align: center;
}

button{
	border: none;
  	border-radius: 5px;
  	background-color: #B4B4DC;
  	color: white;
  	width: 95px;
    height: 30px;
    margin-top: 20px;
    font-size: 18px;
    font-family: 'SBAggroL';
}

input{
	height: 18px;
}

p {
	width: 50%;
	margin-left: 40%;
	font-size: 14px;
	color: red;
}
</style>

<script type="text/javascript">

window.onload = function() {
	
	document.getElementById("pw").focus();
	
	var input = document.getElementById("pw");

	input.addEventListener("keyup", function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
			document.getElementById("checkBtn").click();
		}
	});
}

function checkForm() {
	
	console.log("유효성 검사")
	console.log($("#newPw").val())
	
	
	if( $("#pw").val() == ""){
		changeForm.originPw.focus();
		$("#msg_pw").html("비밀번호를 입력해주세요"); 
		return;
				
	} else if ( $("#pw").val() != $("#realPw").val() ){
		changeForm.originPw.focus();
		$("#msg_pw").html("비밀번호가 일치하지 않습니다"); 
		return;	
	} else {
		$("#msg_pw").html(""); 
	}
	
	
	
	if( $("#newPw").val() == ""){
		changeForm.newPw.focus();
		$("#msg_newpw").html("새비밀번호를 입력해주세요"); 
		return;
	} else{
		$("#msg_newpw").html(""); 
	}
	
	
	
	if( $("#newPwChk").val() == ""){
		changeForm.newPwChk.focus();
		$("#msg_chkpw").html("새비밀번호를 확인해주세요"); 
		return;
		
	} else if( $("#newPw").val() != $("#newPwChk").val() ){
		changeForm.newPwChk.focus();
		$("#msg_chkpw").html("비밀번호가 일치하지 않습니다"); 
		return;	
	}	else{
		$("#msg_chkpw").html(""); 
	}

	form.submit();
	alert("비밀번호가 변경되었습니다");
	
}


</script>

<body>

<div style="width: 550px; padding-top: 100px; font-size: 18px;">
<form action="/user/pwChange" method="post" id="changeForm">

<input type="hidden" value="${user.userNo}" name="userNo">
<input type="hidden" value="${user.userPw}" id="realPw">
	<label for ="pw">현재 비밀 번호</label>
	<input type="password" id="pw" name="originPw">
	<p id="msg_pw"></p>

	<label for ="newPw">새 비밀 번호</label>
	<input type="password" id="newPw" name="userPw">
	<p id="msg_newpw"></p>

	<label for="newPwChk">비밀 번호 확인</label>
	<input type="password" id="newPwChk">
	<p id="msg_chkpw"></p>
	
	<button id="checkBtn" onclick="checkForm(); return false;">변경</button>
</form>
</div>

</body>
</html>