<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>마이페이지_예약내역</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="../shadow/css/shadowbox.css">

</head>
<body>
     <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text" >
                      <h2>예매내역</h2>
                    </div>
            	</div>
        	</div>
       </div>
    </section>
    <!-- Normal Breadcrumb End -->
    
    <!-- 예매내역 Main -->
    <div class="container">
    	<div class="row">
    		<table class="table" style="color:white" >
		       <tr>
			        <th width=10% class="text-center"></th>
			        <th width=10% class="text-center">예매번호</th>
			        <th width=25% class="text-center">영화명</th>
			        <th width=20% class="text-center">극장/상영관</th>
			        <th width=15% class="text-center">관람일시</th>
			        <th width=5% class="text-center">인원</th>
			        <th width=5% class="text-center">좌석</th>
			        <th width=10% class="text-center">결제일시</th>
		       </tr>
		    </table>
		    <table class="table" style="color:white">
		    	<tr>
		    		<th width=10% class="text-left">${vo.poster}</th>
			        <th width=10% class="text-left">${vo.rsvCode}</th>
			        <th width=25% class="text-left">${vo.title}</th>
			        <th width=20% class="text-left">${vo.theater}/${vo.box}</th>
			        <th width=15% class="text-left">${vo.date}</th>
			        <th width=5% class="text-left">인원</th>
			        <th width=5% class="text-left">${vo.seatCd}</th>
			        <th width=10% class="text-left">${vo.rsvDate}</th>
			    </tr>
		    </table>
    	</div>
    </div>
</body>
</html>