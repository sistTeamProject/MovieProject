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
<section class="product-page spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="product__page__content">
					<div class="product__page__title">
						<div class="row">
								<div class="section-title">
									<h4>"${fd }" 영화제목 검색 결과</h4>
								</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="tvo" items="${tList }">
							<div class="col-lg-3">
								<div class="product__item">
                                    <a href="../movieinfo/details.do?mno=${tvo.mno }"><img src="${tvo.poster }" style="width: 270px;cursor: pointer;" onclick="location.href ='details.do?mno=${tvo.mno }'"></a>
									<div>
										<table style="height:60px">
											<tr>
												<th>
													<c:choose>
														<c:when test="${tvo.grade eq ' 전체 관람가'}"><span style="border-radius:50%;background-color:green;font-size:15px;color:white">전체</span></c:when>
														<c:when test="${tvo.grade eq ' 12세 관람가'}"><span style="border-radius:50%;background-color:deepskyblue;font-size:15px;color:white">12</span></c:when>
														<c:when test="${tvo.grade eq ' 15세 관람가'}"><span style="border-radius:50%;background-color:orange;font-size:15px;color:white;">15</span></c:when>
														<c:when test="${tvo.grade eq ' 청소년 관람불가'}"><span style="border-radius:50%;background-color:red;font-size:15px;color:white">청불</span></c:when>
													</c:choose>
												</th>
												<th>
													<span style="font-size:20px;color:white;overflow: hidden; text-overflow: ellipsis;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;">&nbsp;${tvo.title }</span>
												</th>
											</tr>
										</table>
										<table>
											<tr>
												<th style="font-size:15px;color:white">예매율 ${tvo.reserve }</th>
											</tr>
										</table>  
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<hr>
					<div class="product__page__title">
						<div class="row">
								<div class="section-title">
									<h4>"${fd }" 배우 검색 결과</h4>
								</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="avo" items="${aList }">
							<div class="col-lg-3">
								<div class="product__item">
                                    <a href="../movieinfo/details.do?mno=${avo.mno }"><img src="${avo.poster }" style="width: 270px;cursor: pointer;" onclick="location.href ='details.do?mno=${avo.mno }'"></a>
									<div>
										<table style="height:60px">
											<tr>
												<th>
													<c:choose>
														<c:when test="${avo.grade eq ' 전체 관람가'}"><span style="border-radius:50%;background-color:green;font-size:15px;color:white">전체</span></c:when>
														<c:when test="${avo.grade eq ' 12세 관람가'}"><span style="border-radius:50%;background-color:deepskyblue;font-size:15px;color:white">12</span></c:when>
														<c:when test="${avo.grade eq ' 15세 관람가'}"><span style="border-radius:50%;background-color:orange;font-size:15px;color:white;">15</span></c:when>
														<c:when test="${avo.grade eq ' 청소년 관람불가'}"><span style="border-radius:50%;background-color:red;font-size:15px;color:white">청불</span></c:when>
													</c:choose>
												</th>
												<th>
													<span style="font-size:20px;color:white;overflow: hidden; text-overflow: ellipsis;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;">&nbsp;${avo.title }</span>
												</th>
											</tr>
										</table>
										<table>
											<tr>
												<th style="font-size:15px;color:white">예매율 ${avo.reserve }</th>
											</tr>
										</table>  
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<hr>
					<div class="product__page__title">
						<div class="row">
								<div class="section-title">
									<h4>"${fd }" 감독 검색 결과</h4>
								</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="dvo" items="${dList }">
							<div class="col-lg-3">
								<div class="product__item">
                                    <a href="../movieinfo/details.do?mno=${dvo.mno }"><img src="${dvo.poster }" style="width: 270px;cursor: pointer;" onclick="location.href ='details.do?mno=${dvo.mno }'"></a>
									<div>
										<table style="height:60px">
											<tr>
												<th>
													<c:choose>
														<c:when test="${dvo.grade eq ' 전체 관람가'}"><span style="border-radius:50%;background-color:green;font-size:15px;color:white">전체</span></c:when>
														<c:when test="${dvo.grade eq ' 12세 관람가'}"><span style="border-radius:50%;background-color:deepskyblue;font-size:15px;color:white">12</span></c:when>
														<c:when test="${dvo.grade eq ' 15세 관람가'}"><span style="border-radius:50%;background-color:orange;font-size:15px;color:white;">15</span></c:when>
														<c:when test="${dvo.grade eq ' 청소년 관람불가'}"><span style="border-radius:50%;background-color:red;font-size:15px;color:white">청불</span></c:when>
													</c:choose>
												</th>
												<th>
													<span style="font-size:20px;color:white;overflow: hidden; text-overflow: ellipsis;display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;">&nbsp;${dvo.title }</span>
												</th>
											</tr>
										</table>
										<table>
											<tr>
												<th style="font-size:15px;color:white">예매율 ${dvo.reserve }</th>
											</tr>
										</table>  
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
                    <%-- <div class="product__pagination inline" align="center">
                    	<c:forEach var="i" begin="1" end="${totalpage }">
                    	
                        	<c:if test="${curpage==i }">
                        		<a href="../movieinfo/relmovie.do?page=${i }" class="current-page">${i}</a>
                        	</c:if>
                        	<c:if test="${curpage!=i }">
                        		<a href="../movieinfo/relmovie.do?page=${i }">${i}</a>                       		
                        	</c:if>
                        
                        </c:forEach>
                        <!-- <a href="#" class="current-page">1</a> -->
                        <!-- <a href="#"><i class="fa fa-angle-double-right"></i></a> -->
                    </div>  --%>
			</div>
		</div>
	</div>
</section>
</body>
</html>