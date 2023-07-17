<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family : SBAggroL;
}

#popboard{
	margin: 3% 10% 0% 20%;
	width: 40%;
	height: 500px;
}

#newboard{
	margin: 5% 10% 5% 20%;
	width: 40%;
	height: 500px;
}

table{
	width: 100%;
}

th{
	background-color: #8FBC8F;
}
	
 th, td {
   border-bottom: 1px solid #bebebe;
   text-align: center;
   padding: 5px;
   font-family: 'SBAggroL'
 }

</style>

<div>

<c:import url="/WEB-INF/views/layout/sidebar.jsp" />


<div id="popboard">
	<h5>인기글</h5>
	<table>
	<thead>
	<tr>
	<th>제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>작성일</th>
	</tr>
	</thead>
	
<c:forEach items="${popBoard}" var="poplist">	
	<tr>
	<td>${poplist.TITLE }	
	<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
		<fmt:parseNumber value="${poplist.WRITE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
		<c:if test="${today - boardDate le 2}">
		<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
		</c:if>
	</td>
	<td>${poplist.USER_NICK }</td>
	<td>${poplist.HIT }</td>
	<td>
	<fmt:formatDate value="${poplist.WRITE_DATE }"
 							pattern="yy/MM/dd" /> 
	</tr>
</c:forEach>	
</table>
</div>

<div id="newboard">
	<h5>최신글</h5>
	<table>
	<thead>
	<tr>
	<th>제목</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>작성일</th>
	</tr>
	</thead>
	
<c:forEach items="${newBoard}" var="newlist">	
	<tr>
	<td>${newlist.TITLE }	
	<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
		<fmt:parseNumber value="${newlist.WRITE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
		<c:if test="${today - boardDate le 2}">
		<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
		</c:if>
	</td>
	<td>${newlist.USER_NICK }</td>
	<td>${newlist.HIT }</td>
	<td>
	<fmt:formatDate value="${newlist.WRITE_DATE }"
 							pattern="yy/MM/dd HH:mm" /> 
	</tr>
</c:forEach>	
</table>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>
