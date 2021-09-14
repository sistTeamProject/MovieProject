<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.MovieDAO,com.sist.vo.MovieVO"%>
    
<%
	try
	{
		request.setCharacterEncoding("UTF-8");
	}catch(Exception ex){}
	String mno=request.getParameter("mno");
	if(mno==null)
	{
		mno="0";
	}
	MovieDAO dao=new MovieDAO();		
	/* ArrayList<MovieVO> list=dao.movieLiData(Integer.parseInt(mno)); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div style="color:white;font-size:50px;">데이터를 출력해보아요<%-- <%= vo.getDirector()%> --%></div>
		<div style="color:white;font-size:50px;"><%-- <%=vo.getTitle() %> --%></div>

</body>
</html>