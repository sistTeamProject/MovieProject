<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8" %>
    
<%@ taglib prefix="c"
		   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>영화 : 리뷰 메인페이지</title>
<link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/
            bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.page
{
	display:block;
	width:100%;
	text-align:center;
	clear:both;
}
.page li
{
	display:inline-block;
	margin:0 2px 0 0;
}
.page li:last-child
{
	margin-right:0;
}
.page a, .page strong
{
	display:block;
	padding:8px 11px;
	border:1px solid;
	font-weight:normal;
}
</style>
</head>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>

<body>

  <div class="breadcrumb-option">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="breadcrumb__links">
            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
            <a href="./categories.html">Movie</a>
            <span>Review</span>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="anime-details spad">
  <div class="anime-details review">
   <table class="table">
     <tr>
      <td class="text-right">
        <a href="../review/review_insert.do" class="btn btn-sm btn-danger">리뷰 작성하기</a>
      </td>
     </tr>
   </table>
   
   <c:forEach var="vo" items="${list}">
     <div class="anime__review__item">
       <div class="anime__review__item__text">
         <table class="table">
           <tr>
             <td width=75% style="color:gray;">
         	   <p>${vo.reviewCD} - ${vo.title} - ${vo.rating}</p>
           	 </td>
         	 <td width=25% class="text-right">
         	   <span style="color:gray; font-style:italic">${vo.regdate}</span>
         	   <h6>
         	     <a href="#.do">추천 : ${vo.likes}</a>
         	     <a href="#.do">비추천 : ${vo.dislike}</a>
         	   </h6>
         	 </td>
           </tr>
         </table>
         <p>${vo.contents}</p>
       </div>
     </div>
   </c:forEach>

	<nav class="page">
      <ul>
        <c:if test="${ startPage > 1 }">
          <li><a href="../review/review_list.do?page=${ startPage-1 }">&laquo; 이전</a></li>
        </c:if>
        <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
          <c:if test="${ i==curpage }">
            <li class="current"><strong>${ i }</strong></li>
          </c:if>
          <c:if test="${ i!=curpage }">
            <li><a href="../review/review_list.do?page=${ i }">${ i }</a></li>
          </c:if>
        </c:forEach>
        <c:if test="${ endPage < totalpage }">
          <li><a href="../review/review_list.do?page=${ endPage + 1 }}">다음 &raquo;</a></li>
        </c:if>
      </ul>
    </nav>
    
<!--
   <table class="table">
     <tr>
       <td class="text-center" style="color:rgb(255, 0, 0);">
         <a href="../review/review_list.do?page=${curPage > 1 ? curPage - 1 : curPage}"
            class="btn btn-sm btn-primary">이전</a>
          ${curPage} Page / ${totalPage} Pages
         <a href="../review/review_list.do?page=${curPage < totalPage ? curPage + 1 : curPage}"
  	 	    class="btn btn-sm btn-primary">다음</a>
       </td>
     </tr>
   </table>
-->
   </div>
</div>
                
</body>

</html>