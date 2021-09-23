<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list{
	margin:0px auto;
	text-align:center;
}
</style>
</head>

<body>

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="list" style="width:900px;">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>장르 영화 Top 4
                                        
                                           <%-- ${rvo.genre}를 좋아하신다면..  --%> 
                                        </h4>
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
                        <c:forEach var="rvo" items="${rvo }">
                            <div class="col-lg-3">
                                <div class="product__item">
                               <%--  <div>
                    		<img src="${vo.poster}" width="270" height="400">
                    	</div> --%>
                                   <%--<div class="product__item__pic set-bg" data-setbg="${rvo.poster }" style="width:170px;height:300px;cursor:pointer" OnClick="location.href ='details.do?mno=${rvo.mno }'">--%>
                                   <div><img src="${rvo.poster}" style="width:300px;height:300px;cursor:pointer" OnClick="location.href ='details.do?mno=${rvo.mno }'"></div>
                                        
                                        <!-- <div class="ep">18 / 18</div>
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div> -->
                                    <%--</div> --%>
                                    <div>
                                    <table style="height:60px">
                                    	<tr>                                  	
                                  		<th>
                                        <span style="font-size:20px;color:white;overflow: hidden; text-overflow: ellipsis;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;">&nbsp;${rvo.title }</span>
                                    	</th>
                                    	</tr>
                                    </table>
                                        
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>            
                </div>

</div>
</div>
</section>

</body>

</html>