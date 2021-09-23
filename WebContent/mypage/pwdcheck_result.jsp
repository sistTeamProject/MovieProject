<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
	<c:if test="${bCheck==false }">
		alert("비밀번호가 틀렸습니다");
		history.back();
	</c:if>
	<c:if test="${bCheck==true }">
		location.href="../mypage/edit_info.do";
	</c:if>
</script>
