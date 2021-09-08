package com.sist.model;
import com.sist.dao.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.MovieVO;
@Controller
public class MovieModel {
	
	@RequestMapping("movieinfo/relmovie.do")
	public String real_movie(HttpServletRequest request, HttpServletResponse response)
	{
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieListData();
		
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../movieinfo/relmovie.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("movieinfo/schmovie.do")
	public String sch_movie(HttpServletRequest request, HttpServletResponse response)
	{
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieListData();
		
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../movieinfo/schmovie.jsp");
		return "../main/main.jsp";
	}
	 
}
