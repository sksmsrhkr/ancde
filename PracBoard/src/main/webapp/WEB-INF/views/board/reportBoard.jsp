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
<link href="/resources/common/css/font.css" rel="stylesheet">
</head>

<style>
body {
	font-family : SBAggroL;
	background-color: #f1f3f5;
}

button {
	font-family : SBAggroL;
	font-size: 20px;
	padding : 10px 60px;
	margin-right: 20px;
	margin-left: 20px;
	border: #f1f3f5;
}

#reasonBox{
	padding: 5%;
	width: 80%;
	margin: auto;
	margin-top: 0%;
	background-color: white;
}

hr{
	 background: #f1f3f5;
	 height: 1px;
	 border: 0;
	 margin-bottom: 10px;
}

#btnBox{
	text-align: center;
	margin-top: 20px;
}

</style>

<script type="text/javascript">

function handler() {
	
	var reasonChk = $('input[name=reasonChoice]:checked').val();
	console.log(reasonChk)
	
	if(reasonChk == "" ||reasonChk == null ){
		alert("이유를 선택해주세요")
		return false;
	}
}
</script>
<body>


<div id="regulateBox">
<form action="./reportBoard" method="post" id="form">
<input type="hidden"  name="boardNo" value="${boardNo}">

<div id="reasonBox" style="font-size: 20px;">

<h2 style="text-align: center;">신고하기</h2><hr>
		
<h4>신고사유 선택</h4><hr>	

<input type="radio" name="reasonChoice" value="a" > 욕설, 비방, 차별, 혐오 <hr>		
<input type="radio" name="reasonChoice" value="b"> 홍보, 영리 목적	<hr>					
<input type="radio" name="reasonChoice" value="c"> 불법 정보	<hr>					
<input type="radio" name="reasonChoice" value="d"> 음란, 청소년 유해	 <hr>					
<input type="radio" name="reasonChoice" value="e"> 개인 정보 노출, 유포, 거래	<hr>					
<input type="radio" name="reasonChoice" value="f"> 도배, 스팸	<hr>					
<input type="radio" name="reasonChoice" value="g"> 기타
</div>

<div id="btnBox">
<button type="button" id="reBtn" onClick="self.close();" style="background-color: white;">취소</button>
<button id="reBtn" onclick="return handler()" style="background-color: #1E3269; color: white;">확인</button>
</div>
</form>
</div>

<div style="width: 80%;margin: auto; margin-top: 25px; text-align: center;">
※ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니<br> 유의하시어 신중하게 신고해 주세요.		
</div>
			

</body>
</html>