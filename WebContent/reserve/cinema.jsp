<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cinema_type span{
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	padding : 5px;
}
.gu{
 margin : 5px;
 font-size : 20px;
 font-weight: 600;

}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.gu').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
	$('.cinema_type span, .cinema_result2').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
	$('.gu').click(function(){
		let addr=$(this).text();
		if(addr==$('.cinema_result2').attr('data-addr')){
			$('.cinema_result2').show();
		}else{
			$('.cinema_result2').hide();
		}
	})
	$('.type').click(function(){
		let type=$(this).attr("data-bound");
		if($('.cinema_result2').attr('data-bound')===type){
			$('.cinema_result2').show();
		}else{
			$('.cinema_result2').hide();
		}
	})
	$('.cinema_result2').click(function(){
		let cinema=$(this).text();
		$(this).addClass("selected");
		$('#cinema1').text(cinema);
	})
})
</script>
</head>
<body>
<div class="cinema" style="width:360px;height:600px">
	<div class="cinema_type" style="width:100%; height:5%; border:solid 1px; text-align:center;"  >
		<span class='type' data-bound="CGV">CGV</span>
		<span class='type' data-bound="LOTTEC">롯데시네마</span>
		<span class='type' data-bound="MEGABOX">메가박스</span>
	</div>
	<div class="cinema_addr" style="width:40%; height:90%; border:solid 1px; float:left">
		<c:forEach var="gu" items="${gu }">
		<div class="gu" data-addr="${gu }">
			${gu }
		</div>
		</c:forEach>
	</div>
	<div class="cinema_result" style="width:60% ; height:90%; border:solid 1px; float:right;">
	<c:forEach var='cvo' items='${clist }'>
		<div class="cinema_result2" style="text-align:left; font-size:18px;" data-addr='${cvo.cd_nm }' data-bound='${cvo.nt_id }'>
			${cvo.t_nm }
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>