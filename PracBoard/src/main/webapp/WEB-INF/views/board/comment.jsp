<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function() {
	$(".updateContent").hide()
})
</script>

			<c:forEach var="commList" items="${commentList}">
				<c:choose>
				<c:when test="${commList.CHK_LOCK eq 'y' && commList.USER_NO ne userNo && board.userNo ne userNo}">
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" 
					pattern="yy.MM.dd HH:mm"/></span><br>
					<sapn><i class="bi bi-lock-fill"></i> 해당 댓글은 작성자와 운영진만 볼 수 있습니다</sapn>
				</c:when>
				
				
				<c:when test="${commList.CHK_LOCK eq 'n'}">				
					<div class="upBox">
					<div style="float: right;">
						<span>답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}">수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}">삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					<span>${commList.USER_NICK}</span>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>

					<sapn>${commList.COMM_CONTENT}</sapn>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
					
					
						<div class="updateContent" style="margin-bottom: 40px; padding: 10px 30px;">
							<input type="hidden" id="commNo" value="${commList.COMMENT_NO}">
							<input style="width:100%; height: 100px; margin-bottom:5px;" value="${commList.COMM_CONTENT}" ></input>
								<div style="float:right;">
								비밀 댓글
								<c:if test="${commList.CHK_LOCK eq 'n'}">					
									<input type="checkbox" id="chkLock">
								</c:if>
								<c:if test="${commList.CHK_LOCK eq 'y'}">					
									<input type="checkbox" id="chkLock" checked="checked">
								</c:if>
								&nbsp;&nbsp;<button type="button"  id="commentBtn">등록</button></div>
								</div>
					</div>
				</c:when>
				
				
				<c:otherwise>
					<div class="upBox">
					<div style="float: right;">
						<span>답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}">수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}">삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					<span>${commList.USER_NICK}</span>
					<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
					<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span><br>

					<sapn><i class="bi bi-lock-fill"></i>${commList.COMM_CONTENT}</sapn>
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
					
					
						<div class="updateContent" style="margin-bottom: 40px; padding: 10px 30px;">
							<input type="hidden" id="commNo" value="${commList.COMMENT_NO}">
							<input style="width:100%; height: 100px; margin-bottom:5px;" value="${commList.COMM_CONTENT}" ></input>
								<div style="float:right;">
								비밀 댓글
								<c:if test="${commList.CHK_LOCK eq 'n'}">					
									<input type="checkbox" id="chkLock">
								</c:if>
								<c:if test="${commList.CHK_LOCK eq 'y'}">					
									<input type="checkbox" id="chkLock" checked="checked">
								</c:if>
								&nbsp;&nbsp;<button type="button"  id="commentBtn">등록</button></div>
								</div>
					</div>
				</c:otherwise>				
				</c:choose>
				<hr>
			</c:forEach>
</body>
</html>