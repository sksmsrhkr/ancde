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
	width:70%;
	margin: auto;
	margin-top: 60px;
	margin-bottom: 60px;
	border: 3px solid #B4B4DC;	
	height: 150px;
}

#mybox2{
	display: block;
	width: 70%;
	margin: auto;
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
  
  #profile{
  	float:left;
  	padding-top: 20px; 
  	height: 100%;
  }
  
  #userInfo {
  	float:left;
  	height: 100%;
  	padding-top: 30px;
  }
  
  
  #profileImg{
	text-align: center;
  	width: 100px;
  	height: 100px;
  	margin-left: 50px;
  	margin-right: 50px;
  	border-radius: 100%; 
  	object-fit: cover;
  }
  
  #mybox3{
   	float: left; 
  	margin-left: 15%;
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
  }
   #mybox3:hover{
   	background-color: #B4B4DC;
   }
   
  #mybox5{
   	float: left; 
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
  }
   #mybox5:hover{
   	background-color: #B4B4DC;
   }
   #mybox4{
    dislplay: inline-block; 
  	float: left;
  	width: 15%;
  	padding-top: 10px;
  	text-align: center;
  	font-size: 18px;
  	height: 40px;
    border: 3px solid #B4B4DC;
    border-bottom: none;
  }
</style>

	<div id="comContainer">
		<c:import url="/WEB-INF/views/layout/myBox.jsp" />
	
	<div >
		<div id="mybox3"><a href="./myboardList">내가 쓴 글</a></div>
		<div id="mybox4"><a href="./commentList">내가 쓴 댓글</a></div>
		<div id="mybox5"><a href="./inquiryList">1:1 문의 내역</a></div>
	</div>
	<br><br>
	<div id="mybox2">
	<table>
	<thead>
		<tr>
		<th></th>
		<th></th>
		</tr>
	</thead>
	<c:forEach items="${commentlist}" var="commentlist">
	<tr>
	<td style="width: 100px; text-align: center;">${commentlist.COMMENT_NO }</td>
	
	<td style="text-align:left;">
	<c:if test="${commentlist.CHK_LOCK eq 'n'}">
	</c:if>
	<c:if test="${commentlist.CHK_LOCK eq 'y'}">
	<i class="bi bi-lock-fill"></i>
	</c:if>
		<a href="/board/view?boardNo=${commentlist.BOARD_NO}#${commentlist.COMMENT_NO}">${commentlist.COMM_CONTENT }</a>
		<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
		<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
		<fmt:parseNumber value="${commentlist.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
		<c:if test="${today - boardDate le 2}">
		<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
		</c:if>		
		&nbsp;<span style="font-size: 12px;"><fmt:formatDate value="${commentlist.COMM_DATE }"	pattern="yy/MM/dd HH:mm"/></span>
 		<br>
		<span style="font-size: 12px; color: #bebebe;">
		원문제목: 
		<a href="/board/view?boardNo=${commentlist.BOARD_NO}" style="color: #bebebe;">${commentlist.TITLE }</a>
		</span>
		</td>

	
	</tr>
	</c:forEach>
	</table>	
</div>



<div style="margin-bottom: 50px; margin-top: 50px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./commentList">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./commentList">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./commentList?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./commentList?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./commentList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./commentList?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./commentList?curPage=${paging.curPage -1 }">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./commentList?curPage=${i }">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./commentList?curPage=${i }">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./commentList?curPage=${paging.curPage +1 }">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}">
				<li class="page-item"><a class="page-link"
					href="./commentList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./commentList?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./commentList?curPage=${paging.totalPage }">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./commentList?curPage=${paging.totalPage }">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>