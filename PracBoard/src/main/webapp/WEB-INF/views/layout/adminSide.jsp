<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />

<style>
body{
	font-family: 'SBAggroL';
	heigth: 100%;
	background-color: #FAFAD2;
}

#adminSlider{
	width: 15%;
	height: 1000px;
 	background-color: white; 
	padding: 50px 0px 0px 60px;
	
}

#adminSlider> h2{
	color: #8AB78A;
	font-weight: bold;
}

#adminSlider> p{
	font-size: 20px;
}
</style>

<div id="adminSlider">

<h2>회원 관리</h2>
<p>회원 정보 수정</p>
<p>블랙 리스트 관리</p>
<br>
<h2>신고 관리</h2>
<p>글 신고 내역</p>
<p><a href="./regulateComm">댓글 신고 내역</a></p>
<br>
<h2>고객 센터</h2>
<p>문의 내역</p>
<br>
<h2>공지 사항</h2>
<p>작성 내역</p>


</div>

