<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div style="margin-bottom: 40px;">
				<input type="hidden" id="commNo" value="${boardComment.commentNo}">
				<input style="width:100%; height: 100px; margin-bottom:5px;" value="${boardComment.commContent}" ></input>
				<div style="float:right;">
					비밀 댓글
					<c:if test="${boardComment.chkLock eq 'n'}">					
						<input type="checkbox" id="chkLock">
					</c:if>
					<c:if test="${boardComment.chkLock eq 'y'}">					
						<input type="checkbox" id="chkLock" checked="checked">
					</c:if>
					&nbsp;&nbsp;<button type="button"  id="commentBtn">등록</button></div>
			</div>
</body>
</html>