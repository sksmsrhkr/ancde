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
/*  	margin-bottom: 20px;  */
}

#userform{
	width: 30%;
	margin: auto;
}

#gender {
	float:left;
	margin-left: 40px;
	margin-right: -80px;
	font-weight:bold;
	padding-bottom: 20px;
}

input{
	width: 50%;
}

p {
	width: 50%;
	margin-left: 40%;
	font-size: 14px;
	color: red;
}

form{
	text-align: center;
}

  #profile {
  	text-align: center;
  	padding-top: 20px;
  	height: 200px;
  	width: 50%
  }

  #profileImg{
	text-align: center;
  	width: 150px;
  	height: 150px;
  	float: left;
   	margin-left: 50px; 
   	margin-top: 20px; 
   	margin-right: 50px; 
  	border-radius: 100%;
  	object-fit: cover;
  }
  
  #imgBtn{
   width: 50%;
   height: 200px;
  }
  
  #userform{
  	margin-top: -70px;
  	margin-bottom: 20px;
  	padding-top: 20px;
  	padding-bottom: 20px;
  	border-top: 3px solid #B4B4DC;	
	border-bottom: 3px solid #B4B4DC;	
  }
  
  #profileBox{
/*   	display: inline-block; */
   	text-align: center;
  	height: 200px;
  	width: 30%;
  	margin: auto;
  	margin-bottom: 10px;
  	margin-top: 50px;
  }
  
  #address{
   margin-bottom: 10px;
  }
  
  #delImg{
  display: block;
  padding-top: 5px;
  margin-bottom: 5px;
  padding-top: 10%;
   padding-left: 70%;
   width: 20px;
   position: absolute;
  }
  
  #realImgBox{
  	width: 50%;
  	float: left;
  	height: 100%;
  	position: relative;
  }
  
  #changeBtn{
  	height: 100%;
  	width: 40%;
  	padding-top:90px;
  	margin-right:10%;
  	display: inline-block;
  	float: right;
  }
</style>

	<script type="text/javascript">
	
		function checkForm() {
			
			console.log("유효성 검사")
			console.log($("#id").val())
			console.log( document.getElementById("id").value )
			console.log( changeForm.userId.value )
			console.log($("#newPw").val())
			
			
			if( $("#name").val() == ""){
				changeForm.userName.focus();
				$("#msg_name").html("이름을를 입력해주세요"); 
				return;
			} else{
				$("#msg_name").html(""); 
			}
			
			
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
			
			
			
			if( $("#nick").val() == ""){
				changeForm.userNick.focus();
				$("#msg_nick").html("닉네임을 입력해주세요"); 
				return;
			} else{
				$("#msg_nick").html(""); 
			}
			
			
			if( $("#email").val() == ""){
				changeForm.userEmail.focus();
				$("#msg_email").html("이메일 입력해주세요"); 
				return;
			} else{
				$("#msg_email").html(""); 
			}
			
			if( $("#phone").val() == ""){
				changeForm.userPhone.focus();
				$("#msg_phone").html("전화번호를 입력해주세요"); 
				return;
			} else{
				$("#msg_phone").html(""); 
			}
			
			
			
			form.submit();
			
		}
	</script>

<form action="./userInfo" method="post" enctype="multipart/form-data" id="changeForm">
	<div>
	<div id="profileBox">
			<c:choose>
				<c:when test="${userfile.userfileStored eq null }">
				<div id="realImgBox">
					<img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				</div>
				</c:when>
				<c:otherwise>
					<div id="realImgBox">
					<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
					<div id="delImg"><span onclick="deleteImg()" data-commNo="${userfile.userfileNo}" ><i class="bi bi-x-circle-fill" ></i></span></div>
					</div>
				</c:otherwise>
			</c:choose>
		<div id="changeBtn"><label for="file" style="font-size: 15px;" >사진 변경</label></div>
		<input type="file" name="file" id="file" accept="image/*" style="display: none;" onchange="setThumbnail(event);">
	</div>	
	</div>
	
	<br><br><br>
	
	
<div id="userform">
	<input type="hidden" name="userNo" value="${user.userNo }">
	필수정보<br><br>
	<label for="name">이름</label>
	<input type="text"id="name" name="userName" value="${user.userName }">
	<p id="msg_name"></p>
	
	<input type="hidden" value="${user.userPw}" id="realPw">
	<label for ="pw">현재 비밀 번호</label>
	<input type="text" id="pw" name="originPw">
	<p id="msg_pw"></p>

	<label for ="newPw">새 비밀 번호</label>
	<input type="text" id="newPw" name="userPw">
	<p id="msg_newpw"></p>
	
	<label for="pwChk">비밀 번호 확인</label>
	<input type="text" id="newPwChk">
	<p id="msg_chkpw"></p>
	
	<label for="nick">닉네임</label>
	<input type="text" id="nick" name="userNick" value="${user.userNick }">
	<p id="msg_nick"></p>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="userEmail" value="${user.userEmail }">
	<p id="msg_email"></p>
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="userPhone" value="${user.userPhone }">
	<p id="msg_phone"></p>
	
	<label for="id">아이디</label>
	<input type="text" id="id" name="userId" value="${user.userId }" style="border:none; outline: none;" readonly><br>
	
	<label><b>생년월일/성별</b></label> 
	<span>
	<fmt:parseDate var="dt" value="${user.userBirth}" pattern="yyyyMMdd" /> 
	<input value="<fmt:formatDate value="${dt}" pattern="yyyy.MM.dd" />" style="width: 21%; border:none; outline: none;" readonly>
	/ &nbsp;
	<c:if test="${user.userGender eq 'F' }">
		 <input value="여자" style="width: 25%; border:none; outline: none;" readonly>
	</c:if>
	<c:if test="${user.userGender eq 'M' }">
		 &nbsp; <input value="남자" style="width: 25%; border:none; outline: none;" readonly>
	</c:if>
	</span>
	<hr>
	선택정보<br><br>
	<div style="width: 30%; float: left;"><label for="address">주소</label></div>
	
	<div style="width: 70%; display:inline-block; text-align: left; padding-left: 45px;">
	<input id="address" name="userPostcode" value="${user.userPostcode }" style="width: 45%; margin-right: 15px;"><button>우편번호 찾기</button><br>
	<input id="address" name="userAddr1" value="${user.userAddr1 }" style="width: 85%"><br>
	<input id="address" name="userAddr2" value="${user.userAddr2 }" style="width: 54%">
	<input id="address" name="userAddr3" value="${user.userAddr3 }" style="width: 30%">
	</div>
	
</div>
	<button style="border: 3px solid #B4B4DC;" id="submitBtn" onclick="checkForm(); return false;">정보 수정</button>
</form>

    <script>
      function setThumbnail(event) {
        console.log("프로필 추가입니당")
        var reader = new FileReader();
        reader.onload = function(event) {
          var img = document.getElementById("profileImg");
          img.setAttribute("src", event.target.result);
//           document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
      </script> 
      
	<script type="text/javascript">
	      function deleteImg() {
			console.log("프로필 삭제입니당")
			console.log(${userfile.userfileNo})
			
			if(confirm('이미지를 삭제하시겠습니까?') == true){
				console.log("ok")
					
				$.ajax({
					type : 'post',
					url : '/user/deleteImg',
					dataType : 'html',
					data : {'userfileNo' : ${userfile.userfileNo}, 
							'userNo' : ${userNo}},
					
							success : function(data) {
								console.log("성공");
								console.log(data);
								$("#profileBox").html(data)
							}
							,error: function (request, status, error) {
						        console.log("error");
						    }	
				})
					
			} else{
				return;
			}
			
			
			
		}
	  
	</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
