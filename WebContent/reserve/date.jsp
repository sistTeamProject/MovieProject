<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--라이브러리  --%>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.rdays').hover(function(){
		$(this).css("cursor","pointer");
		$(this).css("background-color","red");
	},function(){
		$(this).css("cursor","none");
		$(this).css("background-color","white");
	})
	
})
</script>
</head>
<body>
		<h3>${year }년도 ${month }월 ${day }일</h3>
		<table class="table">
			<tr style="height:50px">
				<c:forEach var="strWeek" items="${strWeek }">
					<th class="text-center">${strWeek }</th>
				</c:forEach>
			</tr>
		</table>
		<%-- 달력 출력 --%>
		<c:set var="week" value="${week }"/>
		<table class="table">
			<c:forEach var="i" begin="1" end="${lastday }">
				<c:if test="${i==1 }">
					<tr style="height:45px">
						<c:forEach var="j" begin="1" end="${week }">
							<td class="text-center">&nbsp;</td>
						</c:forEach>
				</c:if>
				<c:if test="${i>=day }"><!-- 예약이 가능한 날짜 -->
					<td class="text-center rdays" style="border:solid"><span data-year="${year }" data-month="${month }">${i }</span></td>
				</c:if>
				<c:if test="${i<day }">
					<td class="text-center">${i }</td>
				</c:if>
				<c:set var="week" value="${week+1 }"/>
				<c:if test="${week>6 }">
					<c:set var="week" value="0"/>
					</tr>
					<tr style="height:45px">
				</c:if>
			</c:forEach>
			</tr>
		</table>
</body>
</html>