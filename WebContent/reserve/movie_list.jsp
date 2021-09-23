<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.movie').hover(function(){
		$(this).css('cursor','pointer');
		$(this).css("background-color","red");
	},function(){
		$(this).css('cursor','none');
		$(this).css("background-color","white");
	})
	$('.movie_type').click(function(){
		$(this).next().slideToggle();
		$(this).next().siblings('.movie_list').slideUp();
	})
	$('.movie').click(function(){
		$.ajax({
			type:'post',
			url:'../reserve/date.do',
			success:function(result){
				$('#movie_date').html(result);	
			}
		})
	})
})

</script>
<style type="text/css">
.movie_list{
	display:none;
}


</style>
</head>
<body>
					<div class="movie_type">
						<h3>탑 10</h3>
					</div>
					<div class="movie_list">
						<c:forEach var="vo" items="${list }" begin="0" end="9" varStatus="s">
						<div class="movie">
							<span>${s.count }</span>
							<span>${vo.grade }</span>
							<span>${vo.title }</span>
						</div>
						</c:forEach>
					</div>
					<div class="movie_type">
						<h3>탑 10외 영화</h3>
					</div>
					<div class="movie_list" id="movie_list">

						<c:forEach var="vo" items="${list }" begin="10" >
						<div class="movie">
							<span>${vo.grade }</span>
							<span>${vo.title }</span>
						</div>
						</c:forEach>
					</div>
</body>
</html>