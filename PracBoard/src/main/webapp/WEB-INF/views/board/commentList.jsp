<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>

<h3>신고하기</h3>
		
<h4>신고사유 선택</h4>	

<form action="./commentList" method="post">
<input type="hidden"  name="reportedNo" value="${reportedNo}">
<input type="hidden"  name="boardNo" value="${boardNo}">
<input type="hidden"  name="commentNo" value="${commentNo}">

<input type="radio" name="reasonChoice" value="a"> 욕설, 비방, 차별, 혐오						
<input type="radio" name="reasonChoice" value="b"> 홍보, 영리 목적						
<input type="radio" name="reasonChoice" value="c"> 불법 정보						
<input type="radio" name="reasonChoice" value="d"> 음란, 청소년 유해						
<input type="radio" name="reasonChoice" value="e"> 개인 정보 노출, 유포, 거래						
<input type="radio" name="reasonChoice" value="f"> 도배, 스팸						
<input type="radio" name="reasonChoice" value="g"> 기타	

<button>신고</button>
</form>
		

			

</body>
</html>