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

  #submitBtn{
  	border: none;
  	border-radius: 5px;
  	background-color: #B4B4DC;
  	color: white;
  	width: 95px;
    height: 30px;
    margin-top: 20px;
  }

#userform{
	width: 30%;
	margin: auto;
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
	
		function checkForm() {			
			
			if( $("#nick").val() == ""){
				changeForm.userNick.focus();
				$("#msg_nick").html("닉네임을 입력해주세요"); 
				return;
			} else{
				$("#msg_nick").html(""); 
			}
			
			
			form.submit();
			
		}
	</script>

<form action="./profile" method="post" enctype="multipart/form-data" id="changeForm">
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
	<br>
	<label for="nick">닉네임</label>
	<input type="text" id="nick" name="userNick" value="${user.userNick }">
	<p id="msg_nick"></p>

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
