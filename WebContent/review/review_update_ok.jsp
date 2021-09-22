<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
  <c:when test="${bCheck==true}">
    <c:redirect url="../review/review_list.do"/>
  </c:when>
  <c:otherwise>
    <script>
    alert("수정은 작성자만 가능합니다.");
    history.back();
    </script>
  </c:otherwise>
</c:choose>