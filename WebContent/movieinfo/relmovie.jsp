<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>현재 상영 영화</h4>
                                    </div>
                                </div>
                                <!-- <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <div class="row">
                        <c:forEach var="vo" items="${list }">
                            <div class="col-lg-3">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="${vo.poster }" style="width:270px;height:400px;cursor:pointer" OnClick="location.href ='details.do?mno=${vo.mno }'">
                                        <!-- <div class="ep">18 / 18</div>
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div> -->
                                    </div>
                                    <div class="product__item__text">
                                    <h3>
                                    	<c:choose>
                                        	<c:when test="${vo.grade eq ' 전체 관람가'}"><span style="border-radius:50%;background-color:green;font-size:15px;color:white">전체</span></c:when>
                                        	<c:when test="${vo.grade eq ' 12세 관람가'}"><span style="border-radius:50%;background-color:deepskyblue;font-size:15px;color:white">12</span></c:when>
                                        	<c:when test="${vo.grade eq ' 15세 관람가'}"><span style="border-radius:50%;background-color:orange;font-size:15px;color:white">15</span></c:when>
                                        	<c:when test="${vo.grade eq ' 청소년 관람불가'}"><span style="border-radius:50%;background-color:red;font-size:15px;color:white">청불</span></c:when>
                                  		</c:choose>
                                        <span style="font-size:17px;color:white">${vo.title }</span>>
                                    </h3>
                                        <table>
                                        	<tr>
                                        		<th style="font-size:15px;color:white">예매율 ${vo.reserve }</th>
                                        		<th style="font-size:15px;color:red">&nbsp;&nbsp;평점 ${vo.score }</th>
                                        	</tr>
                                        </table>  
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="product__pagination inline" align="center">
                    	<c:forEach var="i" begin="1" end="${totalpage }">
                        	<c:if test="${curpage==i }">
                        		<c:set var="ss" value="current-page"/>
                        	</c:if>
                        	<c:if test="${curpage!=i }">
                        		<c:set var="ss" value=""/>
                        	</c:if>
                        <a href="../movieinfo/relmovie.do?page=${i }">${i}</a>
                        </c:forEach>
                        <!-- <a href="#"><i class="fa fa-angle-double-right"></i></a> -->
                    </div> 
                </div>

</div>
</div>
</section>
<!-- Product Section End -->
</body>
</html>