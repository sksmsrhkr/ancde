<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<%-- <c:import url="/WEB-INF/views/layout/sidebar.jsp" /> --%>

<style>

	.box1{
		width: 70%;  
		margin-right: 15%;
		margin-left: 15%;
    	margin-top: 70px;
	}
	
  table {   
	width: 100%;  
    border-top: 1px solid #bebebe;
  }
  
  #title{
   text-align: left;
  }
  
  th, td {
    border-bottom: 1px solid #bebebe;
    text-align: center;
    padding: 10px;
    font-family: 'SBAggroL'
  }
  
  div{
  	 font-family: 'SBAggroL'
  }
  
  a{
  	text-decoration-line: none;
  	color: black;
  }
  
  #comBtn{
  	border-radius: 100%;
  	font-size: 10px;
  	border-style: none;
  	color: #F06E6E;
  	padding-top:3px;
  }
  
  	#btnWrite{
		width:70px;
		height: 40px;	
		border: 3px solid #AFDDFA;
		background-color: white;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float:right;
		color: #6E9FED;
		margin-top: 15px;
		margin-right: 5px;
	}
  
</style>

<script type="text/javascript">
function openComm(url, name){
    var options = 'top=10, left=10, width=1000, height=600, status=no, menubar=no, toolbar=no, resizable=no';
    window.open(url, name, options);
}
</script>

<body>

<div class="box1">
<table>
	<thead>
		<tr style="font-family: 'SBAggroL'; font-size: 21px;">
			<th></th>
			<th>제목</th>
			<th>닉네임</th>
			<th>글작성일</th>
			<th>추천</th>
			<th>조회</th>
		</tr>
	</thead>
<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.BOARD_NO}</td>
			<td id="title">
			<a href="./view?boardNo=${list.BOARD_NO}">${list.TITLE}</a>
			
			<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
					<fmt:parseNumber value="${list.WRITE_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
					<c:if test="${today - boardDate le 2}">
					<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
					</c:if>
			&nbsp;&nbsp;
			<c:if test="${list.COMMENTCNT ne 0}">
			<a href="javascript:openComm('./commentList?boardNo=${list.BOARD_NO}', 'popup');"><button id="comBtn">${list.COMMENTCNT}</button></a>
			</c:if>
			</td>
			<td>${list.USER_NICK}</td>
			<td><fmt:formatDate value="${list.WRITE_DATE }"
 							pattern="yy/MM/dd HH:mm" /> 
			<td>${list.RECOMMENDCNT}</td>
			<td>${list.HIT}</td>
		</tr>
</c:forEach>
</table>

	<c:if test="${not empty login and login}">
		<div style="float: right;">
		<a href="./write"><button id="btnWrite"
		style="font-family: 'SBAggroM';">글쓰기</button></a>
		</div>
		<div class="clearfix"></div>
	</c:if>

	<c:if test="${empty login and !login}">
		<br>
		<br>
	</c:if>
</div>

<div style="margin-bottom: 100px; margin-top: 50px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />