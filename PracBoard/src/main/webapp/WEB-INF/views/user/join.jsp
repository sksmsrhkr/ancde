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
}

p {
	width: 50%;
	margin-left: 40%;
	font-size: 14px;
	color: red;
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

	<script type="text/javascript">
		function checkForm() {
			
			console.log("유효성 검사")
			console.log($("#id").val())
			console.log( document.getElementById("id").value )
			
			
			if( $("#name").val() == ""){
				joinForm.userName.focus();
				$("#msg_name").html("이름을 입력해주세요"); 
				return;
			} else{
				$("#msg_name").html(""); 
			}
			
			if( $("#id").val() == ""){
				joinForm.userId.focus();
				$("#msg_id").html("아이디를 입력해주세요"); 
				return;
			} else{
				$("#msg_id").html(""); 
			}
			
			if( $("#pw").val() == ""){
				joinForm.userPw.focus();
				$("#msg_pw").html("비밀번호를 입력해주세요"); 
				return;
						
			} 
// 			else if ( $("#pw").val() != $("#realPw").val() ){
// 				joinForm.userPw.focus();
// 				$("#msg_pw").html("비밀번호가 일치하지 않습니다"); 
// 				return;	
// 			}
			
			
			if( $("#nick").val() == ""){
				joinForm.userNick.focus();
				$("#msg_nick").html("닉네임을 입력해주세요"); 
				return;
				
			} else{
				$("#msg_nick").html(""); 
			}
			
			
			if( $("#email").val() == ""){
				joinForm.userEmail.focus();
				$("#msg_email").html("이메일 입력해주세요"); 
				return;
				
			} else{
				$("#msg_email").html(""); 
			}
			
			if( $("#phone").val() == ""){
				joinForm.userPhone.focus();
				$("#msg_phone").html("전화번호를 입력해주세요"); 
				return;
				
			} else{
				$("#msg_phone").html(""); 
			}
			
			if( $("#birth").val() == ""){
				joinForm.userBirth.focus();
				$("#msg_birth").html("생년월일을 입력해주세요"); 
				return;
				
			} else{
				$("#msg_birth").html(""); 
			}
			
			
			
			form.submit();
			
		}
	</script>



<div id="joinform" >
<form action="./join" method="post" id="joinForm"> 
	
	<label for="name">이름</label>
	<input type="text"id="name" name="userName">
	<p id="msg_name"></p>
	
	<label for="id">아이디</label>
	 <input type="text" id="id" name="userId">
	<p id="msg_id"></p>
	
	<label for ="pw">비밀 번호</label>
	<input type="text" id="pw" name="userPw">
	<p id="msg_pw"></p>
	
	<label for="pwChk">비밀 번호 확인</label>
	<input type="text" id="pwChk" name="pwChk">
	<p id=""></p>
	
	<label for="nick">닉네임</label>
	<input type="text" id="nick" name="userNick">
	<p id="msg_nick"></p>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="userEmail">
	<p id="msg_email"></p>
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="userPhone">
	<p id="msg_phone"></p>
	
	<label for="birth">생년월일</label>
	<input type="text" id="birth" name="userBirth">
	<p id="msg_birth"></p>
	
	<span id="gender">성별</span>
	<label for="m" style="width: 15%; text-align: right;">남자</label>
	<input type="radio"id="m" name="userGender" value="M" style="width: 10%;">
	<label for="f"  style="width: 15%;text-align: right;" >여자</label>
	<input type="radio" id="f" name="userGender" value="F" style="width: 10%;">
	<br>
	<button onclick="checkForm(); return false;" type="button">가입하기</button>
</form>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />