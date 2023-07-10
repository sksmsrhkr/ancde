<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<style>

	body{font-family: 'SBAggroL'}
	
	.container {
		width: 70%;
		margin-top: 50px;
		font-family: 'SBAggroL';
	}
	
	a{
		color: #b4b4b4;
		text-decoration-line: none;
	}
	
	#box{
		width: 100%;
		height: 30px;
	}
	
	#recommend{
		width:50px;	
		border: 2px solid #FFCFDA;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float:left;
		margin-right: 5px;
	}
	
	#comment {
		width:70px;	
		font-size: 16px;
		border: 2px solid #D5C2EE;
		color: #8E83A9;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
		float:left;
	}
	
	#writerBtn{
		font-size: 12px;
		border: 1px solid #FF3232;
		color: #FF3232;
		text-align: center;
		padding-top: 5px;
		border-radius: 10px;
	}
	
	#commentBtn{
		font-size: 14px;
		border: 2px solid #6E9FED;
		color: white;
		border-radius: 10px;
		text-align: center;
		background-color: #6E9FED;
	}
	
	#commentBox{
		margin: 25px;
	 	background-color: #f1f3f5;
	 	margin-bottom: 50px;
	}
	
	.commentList{
		padding: 20px;
	}

	#writeCommBox{

		
	}
	#writeComm{		
		background-color: white;
		margin: 30px; 
		padding: 10px 20px 35px 20px;
	}

	
	.updateContent{
		background-color: white;
		margin: 30px; 
		padding: 10px 20px 35px 20px;
	}

</style>

<h2 style="margin: 20px;">${board.title}</h2>
<hr>
	<div  id="commentBox">
		<div class="commentList">
			<c:forEach var="commList" items="${commentList}">
				<c:choose>
				<c:when test="${commList.CHK_LOCK eq 'y' && commList.USER_NO ne userNo && board.userNo ne userNo}">
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" 
					pattern="yy.MM.dd HH:mm"/></span><br>
					<sapn><i class="bi bi-lock-fill"></i> 해당 댓글은 작성자와 운영진만 볼 수 있습니다</sapn>
				</c:when>
				
				
				<c:when test="${commList.CHK_LOCK eq 'n'}">				
					<div class="upBox">
					<span>${commList.USER_NICK}</span>
					<c:if test="${commList.USER_NO eq userNo}"><button type="button" id="writerBtn">나</button></c:if>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>
						<div style="white-spac: pre-wrap"><c:out value="${commList.COMM_CONTENT}" /></div>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
					</div>
				</c:when>
				
				
				<c:otherwise>
					<div class="upBox">
					<span>${commList.USER_NICK}</span>
					<c:if test="${commList.USER_NO eq userNo}"><button type="button" id="writerBtn">나</button></c:if>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>
					
					<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><c:out value="${commList.COMM_CONTENT}" /></div>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>

					</div>
				</c:otherwise>				
				</c:choose>
				<hr>
			</c:forEach>
		</div>
		</div>
							

</body>
</html>