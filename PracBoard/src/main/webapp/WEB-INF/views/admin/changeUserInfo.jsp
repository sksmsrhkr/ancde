<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

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

#userform{
	width: 30%;
	margin: auto;
}

input{
	width: 50%;
	margin-bottom: 15px;
	border: none;
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
   	margin-top: 25px;  
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
  
  #delImg{
  display: inline-block;
  padding-top: 20px;
   width: 20px;
   position: absolute;
  }
  
  #realImgBox{
  	width: 100%;
  	height: 100%;
  	text-align : center;
  	position: relative;
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
</style>

<script type="text/javascript">

function nameChange(){
	console.log("클릭")
	  document.getElementById("name").readOnly=false; 
	document.getElementById("name").focus(); 
}
function emailChange(){
	console.log("클릭")
	  document.getElementById("email").readOnly=false; 
	document.getElementById("email").focus(); 
}
function phoneChange(){
	console.log("클릭")
	  document.getElementById("phone").readOnly=false; 
	document.getElementById("phone").focus(); 
}
function idChange(){
	console.log("클릭")
	  document.getElementById("id").readOnly=false; 
	document.getElementById("id").focus(); 
}
function birthChange(){
	console.log("클릭")
	  document.getElementById("birth").readOnly=false; 
	document.getElementById("birth").focus(); 
}
function genderChange(){
	console.log("클릭")
	var gender =  document.getElementById("gender").value;
	console.log(gender);
	if(gender === 'F'){
		console.log("여자")
		document.getElementById("gender").value = 'M';
	} else if(gender === 'M' ){
		console.log("남자")
		document.getElementById("gender").value = 'F';
		
	}
	document.getElementById("gender").readOnly=false; 
	document.getElementById("gender").focus(); 
}

</script>

<form action="./changeUserInfo" method="post" enctype="multipart/form-data" id="changeForm">
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
					<span id="delImg"><span onclick="deleteImg()" data-commNo="${userfile.userfileNo}" ><i class="bi bi-x-circle-fill" ></i></span></span>
					</div>
				</c:otherwise>
			</c:choose>
	</div>	
	</div>
	
	<br><br><br>
	
	
<div id="userform">
	<input type="hidden" name="userNo" value="${user.userNo }">
	필수정보<br><br>
	<label for="name">이름</label>
	<input type="text"id="name" name="userName" value="${user.userName }" readonly>
	<button type="button" onclick="nameChange()">수정</button>
	
	<label for="email">이메일</label>
	<input type="text" id="email" name="userEmail" value="${user.userEmail }" readonly>
	<button type="button" onclick="emailChange()">수정</button>
	
	<label for="phone">휴대폰 번호</label>
	<input type="text" id="phone" name="userPhone" value="${user.userPhone }" readonly>
	<button type="button" onclick="phoneChange()">수정</button>
	
	<label for="id">아이디</label>
	<input type="text" id="id" name="userId" value="${user.userId }" readonly>
	<button type="button" onclick="idChange()">수정</button>
	
	<label style="margin-left: 0px;"><b>성별</b></label> 
	<input type="text" id="gender" name="userGender" value="${user.userGender }" readonly>
	<button type="button" onclick="genderChange()">수정</button>
	
	<br>
	<button style="border: 3px solid #B4B4DC;" id="submitBtn" onclick="checkForm(); return false;">정보 수정</button>
</div>

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
							'userNo' : ${user.userNo}},
					
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