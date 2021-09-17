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
	$('.detail1').hover(function(){
		$(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');
	})
	
	$("#detail_story").click(function(){	
		let mno1=$(this).attr("data-mno1");
		
		$.ajax({
			type:'post',
			async:false,
			url:'../movieinfo/detail_story.do',
			data:{"mno":mno1},
			success:function(result1)
			{
				$('#printpage').html(result1);
			}
		})
		
	})
	
	
	$("#detail_people").click(function(){	
		let mno2=$(this).attr("data-mno2");
		
		$.ajax({
			type:'post',
			async:false,
			url:'../movieinfo/detail_people.do',
			data:{"mno":mno2},
			success:function(result2)
			{
				$('#printpage').html(result2);
			}
		})
		
	})
	
	$("#detail_video").click(function(){	
		let mno3=$(this).attr("data-mno3");
		
		$.ajax({
			type:'post',
			async:false,
			url:'../movieinfo/detail_video.do',
			data:{"mno":mno3},
			success:function(result3)
			{
				$('#printpage').html(result3);
			}
		})
		
	})
	
		
})
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
                
				<jsp:include page="detail_main.jsp"></jsp:include>
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                                           
                        
				<table>
					<tr>
						<th><span class="detail1" id="detail_story" data-mno1="${vo.mno}">줄거리</span><th>
						<th><span class="detail1" id="detail_people" data-mno2="${vo.mno}">출연/제작</span><th>
						<th><span class="detail1" id="detail_video" data-mno3="${vo.mno }">예고편</span><th>
					</tr>
			    </table>
						
						
						 <div id="printpage">
                    		
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