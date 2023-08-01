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

<script type="text/javascript">
function checkForm(){
	console.log($("#selectOption").val())
	
	var option = $("#selectOption").val();
	var title = $("#inquiryTitle").val();
	var content = $("#inquiryContent").val();
	
	if( option == 'n' ) {
		alert("문의유형을 선택해주세요")
		return;

	} else if ( title === null || title === undefined || title === '' ) {
		alert("제목을 입력해주세요")	
		return;
		
	}  else if ( content === null || content === undefined || content === '' ) {
		alert("내용을 입력해주세요")	
		return;
		
	} else {
		
		var result = confirm("문의를 제출하시겠습니까?");
		console.log(result)
		
		if(result) {
			alert("제출이 완료되었습니다.");
			form.submit();
		} else {
			return;			
		}

	}
}
</script>

<c:import url="/WEB-INF/views/layout/sidebar.jsp" />
<div id="inBox">

<div id="inquiryBox">
<form action="./inquiry" method="post">
<select id="selectOption" name="inquiryType">
	<option value="n">문의유형</option>
	<option value="u">회원정보</option>
	<option value="r">규제</option>
	<option value="b">블랙리스트</option>
	<option value="e">기타</option>
</select>
<hr>

<span>제목</span><br>
<input type="text" style="width: 50%;" name="inquiryTitle" id="inquiryTitle" required><br><br>
<span>내용</span><br>
<textarea style="width: 100%; height: 150px;" name="inquiryContent" id="inquiryContent" required></textarea><br>
<button onclick="checkForm(); return false;">확인</button>
</form>

<br>
<span>- 1:1문의 처리 내역은 마이페이지 > 1:1 문의를 통해 확인하실 수 있습니다.</span>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>