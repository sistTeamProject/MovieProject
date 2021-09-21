package com.sist.model;
import com.sist.dao.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.MovieVO;
@Controller
public class MovieModel {
	// 현재 상영 영화 총페이지
	@RequestMapping("movieinfo/relmovie.do")
	public String real_movie(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
		  page="1";
		int curpage=Integer.parseInt(page);
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieRealData(curpage);
		int totalpage=dao.RelmovieTotalPage();
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			 endPage=totalpage;
		   
		request.setAttribute("curpage", curpage);//현재페이지
		request.setAttribute("totalpage", totalpage);//총페이지
		
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		   
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../movieinfo/relmovie.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("movieinfo/schmovie.do")
	public String sch_movie(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
		  page="1";
		int curpage=Integer.parseInt(page);
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieSchData(curpage);
		int totalpage=dao.SchmovieTotalPage();
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			 endPage=totalpage;
		
		request.setAttribute("curpage", curpage);//현재페이지
		request.setAttribute("totalpage", totalpage);//총페이지
		
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		   
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../movieinfo/schmovie.jsp");
		return "../main/main.jsp";
	}
	 
}
