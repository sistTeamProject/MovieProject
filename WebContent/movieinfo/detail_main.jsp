<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Anime | Template</title>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <style type="text/css">
nav {
  margin: 0 auto;
  background-color:transparent;
}
nav ul {
  text-align: center;
}
nav ul li {
  display: inline-block;
  font-size: 30px;
  text-color:white;
  text-transform:uppercase;
}
nav ul li a {
  padding: 35px;
  display: block;
}
nav ul li a:hover {
  color:orange;
}
ul.menu{
	border:2px;
	border-color:#1772a8;
}
</style> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

/*$(function(){
	$('#detail_story').click(function(){
			
	
	let mno=$('#mno_number').attr("class");
	
	$.ajax({
		type:'post',
		url:'../movieinfo/detail_story.jsp', // 요청
		data:{"mno":mno},
		// 증권 , 좌석예매
		success:function(res) // 응답 ===> 한 곳에서 요청/응답을 동시에 처리 (페이지 유지한 상태에서 데이터 읽기)
		{
			$('#printpage').html(res);
			alert("통신 성공" + res);
		},
		error:function(error)
		{
			alert("통신 실패" + error);
		}
	})
})
})*/
</script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <!--<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">-->
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../css/plyr.css" type="text/css">
    <link rel="stylesheet" href="../css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>

<body>

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row" style="margin:70px;">
                    <div class="col-lg-3">
                    	<div>
                    		<img src="${vo.poster}" width="300" height="300">
                    	</div>
                       
                    </div>
                    <div class="col-lg-8">
                        <div class="anime__details__text">
                            <div>
                            	<h3>
                                	<span style="font-size:40px;color:white;">${vo.title }</span>

                                <span style="font-size:20px;color:white;background-color:red;border-radius:8px;vertical-align:middle">
                                
                                	<c:choose>
                                        <c:when test="${vo.cno eq 1 }">상영 중</c:when>
                                        <c:when test="${vo.cno eq 2 }">개봉 예정</c:when>
                                        <c:when test="${vo.cno eq 3 }">상영 종료</c:when>
                                    </c:choose>
                                    
                                
                                </span>
                                </h3>

                                <h6 style="color:white">${vo.engtitle }</h6>
               
                           
                            
                            <div class="anime__details__widget" style="margin-top:20px">
                                <div class="row">
                                    <div class="col-lg-6 col-md-8">
                                        <ul>
                                            <li><span>개봉일</span> ${vo.regdate }</li> 
                                            <li style="list-style-position:inside;"><span>장르</span> ${vo.genre }</li>
                                            <li><span>국가</span> ${vo.nation }</li>
                                            <li><span>등급</span> ${vo.grade }</li>
                                            <li><span>러닝타임</span> ${vo.time }</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 col-md-4">
                                        <ul>
                                            <li><span>평점</span>${vo.score }</li>
                                            <li><span>누적 관객</span>${vo.showUser }명</li>    
                                        </ul>
                                        <input type=button value="예매하기" class="btn btn-sm btn-danger" style="width:200px;height:50px;" onClick="location.href='http://localhost:8080/MovieProject/reserve/reserve.do'">
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
 
            </div>
           </div>
        </section>
