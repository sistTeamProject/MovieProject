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
    <title>Anime | Template</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#detail_story').click(function(){
		
		//$('#printpage').load("detail_story.jsp");
		let res = "";
		$.ajax({
			url:'../movieinfo/detail_story.jsp',
			type:'post',
			datatype:'xml',
			error:function(){
				alert("통신 실패");
			},
			success:function(res)
			{
				$('#printpage').html(res);
				alert("통신 데이터 값 : " + res);
			}
		})
		
	})
})
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

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./categories.html">Categories</a>
                        <span>Romance</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Anime Section Begin -->
    <section class="anime-details spad">
        <div class="container">
            <div class="anime__details__content">
                <div class="row" style="margin:70px;">
                    <div class="col-lg-3">
                    	<div>
                    		<img src="${vo.poster}" width="300" height="300">
                    	</div>
                        <%-- <div class="anime__details__pic set-bg" data-setbg="${vo.poster }" style="width:300px;height:450px;">
                            <div class="comment"><i class="fa fa-comments"></i> 11</div>
                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                        </div> --%>
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
               
                            </div>
                            <!-- <div class="anime__details__rating">
                                <div class="rating">
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star"></i></a>
                                    <a href="#"><i class="fa fa-star-half-o"></i></a>
                                </div>
                                <span>1.029 Votes</span>
                            </div> -->
                            
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
                                        <input type=button value="예매하기" class="btn btn-sm btn-danger" style="width:200px;height:50px;">
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="anime__details__btn">
                                <a href="#" class="follow-btn"><i class="fa fa-heart-o"></i> Follow</a>
                                <a href="#" class="watch-btn"><span>Watch Now</span> <i
                                    class="fa fa-angle-right"></i></a>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        
                        <nav>
  							<ul class="menu">
   								<li><input type=button id="detail_story" value="줄거리"></li>
   								<li><input type=button id="detail_people" value="출연/제작"></li>
    							<li><input type=button id="detail_video" value="예고편"></li>
  							</ul>
  							
						</nav>
						
						<div class="printpage" id="printpage">
                    		
                  	  	</div>
                    </div>
                    
                    <div class="col-lg-4 col-md-4">
                        <div class="anime__details__sidebar">
                            <div class="section-title">
                                <h5>you might like...</h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="../img/sidebar/tv-1.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="../img/sidebar/tv-2.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="../img/sidebar/tv-3.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg" data-setbg="../img/sidebar/tv-4.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           </div>
        </section>
        <!-- Anime Section End -->


          <!-- Search model Begin -->
          <!-- <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div> -->
        <!-- Search model end -->

        <!-- Js Plugins -->
        <script src="../js/jquery-3.3.1.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/player.js"></script>
        <script src="../js/jquery.nice-select.min.js"></script>
        <script src="../js/mixitup.min.js"></script>
        <script src="../js/jquery.slicknav.js"></script>
        <script src="../js/owl.carousel.min.js"></script>
        <script src="../js/main.js"></script>

    </body>

    </html>