<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family: 'SBAggroL';
}

#mybox{
	width: 80%;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 3px solid #B4B4DC;	
	height: 150px;
}

#mybox2{
	width: 80%;
	margin: auto;
	margin-top: 60px;
	border-top: 3px solid #B4B4DC;	
	border-bottom: 3px solid #B4B4DC;	
}
table {
  width: 100%;
  padding-left: 30px;
  padding-right: 30px;
  border-spacing: 10px;
}
  th, td {
    border-bottom: 1px solid #bebebe;
    text-align: center;
    padding: 10px;
    font-family: 'SBAggroL'
  }
  
   a{
  	text-decoration-line: none;
  	color: black;
  }
  
  #profile, #userInfo{
  	float:left;
  	padding-top: 20px;
  	height: 150px;
  }
  
  #profileImg{
  	max-width: 100px;
  	margin-left: 50px;
  	margin-right: 50px;
  }
</style>


	<div id="mybox">
		<div id="profile">
			<img id="profileImg" src="/upload/${userfile.userfileStored }"  alt="">
		</div>
		<div id="userInfo">
		${userNick}<br>
		<a href="./userInfo">내 정보 수정</a><br>
		총 게시물 ${totalCount} 개<br>
		</div>
	</div>
	
	<div id="mybox2">
	<table>
	<thead>
		<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회</th>
		</tr>
	</thead>
	<c:forEach items="${board}" var="boardlist">
	<tr>
	<td>${boardlist.BOARD_NO }</td>
	
	<td style="text-align:left;"><a href="/board/view?boardNo=${boardlist.BOARD_NO}">${boardlist.TITLE }</a>
		<c:if test="${boardlist.COMMENTCNT ne 0}">
		&nbsp;<span style="color:#EB3232">[${boardlist.COMMENTCNT}]</span>
		</c:if>		
		<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
		<fmt:parseNumber value="${boardlist.WRITE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
		<c:if test="${today - boardDate le 2}">
		<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
		</c:if></td>
	<td><fmt:formatDate value="${boardlist.WRITE_DATE }"
 							pattern="yy/MM/dd HH:mm"/>
	<td>${boardlist.HIT }</td>
	</tr>
	</c:forEach>
	</table>	
</div>
<c:import url="/WEB-INF/views/layout/paging.jsp" />

<c:import url="/WEB-INF/views/layout/footer.jsp" />