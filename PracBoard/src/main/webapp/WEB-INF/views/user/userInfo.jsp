<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/common/js/kakao_postAPI.js"></script>

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

#requiredInfo > input{
	width: 50%;
	border: none;
	outline: none;
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
  	margin-top: 100px;
  	margin-bottom: 20px;
  	padding-top: 20px;
  	padding-bottom: 20px;
  	border-top: 3px solid #B4B4DC;	
	border-bottom: 3px solid #B4B4DC;	
  }
  
  #changeBtn{
  	height: 100%;
  	width: 40%;
  	padding-top:90px;
  	margin-right:10%;
  	display: inline-block;
  	float: right;
  }
  
  table{
  	text-align: left;
  	width: 100%;
  }
  
  td{
  	padding: 7px 10px 7px 0px;
  }
  
  th{
  	padding-left: 50px;
  }
  
  #submitBtn{
  	border: none;
  	border-radius: 5px;
  	background-color: #B4B4DC;
  	color: white;
  	width: 95px;
    height: 30px;
    margin-top: 20px;
  }
  
  #requiredBtn{
  	color: #A696CD;
  	border: 1px solid #B0A0CD	;
  	background-color: white;
  	border-radius: 5px;
  }
  
   #addressBtn{
  	color: #A696CD;
  	border: 1px solid #B0A0CD	; 
  	background-color: white; 
   	border-radius: 5px; 
   	float: right;
   	width: 120px;
   	heigth: 50px;
   	text-align: center;
   	padding: 5px 5px 0px 5px;
   	margin-right: 55px;
  }
</style>

	<script type="text/javascript">
		
	function popup(){
		var url = "/user/pwChange?userNo=" + ${user.userNo};
		var name = "비밀번호 변경";
		var option = "top=100, left=150, width=450, height=300, status=no, menubar=no, toolbar=no, resizable=no";
	
		 window.open(url, name, option);
	
	}
	</script>	


<div id="userform">
	<div id = "requiredInfo">
	<div style="color: #B4B4DC; text-align: center; margin-bottom: 10px;"><b>필수정보</b></div>
	<table>
	<tr>
	<th>이름</th>
	<td>${user.userName}</td>
	</tr>
	<tr>
	<th>이메일</th>
	<td>${user.userEmail}</td>
	</tr>
	<tr>
	<th>휴대폰 번호</th>
	<td>${user.userPhone}</td>
	</tr>
	<tr>
	<th>아이디</th>
	<td>${user.userId}</td>
	</tr>
	<tr>
	<th>생년월일/성별</th>
	<td>
	<fmt:parseDate var="dt" value="${user.userBirth}" pattern="yyyyMMdd" /><fmt:formatDate value="${dt}" pattern="yyyy.MM.dd" /> /
	<c:if test="${user.userGender eq 'F' }">
		 여자
	</c:if>
	<c:if test="${user.userGender eq 'M' }">
		남자
	</c:if>
	</td>
	</tr>
	<tr>
	<th>비밀번호</th>
	<td> <a href = "javascript:popup()"><button type="button" id="requiredBtn">변경하기</button></a></td>
	</tr>
	
	</table>
	</div>
	
	<form action="./userInfo" method="post" id="changeForm">
	<input type="hidden" name="userNo" value="${user.userNo }">
	<hr>
	<b style="color: #B4B4DC;">선택정보</b><br><br>
	<div style="width: 30%; float: left;"><label for="address">주소</label></div>
	
	<div style="width: 70%; display:inline-block; text-align: left; padding-left: 45px;">
	<input id="postCode" name="userPostcode" value="${user.userPostcode }" style="width: 43%; display: inline-block;  margin-bottom: 10px;">
	<div id="addressBtn" onclick="addressBtn()">우편번호 찾기</div><br>
	<input id="userAddr1" name="userAddr1" value="${user.userAddr1 }" style="width: 85%; margin-bottom: 10px;"><br>
	<input id="userAddr2" name="userAddr2" value="${user.userAddr2 }" style="width: 54%; margin-bottom: 10px;">
	<input id="userAddr3" name="userAddr3" value="${user.userAddr3 }" style="width: 30%; margin-bottom: 10px;">
	</div>
	<br>

	<button id="submitBtn" onclick="checkForm(); return false;">정보 수정</button>
	</form>
</div>	


<c:import url="/WEB-INF/views/layout/footer.jsp" />
