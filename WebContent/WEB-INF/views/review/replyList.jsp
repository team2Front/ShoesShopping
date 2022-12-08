<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<hr class="mt-3 mb-3">
	<b >댓글</b>
	<c:if test="${!empty replyList}">
		<c:forEach var="reply" items="${replyList}">
			<div>${reply.replyContent}</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty replyList}">
			<div>작성된 댓글이 없습니다.</div>
	</c:if>
</div>
