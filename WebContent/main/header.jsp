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
	$('#logoutBtn').click(function(){
		location.href="../member/logout.do";
	})
})
</script>
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
                                <li class="active"><a href="../main/main.do">Homepage</a></li>
                                <li><a href="../reserve/reserve.do">예매</a></li>
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
                                <li><a href="#">마이페이지</a>
                                	<ul class="dropdown">
                                       	<li><a href="../mypage/reserved_list.do">예매내역</a></li>
                                       	<li><a href="../mypage/pwdcheck.do">회원정보수정</a></li>
                                	</ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right inline">
                    <c:if test="${sessionScope.id==null }">
                    	<a href="../member/login.do" style="color: white;" class="search-switch fas">로그인</a>
                    </c:if>
					<c:if test="${sessionScope.id!=null }">
						  <tr>
						  	<td>${sessionScope.name }(${sessionScope.admin=='y'?"관리자":"일반유저" })</td>
						  	<td>로그인
						  	  <input type="button" value="로그아웃" class="search-switch fas" id="logoutBtn">&nbsp
						  	</td>
						  </tr>
					</c:if>                    
						<a href="#" style="color: white;cursor: pointer;" class="search-switch fas">&#xf002;</a>
					</div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

</body>
</html>