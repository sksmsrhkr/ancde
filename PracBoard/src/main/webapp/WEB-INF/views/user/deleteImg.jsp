<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
	<script>
      function setThumbnail(event) {
    	  
    	 console.log("클릭")
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.getElementById("commfile");
          img.setAttribute("src", event.target.result);
//           document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
	
</body>
</html>