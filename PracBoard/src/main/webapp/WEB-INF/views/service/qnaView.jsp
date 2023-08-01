<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${not empty userNo}">
<c:import url="/WEB-INF/views/layout/header.jsp" />
</c:if>
<c:if test="${not empty adminNo}">
<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
</c:if>

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

#answerBox{
	padding: 5px;
	background-color: #f1f3f5;
}

#writeComm{
	background-color: white;	
	margin: 30px; 
	padding: 10px 20px 35px 20px;
}

#commentBtn{
		font-size: 14px;
		border: 2px solid #6E9FED;
		color: white;
		border-radius: 10px;
		text-align: center;
		background-color: #6E9FED;
		float: right;
}
</style>

<script>
function checkForm(){
	
	console.log($("#answerContent").val())
	var commentChk = $("#answerContent").val()
	
	if( commentChk == '' ) {
		alert("문의에 대한 답변을 입력해주세요")
		return;

	} else {
		form.submit();
	}	
}

function deleteComm(){
	console.log(${inquiry.inquiryNo});
	console.log("click")
	var chk = confirm("문의를 삭제하시겠습니까?")
	
	if(chk){
		location.href = "/service/deleteAnswer?inquiryNo=" + ${inquiry.inquiryNo}
	} 
	
}
</script>



<c:if test="${not empty userNo}">
<c:import url="/WEB-INF/views/layout/sidebar.jsp" />
</c:if>
<c:if test="${not empty adminNo}">
<c:import url="/WEB-INF/views/layout/adminsidebar.jsp" />
</c:if>
<div id="inBox">


<c:choose>
<c:when test="${inquiry.userNo eq userNo || not empty adminNo }">
<div id="inquiryBox">

<span>문의 유형 >
<c:choose>
<c:when test="${fn:contains(inquiry.inquiryType, 'u')}">
	회원정보
</c:when>
<c:when test="${fn:contains(inquiry.inquiryType, 'r')}">
	규제
</c:when>
<c:when test="${fn:contains(inquiry.inquiryType, 'b')}">
	블랙리스트
</c:when>
<c:when test="${fn:contains(inquiry.inquiryType, 'e')}">
	기타
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</span>

<br><br>
<h3>${inquiry.inquiryTitle}</h3>
<h6><fmt:formatDate value="${inquiry.inquiryDate}" pattern="yyyy/MM/yy HH:mm:SS"/> </h6>
<hr>

<div style="font-size: 20px; min-height: 150px;">${inquiry.inquiryContent}</div><br>

<hr>

<c:if test="${not empty adminNo && inquiry.answerContent eq null}">
<div id="answerBox">
	<form action="/service/qnaView" method="post">
			
			<div id="writeComm">
				<input type="hidden" value="${inquiry.inquiryNo}" name="inquiryNo">			
				<input type="hidden" value="${inquiry.userNo}" name="userNo">			
				<textarea  name="answerContent" maxlength="{200}" id="answerContent" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"></textarea>
				<button id="commentBtn" onclick="checkForm(); return false;">등록</button>
			</div>
	</form>
</div>
</c:if>

<c:if test="${inquiry.answerContent ne null || inquiry.answerContent != null}">
<div id="answerBox" style="font-size: 18px; padding: 25px;">
	${inquiry.answerContent }
	<c:if test="${not empty adminNo}">
	<div style="float: right; font-size: 18px;"> <span onclick="deleteComm()">삭제</span></div>
	</c:if>
</div>
</c:if>


<br>
</div>
</c:when>

<c:otherwise>
	<div style="width: 50%; min-height: 200px; margin-left: 40%; margin-top: 300px;"><h2>회원님에게는 허용되지 않은 게시글 입니다.</h2></div>
</c:otherwise>

</c:choose>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>