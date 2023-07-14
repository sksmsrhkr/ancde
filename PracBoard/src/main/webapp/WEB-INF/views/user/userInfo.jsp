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
  	margin-left: 50px;
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
</style>

<form action="./userInfo" method="post" enctype="multipart/form-data">
	
	<div id="profileBox">
			<c:choose>
				<c:when test="${userfile.userfileStored eq null }">
					<img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				</c:when>
				<c:otherwise>
					<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
				</c:otherwise>
			</c:choose>
		<label for="file" style="font-size: 15px; margin-top: 90px;" >사진 변경</label>
		<input type="file" name="file" id="file" accept="image/*" style="display: none;" onchange="setThumbnail(event);">
	</div>	
	
	<br><br><br>
	
	
<div id="userform">
	<input type="hidden" name="userNo" value="${user.userNo }">
	필수정보<br><br>
	<label for="name">이름</label>
	<input type="text"id="name" name="userName" value="${user.userName }"><br>
	
	<label for ="pw">현재 비밀 번호</label>
	<input type="text" id="pw" ><br>

	<label for ="pw">새 비밀 번호</label>
	<input type="text" id="pw"><br>
	
	<label for="pwChk">비밀 번호 확인</label>
	<input type="text" id="pwChk"><br>
	
	<label for="nick">닉네임</label>
	<input type="text" id="nick" name="userNick" value="${user.userNick }"><br>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="userEmail" value="${user.userEmail }"><br>
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="userPhone" value="${user.userPhone }"><br>
	
	<label for="id">아이디</label>
	<input type="text" id="id" name="userId" value="${user.userId }" style="border:none; outline: none;" readonly><br>
	
	<label><b>생년월일/성별</b></label> 
	<span>
	<fmt:parseDate var="dt" value="${user.userBirth}" pattern="yyyyMMdd" /> 
	<input value="<fmt:formatDate value="${dt}" pattern="yyyy.MM.dd" />" style="width: 20%; border:none; outline: none;" readonly>
	/
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
	<button style="border: 3px solid #B4B4DC;">정보 수정</button>
</form>

    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.getElementById("profileImg");
          img.setAttribute("src", event.target.result);
//           document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
