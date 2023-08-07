<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family : SBAggroL;
}

#box{
	margin: auto;
	margin-top: 50px;
	text-align: center;
}
</style>

<div>
<c:import url="/WEB-INF/views/layout/sidebar.jsp" />


<div id="box">
<h1>문의 게시판</h1>
<a href="./inquiry" style="color: black;">1:1 문의</a>
</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>