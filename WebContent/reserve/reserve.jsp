<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.select {
	background-color:white;
		margin-top:50px;
		
}
.time{
	background-color:white;
	height: 200px;
	margin-top :30px;
}
.result{
	background-color:white;
	height: 200px;
	margin-top : 30px;
	
}
.col{
	border-style: solid;
	border-color: black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
			type:'post',
			url:'../reserve/date.do',
			success:function(result){
				$('#movie_date').html(result);	
			}
	})
	$.ajax({
		type:'post',
		url : "../reserve/movie_list.do",
		success:function(result){
			$('#movie_list').html(result);
		}
	})
		

})
</script>
<style type="text/css">
.movie_list{
	overflow-y:auto; height:400px;
}
.movie{
	padding : 5px;
	font-size: 18px;
}
</style>
</head>
<body>
	<div class="container"> 
	<!-- 예매 선택란  -->
		<div class="row select" style="height:600px">
	<!--영화선택  -->
			<div class="col" style="width:30%">
				<div class="ms-title">영화선택</div>
				<div id='movie_list'></div>
			</div> 	
	<!--극장선택  -->
			<div class="col" style="width:30%">
				<div class="ms-title">극장 선택</div>
				<table class="table">
					<tr>
						<th>극장 선택</th>
					</tr>
				</table>
			</div>
	<!--날짜 선택  -->	
			<div class="col" style="width:30%">
				<div class="ms-title">관람일 선택</div>
				<table class="table" >
					<tr>
						<td id="movie_date"></td>
					</tr>
				</table>
			</div>	
		</div>
	<!-- 시간 선택란 -->
		<div class="row time">
			<div class="ms-title">시간선택</div>
			<div class="ms-time">
				
			</div>
		</div>
	<!-- 예매 결과란  -->
		<div class="row result">
			<div class="ms-title">결과</div>
			<table class="table">
				
			</table>
		</div>
	</div>
</body>
</html>
