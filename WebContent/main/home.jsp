<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
            	<c:forEach var="vo" items="${list }">
	                <div class="hero__items set-bg" data-setbg="${vo.poster }">
	                    <div class="row">
	                        <div class="col-lg-6">
	                            <div class="hero__text">
	                                <div class="label">${vo.genre }</div>
	                                <h2>${vo.title }</h2>
	                                <p>
		                                <c:choose>
											<c:when test="${fn:length(vo.story) gt 101}">
										        <c:out value="${fn:substring(vo.story, 0, 100)}...">
										        </c:out>
										    </c:when>
										    <c:otherwise>
										        <c:out value="${vo.story}">
										        </c:out>
										    </c:otherwise>
										</c:choose>
	                                </p>
	                                <a href="../movieinfo/details.do?mno=${vo.mno }"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
			<div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>최근 개봉 영화</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="../movieinfo/relmovie.do" class="primary-btn">전체보기 <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        	<c:forEach var="vo1" items="${left1 }">
	                            <div class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic set-bg" data-setbg="${vo1.poster }">
	                                        <div class="comment">${vo1.genre }</div>
	                                        <div class="view"><i class="fa fa-eye"></i> ${vo1.showUser }</div>
	                                    </div>
	                                    <div class="product__item__text">
	                                        <ul>
	                                            <li>${vo1.director }</li>
	                                        </ul>
	                                        <h5><a href="../movieinfo/details.do?mno=${vo1.mno }">${vo1.title }</a></h5>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
	<!--  -->
					<div class="popular__product">
		                <div class="row">
		                    <div class="col-lg-8 col-md-8 col-sm-8">
		                        <div class="section-title">
		                            <h4>인기 영화</h4>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 col-md-4 col-sm-4">
		                        <div class="btn__all">
		                            <a href="../movieinfo/rank.do" class="primary-btn">전체보기 <span class="arrow_right"></span></a>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                	<c:forEach var="vo2" items="${left2 }">
		                     <div class="col-lg-4 col-md-6 col-sm-6">
		                         <div class="product__item">
		                             <div class="product__item__pic set-bg" data-setbg="${vo2.poster }">
		                                 <div class="comment">${vo2.genre }</div>
		                                 <div class="view"><i class="fa fa-eye"></i> ${vo2.showUser }</div>
		                             </div>
		                             <div class="product__item__text">
		                                 <ul>
		                                     <li>${vo2.director }</li>
		                                 </ul>
		                                 <h5><a href="../movieinfo/details.do?mno=${vo2.mno }">${vo2.title }</a></h5>
		                             </div>
		                         </div>
		                     </div>
		                    </c:forEach>
		                </div>
		            </div>
		<!--  -->
					<div class="live__product">
		                <div class="row">
		                    <div class="col-lg-8 col-md-8 col-sm-8">
		                        <div class="section-title">
		                            <h4>개봉 예정 영화</h4>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 col-md-4 col-sm-4">
		                        <div class="btn__all">
		                            <a href="../movieinfo/schmovie.do" class="primary-btn">전체보기 <span class="arrow_right"></span></a>
		                        </div>
		                    </div>
		                </div>
		                <div class="row">
		                	<c:forEach var="vo3" items="${left3 }">
		                     <div class="col-lg-4 col-md-6 col-sm-6">
		                         <div class="product__item">
		                             <div class="product__item__pic set-bg" data-setbg="${vo3.poster }">
		                                 <div class="comment">${vo3.genre }</div>
		                                 <div class="view"><i class="fa fa-eye"></i> ${vo3.showUser }</div>
		                             </div>
		                             <div class="product__item__text">
		                                 <ul>
		                                     <li>${vo3.director }</li>
		                                 </ul>
		                                 <h5><a href="../movieinfo/details.do?mno=${vo3.mno }">${vo3.title }</a></h5>
		                             </div>
		                         </div>
		                     </div>
		                    </c:forEach>
		                </div>
	                </div>
				</div>
		<!-- 오른쪽 -->
	                <div class="col-lg-4 col-md-6 col-sm-8">
	                    <div class="product__sidebar">
	                        <div class="product__sidebar__view">
	                            <div class="section-title">
	                                <h5>최다 관객 동원</h5>
	                            </div>
	                            <div class="filter__gallery">
	                            	<c:forEach var="vo4" items="${right4 }">
		                                <div class="product__sidebar__view__item set-bg mix day years"
		                                data-setbg="${vo4.poster }">
			                                <div class="view"><i class="fa fa-eye"></i> ${vo4.showUser }</div>
			                                <h5><a href="../movieinfo/details.do?mno=${vo4.mno }">${vo4.title }</a></h5>
			                            </div>
		                            </c:forEach>
	        					</div>
	    					</div>
		<!--  -->
						    <div class="product__sidebar__view">
	                            <div class="section-title">
	                                <h5>최근 리뷰 작성</h5>
	                            </div>
	                            <div class="filter__gallery">
	                            	<c:forEach var="vo5" items="${right5 }">
		                                <div class="product__sidebar__view__item set-bg mix day years"
		                                data-setbg="${vo5.poster }">
			                                <div class="view"><i class="fa fa-eye"></i> ${vo5.showUser }</div>
			                                <h5><a href="../movieinfo/details.do?mno=${vo5.mno }">${vo5.title }</a></h5>
			                            </div>
		                            </c:forEach>
	        					</div>
	    					</div>
	    				</div>
					</div>	
				</div>
			</div>
	</section>
<!-- Product Section End -->


</body>
</html>