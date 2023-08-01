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
	width: 300px;
	height: 1250px;
/*  	background-color: #8AB78A;  */
	padding-top: 120px;
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


 a{
  	color: white;
  	text-decoration: none;
  }
  
 a:hover {
 	color:black;
 }
 
  #side2{
  	text-align: center;  	
  	margin-top: 50px;
  }
</style>

<div id="slider">
	<div id="side">
	<c:if test="${not empty userNo  }">
	<c:choose>
	<c:when test="${userfile.userfileStored eq null }">
	<a href="/mypage/myboardList"><img id="sideImg" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></a>
	</c:when>
	<c:otherwise>
	<a href="/mypage/myboardList"><img id="sideImg" src="/upload/${userfile.userfileStored }"  alt=""></a>
	</c:otherwise>
	</c:choose>
	<br><br>
	<b style="font-size: 24px; text-align: center; color: black;"><a href="/mypage/myboardList" style="color: black;">${userNick}</a> &nbsp; 님<br>환영합니다!</b><br>
	</c:if>
	</div>	
	<div id="side2">
		<h4><a href="/board/list" style="color: #506EA5;" >자유 게시판</a></h4>
		<h4><a href="/service/faq" style="color: #506EA5;" >고객 센터</a></h4>
	</div>

	
	
	



</div>