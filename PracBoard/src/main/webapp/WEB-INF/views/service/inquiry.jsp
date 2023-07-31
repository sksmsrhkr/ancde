<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style>
body{
	font-family : SBAggroL;
}

#inquiryBox{
	width: 50%;
	margin-top: 150px;
	margin-left: 32%;
/* 	text-align: center; */
}
</style>

<c:import url="/WEB-INF/views/layout/sidebar.jsp" />
<div id="inBox">

<div id="inquiryBox">
<form action="./inquiry" method="post">

<select>
	<option>문의유형</option>
	<option>회원정보</option>
	<option>규제</option>
	<option>블랙리스트</option>
</select>
<hr>
<br>
내용<br>
<textarea style="width: 100%; height: 150px;"></textarea><br>
<button>확인</button>
</form>

<br>
<span>- 1:1문의 처리 내역은 마이페이지>1:1 문의를 통해 확인하실 수 있습니다.</span>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>