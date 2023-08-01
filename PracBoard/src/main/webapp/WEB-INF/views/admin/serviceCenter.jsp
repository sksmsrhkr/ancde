<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/layout/adminHeader.jsp" />
<style>

	body{
		font-family: 'SBAggroL';
		heigth: 100%;
	}
	
	#adminSlider{
		float: left;
		width: 15%;
		height: 1000px;
	 	background-color: white; 
		padding: 50px 0px 0px 60px;
	}
	
	#adminSlider> h2{
		color: #8AB78A;
		font-weight: bold;
	}
	
	#adminSlider> p{
		font-size: 20px;
	}

  table {   
	width: 100%;  
	margin-top: 10px; 
    border-top: 1px solid #bebebe;
  }

  th, td {
    border-bottom: 1px solid #bebebe;
    text-align: center;
    padding: 10px;
    font-family: 'SBAggroL'
  }
  
  #qnalist{
  	padding-top: 45px;
  	background-color: white;
  	display: inline-block;
  	width: 75%;  
  	margin-top: 45px;
  	margin-left: 7%; 	
  }
  
  a{
  	text-decoration: none;
  	color: black;
  }

</style>

<script type="text/javascript">

function filterSelect(){
	var filter = $("#filter").val();
	console.log(filter)
	
	location.href =  "/admin/serviceCenter?curPage=1" + "&filter=" + filter
}

</script>
<body>

<div id="adminSlider">
<h2>회원 관리</h2>
<p>회원 정보 수정</p>
<p>블랙 리스트 관리</p>
<br>
<h2>신고 관리</h2>
<p><a href="./regulateBoard">글 신고 내역</a></p>
<p><a href="./regulateComm">댓글 신고 내역</a></p>
<br>
<h2>고객 센터</h2>
<p><a href="./serviceCenter" style="color: #497649; text-decoration: none; font-size: 30px;">문의 내역</a></p>
<br>
<h2>공지 사항</h2>
<p>작성 내역</p>
</div>

<div id="qnalist">

<div id="selectBox">
	<select id="filter" name="filter" onchange="filterSelect()">
		<c:choose>
		<c:when test="${filter eq 'n' }">
			<option value="a">전체</option>
			<option value="n" selected>답변 대기</option>
			<option value="y">답변 완료</option>		
		</c:when>
		<c:when test="${filter eq 'y' }">
			<option value="a">전체</option>
			<option value="n">답변 대기</option>
			<option value="y" selected>답변 완료</option>		
		</c:when>
		<c:otherwise>
			<option value="a">전체</option>
			<option value="n">답변 대기</option>
			<option value="y">답변 완료</option>		
		</c:otherwise>
		</c:choose>
	</select>
</div>

<table>
	<tr>
		<th>문의 번호</th>
		<th>회원 번호</th>
		<th>문의 제목</th>
		<th>문의 유형</th>
		<th>문의 날짜</th>
		<th>문의 상태</th>
	</tr>
	
	
	<c:forEach items="${qnalist}" var="list">
	<tr>
		<td>${list.INQUIRY_NO}</td>
		<td>${list.USER_NO}</td>
		<td><a href="/service/qnaView?inquiryNo=${list.INQUIRY_NO}">${list.INQUIRY_TITLE}</a></td>
		<td>${list.TYPE}</td>
		<td>${list.INQUIRY_DATE}</td>
		<td>${list.STATE}</td>
	</tr>
	</c:forEach>
</table>

<div style="margin-bottom: 50px; margin-top: 50px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?filter=${filter}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./serviceCenter?filter=${filter}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./serviceCenter?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./serviceCenter?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?curPage=${paging.startPage - paging.pageCount }&filter=${filter}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./serviceCenter?curPage=${paging.startPage - paging.pageCount }&filter=${filter}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?curPage=${paging.curPage -1 }&filter=${filter}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./serviceCenter?curPage=${i }&filter=${filter}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./serviceCenter?curPage=${i }&filter=${filter}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?curPage=${paging.curPage +1 }&filter=${filter}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}&filter=${filter}">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?curPage=${paging.startPage + paging.pageCount }&filter=${filter}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./serviceCenter?curPage=${paging.startPage + paging.pageCount }&filter=${filter}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./serviceCenter?curPage=${paging.totalPage }&filter=${filter}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./serviceCenter?curPage=${paging.totalPage }&filter=${filter}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>

</div>

</body>
</html>