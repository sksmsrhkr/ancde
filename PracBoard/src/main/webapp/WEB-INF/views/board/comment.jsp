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
	$(".replyComm").hide()
})
</script>
				<c:forEach var="commList" items="${commentList}">
	
				<c:choose>
				<%-- !!!!!!!!!!! 내가 못 보는 비댓 !!!!!!!!!!!!!! --%>
				<c:when test="${commList.CHK_LOCK eq 'y' && commList.USER_NO ne userNo && board.userNo ne userNo}">
					<c:if test="${commList.STEP eq 1 }">
						<div class="reIcon"><i class="bi bi-arrow-return-right"></i></div>
					</c:if>
						<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
						<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
							<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
							<c:if test="${today - commDate le 2}">
							<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
						</c:if>
						<br>
						<sapn><i class="bi bi-lock-fill"></i> 해당 댓글은 작성자와 운영진만 볼 수 있는 댓글 입니다</sapn>
				</c:when>
				
				<c:when test="${commList.IS_DELETE eq 'y'}">
					<sapn>삭제된 댓글 입니다.</sapn>
				</c:when>
				
				<%--비댓 아님 --%>
					
					<c:otherwise>
					<div class="upBox">
					<div style="float: right;" id="${commList.COMMENT_NO}">
						<span onclick="reply(this)" class="reply" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
						data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}"  data-replyNo="${commList.USER_NO}" >답글</span>	
					<c:if test="${commList.USER_NO eq userNo}">					
						<span onclick="commUpdate(this)" class="commUpdate" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						data-commContent="${commList.COMM_CONTENT}" data-chkLock="${commList.CHK_LOCK}" data-comImg="${commList.COMFILE_STORED}" >수정</span>				
						<span class="deleteComm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}">삭제</span>	
					</c:if>
					<c:if test="${commList.USER_NO ne userNo}">
						<span>신고</span>	
					</c:if>
					</div>
					
					<%-- 대댓 --%>
						<c:if test="${commList.STEP eq 1 }">
							<div class="reIcon"><i class="bi bi-arrow-return-right"></i></div>
							<div class="viewReply">
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
							<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
								<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
									<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
									<c:if test="${today - commDate le 2}">
									<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
								</c:if>
							<br>
							<c:if test="${commList.CHK_LOCK eq 'y' }">
							<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><b>@${commList.REPLY_NICK}</b>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${commList.COMM_CONTENT}" /></div>
							</c:if>
							<c:if test="${commList.CHK_LOCK eq 'n' }">
							<div style="white-spac: pre-wrap"><b>@${commList.REPLY_NICK}</b>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${commList.COMM_CONTENT}" /></div>
							</c:if>
							<c:if test="${commList.COMFILE_STORED  ne null}">
								<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
							</c:if>
							</div>
						</c:if>
						
					<%-- 본댓 --%>
						<c:if test="${commList.STEP eq 0 }">
						<div>
							<span>${commList.USER_NICK}</span>
							<c:if test="${board.userNo eq commList.USER_NO}"><button type="button" id="writerBtn">작성자</button></c:if>
								<span style="font-size: 12px;"><fmt:formatDate value="${commList.COMM_DATE}" pattern="yy.MM.dd HH:mm"/></span>
									<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
									<fmt:parseNumber value="${commList.COMM_DATE.time / (1000*60*60*24)}" integerOnly="true" var="commDate" /><!-- 게시글 작성날짜를 숫자로 -->
									<c:if test="${today - commDate le 2}">
									<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
								</c:if>
								<br>
									<c:if test="${commList.CHK_LOCK eq 'y' }">
									<div style="white-spac: pre-wrap"><i class="bi bi-lock-fill"></i><c:out value="${commList.COMM_CONTENT}" /></div>
									</c:if>
									<c:if test="${commList.CHK_LOCK eq 'n' }">
									<div style="white-spac: pre-wrap"><c:out value="${commList.COMM_CONTENT}" /></div>	
									</c:if>	
								</div>
								<c:if test="${commList.COMFILE_STORED  ne null}">
									<div style="margin-top: 10px;"><img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
								</c:if>
						</c:if>
				
						<%-- 답글 폼 --%>
						<div class="replyComm">
						<form class="replyCommentFile">
							<input type="hidden" value="${board.boardNo}" id="boardNo">
							<textarea  class="replyCount" onkeyup="replyCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; resize: none; margin-bottom:5px;"
							 placeholder="인터넷은 함께하는 공간입니다.&#13;&#10;타인을 비방하거나 명예를 훼손하는 댓글은 운영원칙에 따라 제재를 받을 수 있습니다"></textarea>
							<div  style="float:left;">
								<label for="rfile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
								<input type="file" id="rfile" name='rfile'  accept="image/*" style="display: none;">
							</div>
							<div style="float:right;"  >
									<span class="replytextCount">0</span>
									<span class="replytextTotal">/200</span>	&nbsp;&nbsp;					
								비밀 댓글
								<input type="checkbox" class="reLock" name="reLock">
								&nbsp;&nbsp;<button type="button" onclick="replyBtn(this)" class="replyBtn" data-commNo="${commList.COMMENT_NO}" data-boardNo="${board.boardNo}" 
						data-parentNo="${commList.PARENT_NO}" data-userNick="${commList.USER_NICK}" data-replyNo="${commList.USER_NO}">등록</button></div>
						</form>
						</div>
						
						<%-- 수정 폼 --%>
						<div class="updateContent">
						<form class="updateFile">
							<input type="hidden" id="commNo" value="${commList.COMMENT_NO}">
							<textarea  class="updateCount" onkeyup="updateCount(this)" maxlength="{200}" style="border: none; width:100%; height: 100px; 
							resize: none; margin-bottom:5px;">${commList.COMM_CONTENT}</textarea>
							
						<c:if test="${commList.COMFILE_STORED  ne null}">
							<div class="imgX" style="margin-bottom: 10px;">
							<div><span onclick="deleteImg(this)" class="deleteImg" data-commNo="${commList.COMMENT_NO}"><i class="bi bi-x-circle-fill"></i></span></div>
							<img id="commfile" src="/upload/${commList.COMFILE_STORED}" alt=""></div>
						</c:if>
							
								<div  style="float:left;">
									<label for="updatefile" style="font-size: 20px"><i class="bi bi-camera" ></i></label>
									<input type="file" id="updatefile" name='updatefile'  accept="image/*" style="display: none;" onchange="setThumbnail(event);">
								</div>
								
								<div style="float:right;"  >
									
										<span class="updatetextCount">0</span>
										<span class="updatetextTotal">/200</span>	&nbsp;&nbsp;	
										
								비밀 댓글
								<c:if test="${commList.CHK_LOCK eq 'n'}">					
									<input type="checkbox" class="updateLock">
								</c:if>
								<c:if test="${commList.CHK_LOCK eq 'y'}">					
									<input type="checkbox" class="updateLock" checked="checked">
								</c:if>
								&nbsp;&nbsp;<button type="button"  onclick="updateConfirm(this)" class="updateConfirm" data-commNo="${commList.COMMENT_NO}" data-boardNo="${boardNo}" 
						 data-comImg="${commList.COMFILE_STORED}">등록</button>
						</div>
						 </form>
						</div>
					</div>
				</c:otherwise>
				</c:choose>
				<hr>

			</c:forEach>
</body>
</html>