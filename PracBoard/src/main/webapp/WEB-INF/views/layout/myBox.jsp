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

	<div id="mybox">
		<div id="profile">
			<c:choose>
			<c:when test="${userfile.userfileStored eq null }">
			<img id="profileImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
			</c:when>
			<c:otherwise>
			<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
			</c:otherwise>
			</c:choose>
		</div>
		<div id="userInfo">
			<b style="font-size: 24px;">${userNick}</b> <a href="/user/profile"><i class="bi bi-pencil-square"></i></a> &nbsp; &nbsp; <a href="/user/userInfo">  내 정보 수정</a><br>
			총 게시물 ${totalCount} 개  &nbsp; |  &nbsp; 총 댓글 ${commCnt} 개<br>
			<span style="font-size: 14px;">가입일 &nbsp; |  &nbsp; <fmt:formatDate value="${joindate }"
 							pattern="yyyy.MM.dd"/></span>
		</div>
	</div>
	

</body>
</html>