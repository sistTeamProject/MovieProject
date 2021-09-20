<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table1">		
		<tr>
	      <td class="text-left" style="color:white;font-size:20px;">
	        	감독 : ${vo.director }
	      </td>
	    </tr>
	    
	    <tr class="people">
	      <td class="text-left" style="color:white;font-size:20px;">
	        	출연 : ${vo.actor }
	      </td>
		</tr>
    </table>
</body>
</html>