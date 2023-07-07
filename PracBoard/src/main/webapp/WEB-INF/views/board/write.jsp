<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
	body{
		font-family: 'SBAggroL';
	}
</style>

<form action="./write" method="post">
	제목<input type="text" name="title"><br>	
	내용<textarea rows="" cols="" name="content"></textarea><br>
	<button type="submit">작성</button>
</form>

</body>
</html>