<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1
	  		/css/bootstrap.min.css">
	  		
<style>

</style>

</head>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>

<body>

<div class="anime-details spad">
   <div class="anime-details review">
   <h6>리뷰 작성 페이지</h6>
   <form method="post" action="../review/review_insert_ok.do" id="form">
      <table class="table">
       <tr>
         <th class="text-center" width=15%>
            <span style="color:white;">영화 제목 : </span>
         </th>
         <td class="text-center" width=85%>
         	<select name=title id=title>
         		<option value=""> </option>
		   	    <c:forEach var="vo" items="${movieList}">
		   			<option value="${vo.title}">${vo.title}</option>
         		</c:forEach>
       		</select>
         </td>
       </tr>
       
       <tr>
         <th class="text-center" width=15%>
            <span style="color:white;">평점 : </span>
         </th>
         <td class="text-center" width=85%>
         	<select name=rating id=rating>
         		<option value="10.0">10</option>
         		<option value="9.0">9</option>
         		<option value="8.0">8</option>
         		<option value="7.0">7</option>
         		<option value="6.0">6</option>
         		<option value="5.0">5</option>
         		<option value="4.0">4</option>
         		<option value="3.0">3</option>
         		<option value="2.0">2</option>
         		<option value="1.0">1</option>
       		</select>
         </td>
       </tr>
       
       <tr>
         <th class="text-center" width=15%>
            <span style="color:white;">만족도 : </span>
         </th>
         <td class="text-left" style="color:white;" width=85%>
         	<input type="radio" id="satis" name="satis" value="5"/> 높음
         	<input type="radio" id="satis" name="satis" value="3"/> 중간
         	<input type="radio" id="satis" name="satis" value="1"/> 낮음
         </td>
       </tr>
       
       <tr>
         <th width="15%" class="text-center">
         	<span style="color:white;">리뷰 내용 : </span>
         </th>
       	 <td width="85%">
       		<textarea rows="10" cols="60" name=contents></textarea>
       	 </td>
       </tr>
       <!--
       <tr>
         <th class="text-center" >
            <span style="color:white;">감상 포인트 : </span>
         </th>
         <td class="checkbox" style="color:white;" width=85%>
         	연출 : <input type="checkbox" name="point[0]" value="1"/>
         	연기 : <input type="checkbox" name="point[1]" value="1"/>
         	스토리 : <input type="checkbox" name="point[2]" value="1"/>
         	영상미 : <input type="checkbox" name="point[3]" value="1"/>
         	OST : <input type="checkbox" name="point[4]" value="1"/>
         </td>
       </tr>
       -->
       <tr>
         <th class="text-center" width=15%>
            <span style="color:white;">스포일러 포함 여부 </span>
         </th>
         <td class="text-left" style="color:white;" width=85%>
         	<input type="radio" id="spoil" name="spoil" value="1"/>
         	네, 스포일러가 포함되어 있습니다. <br>
         	<input type="radio" id="spoil" name="spoil" value="0"/>
         	아니오, 스포일러가 포함되어 있지 않습니다.
         </td>
       </tr>
       
       <tr>
        <td class="text-center" colspan="2">
          <input type=submit value="수정하기" class="btn btn-sm btn-danger">
          <input type=button value="취소" class="btn btn-sm btn-success"
            onclick="javascript:history.back()"
          >
        </td>
       </tr>
       
      </table>
      </form>
     </div>
   </div>
</body>
</html>

