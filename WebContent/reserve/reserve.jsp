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
	$.ajax({
		type:'post',
		url : "../reserve/cinema.do",
		success:function(result){
			$('#cinema').html(result);
		}
	})
	$('.movie_time').click(function(){
		$(this).css('background-color','red');
		let time=$(this).text();
		$('#time').text(time);
		
	})
	
	
	
		

})
</script>
<style type="text/css">
.movie_list , .cinema_addr, .cinema_result{
	overflow-y:auto; height:400px;
}
.movie{
	padding : 5px;
	font-size: 18px;
}
#result{
	margin-top:20px;
}
.result {
	background-color:#777777;
}
.movie_time{
	text-align:center;
	width: 100px;
	height: 100px;
	border:solid;
}
.ms_time{
	padding:50px;
	height: 50px;
}
.float{
	width: 30%;
	float:left;
}
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 40px;
  width: 250px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 35px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
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
				<div id='cinema'></div>
			</div>
	<!--날짜 선택  -->	
			<div class="col" style="width:30%">
				<div class="ms-title">관람일 선택</div>
				<table class="table" >
					<tr>
						<td id="movie_date" style="position:static"></td>
						
					</tr>
				</table>
			</div>	
		</div>
	<!-- 시간 선택란 -->
		<div class="row time">
			<div class="ms-title">시간선택</div>
			<div class="ms-time">
				<table style="margin-top:50px">
				<tr>
					<td class='movie_time'>11:00</td>
					<td class='movie_time'>13:05</td>
					<td class='movie_time'>15:00</td>
				</tr>
				</table>	
			</div>
		</div>
	<!-- 예매 결과란  -->
		<div class="row result">
			<div class="ms-title">결과</div>
			<div id=result class="float">
			    <div style="float:left"><img src="" style="width:95px;height:135.25px;" id="poster"></div>
			    <div style="margin-left:10px; float:left;">
			    <div id="title" style=" font-weight:900; font-size:25px; "></div>
			    <div id="cinema1"></div>
			    <div id="date" style="font-size:15px;"></div>
			    <div id="time"></div>
			    </div>
			</div>
			<div id='inwon' class="float" style="margin-top:25px;">
				청소년 : <input name=child type="number" min="0" max="10" />
				어른 : <input name="adult" type="number" min="0" max="10" />
			</div>
			<div class="float">
				<button class="button" style="vertical-align:middle"><span><a href="../mypage/reserved_list.do">예매하기 </a></span></button>
			</div>
		</div>
	</div>
</body>
</html>
