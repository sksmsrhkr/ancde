<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {      
      
	$("#content").summernote({
         height: 350,
         placeholder: "본문 내용",
         focus: true
      })
      
})

$(function() {
	
	$("#writeContainer").on("click","#writeBtn", function(){
		console.log("click")
		if(confirm('게시글을 저장하시겠습니까?') == true){
			console.log("ok")
		} else{
			return false;
		}

	console.log($("#content").val())
	
})
})
</script>

<style>
	body{
		font-family: 'SBAggroL';
	}
	
	#writeContainer{
		width: 70%;
		margin: auto;
		margin-top: 100px;
	}
	
	#title{
		width: 100%;
		text-align: center;
		height: 50px;
		border : none;
		font-size: 20px;
		margin-bottom: 20px;
	}
	
	#writeBtn{
		width:50px;	
		border: 2px solid #8CBDED;
		background-color: #EBF5FF;	
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float: right;
		margin-right: 5px;
	}
</style>

<div id="writeContainer">
<form action="./write" method="post">
	<input type="text" name="title" id="title" placeholder="제목" required><br>	
	<textarea style="display: none" id="content" name="content"></textarea><br>
	<button type="submit" id="writeBtn">작성</button>
</form>
</div>
</body>
</html>