<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음하하</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">


<link href="/resources/common/css/font.css" rel="stylesheet">
</head>
<style>

#header{
	width: 100%;
	font-family : SBAggroL;
	background-color: #8AB78A;
	text-align: right;
	font-size: 24px;
	height: 50px;
	
}

#adminhead> a{
	color: white;
	text-decoration: none;
	font-weight: bold;
	padding: 20px;
}
</style>
<body>

<div id="header">
<div id= "adminhead">
<a href="/admin/main"><i class="bi bi-house-door"></i></a>
	<c:if test="${adminLogin eq false}">
		<a href="/admin/login">로그인</a>	
		<a href="/board/list">자유 게시판</a>
	</c:if>
	<c:if test="${adminLogin eq true}">
		<a href="/board/list">로그아웃</a>
	</c:if>
</div>

</div>