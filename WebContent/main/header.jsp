<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.html">
                            <img src="../img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.html">Homepage</a></li>
                                <li><a href="#">예매</a></li>
                                <li><a href="#">영화</a>
                                    <ul class="dropdown">
                                        <li><a href="../movieinfo/relmovie.do">현재 상영 영화</a></li>
                                        <li><a href="../movieinfo/schmovie.do">개봉 예정 영화</a></li>
                                        <li><a href="../movieinfo/rank.do">예매 순위</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">리뷰</a>
                                	<ul class="dropdown">
                                		<li><a href="#">리뷰 작성</a></li>
                                        <li><a href="#">리뷰 게시판</a></li>
                                	</ul>
                                </li>
                                <li><a href="#">회원</a>
                                	<ul class="dropdown">
                                		<li><a href="#">로그인</a></li>
                                        <li><a href="#">회원가입</a></li>
                                        <li><a href="#">마이 페이지</a></li>
                                	</ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        <a href="./login.html"><span class="icon_profile"></span></a>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

</body>
</html>