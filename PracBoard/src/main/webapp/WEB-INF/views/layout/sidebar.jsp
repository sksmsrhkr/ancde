<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<style>

body{
	font-family: 'SBAggroL';
	heigth: 100%;

}

#slider{
	margin-top: -60px;
	width: 18%;
	height: 1250px;
	background-color: #E0EBFF;
	padding-top: 50px;
	padding-left: 50px;
	padding-right: 50px;
	float: left;	
}

  #sideImg{
	text-align: center;
  	width: 180px;
  	height: 180px;
/*   	margin-left: 50px; */
/*   	margin-right: 50px; */
  	border-radius: 100%; 
  	object-fit: cover;
  }
  
  #side{
  	text-align: center;

  }

  #side2{
  	text-align: center;  	
  	margin-top: 50px;
  }
</style>

<div id="slider">
	<div id="side">
	<c:choose>
	<c:when test="${userfile.userfileStored eq null }">
	<img id="sideImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
	</c:when>
	<c:otherwise>
	<img id="sideImg" src="/upload/${userfile.userfileStored }"  alt="">
	</c:otherwise>
	</c:choose>
	<br><br>
	<b style="font-size: 24px; text-align: center;">${userNick} &nbsp; 님</b><br>
	<span style="font-size: 15px;"><a href="/user/logout">로그아웃</a></span>
	</div>	

	<div id="side2">
	<h4><a href="/" style="color: black;">홈</a></h4>
	<h4><a href="/mypage/myboardList" style="color: black;">마이 페이지</a></h4>
	<h4><a href="/board/list" style="color: black;">자유 게시판</a></h4>
	
	</div>

	
	
	



</div>