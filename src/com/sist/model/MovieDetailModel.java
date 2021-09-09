package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MovieDetailModel {
	@RequestMapping("movieinfo/details.do")
	  public String movie_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 영화번호 ==> DAO에 전송 ==> 처리후에 MovieVO를 넘겨준다 => JSP전송 (request.setAttribute())
		  String mno=request.getParameter("mno");
		  MovieDAO dao=new MovieDAO();
		  // MovieVO 를 받는다 
		  MovieVO vo=dao.movieDetailData(Integer.parseInt(mno));
		  // request에 값을 담아준다 
		  request.setAttribute("vo", vo);
		  return "../movieinfo/details.jsp";
	  }
}