package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
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
		  request.setAttribute("main_jsp", "../movieinfo/details.jsp");
		  return "../main/main.jsp";
		  //return "../movieinfo/detail_main.jsp";
	  }
	
	@RequestMapping("movieinfo/detail_story.do")
	public String detail_story(HttpServletRequest request,HttpServletResponse response)
	{
		String mno=request.getParameter("mno");
		MovieDAO dao=new MovieDAO();		
		MovieVO vo=dao.movieDetailData(Integer.parseInt(mno));
		
		request.setAttribute("vo", vo);
		
		return "../movieinfo/detail_story.jsp";
	}
	
	@RequestMapping("movieinfo/detail_people.do")
	public String detail_people(HttpServletRequest request,HttpServletResponse response)
	{
		String mno=request.getParameter("mno");
		MovieDAO dao=new MovieDAO();		
		MovieVO vo=dao.movieDetailData(Integer.parseInt(mno));
		
		request.setAttribute("vo", vo);
		
		return "../movieinfo/detail_people.jsp";
	}
	
	@RequestMapping("movieinfo/detail_video.do")
	public String detail_video(HttpServletRequest request,HttpServletResponse response)
	{
		String mno=request.getParameter("mno");
		MovieDAO dao=new MovieDAO();		
		MovieVO vo=dao.movieDetailData(Integer.parseInt(mno));
		
		request.setAttribute("vo", vo);
		
		return "../movieinfo/detail_video.jsp";
	}
	
	@RequestMapping("movieinfo/detail_recommand.do")
	public String detail_recommand(HttpServletRequest request,HttpServletResponse response)
	{
		String mno=request.getParameter("mno");
		String genre=request.getParameter("genre");
		MovieDAO dao=new MovieDAO();
		if(genre.indexOf(",")!=-1)
		{
			genre=genre.trim().substring(0,genre.indexOf(","));
			List<MovieVO> rvo=dao.movieRecommandData(genre);
			request.setAttribute("rvo",rvo);
		}
		else
		{
			List<MovieVO> rvo=dao.movieRecommandData(genre);
			request.setAttribute("rvo",rvo);
		}
		
		System.out.println("장르:"+genre);
				
		return "../movieinfo/detail_recommand.jsp";
		//request.setAttribute("main_jsp", "../movieinfo/relmovie.jsp");
		//return "../main/main.jsp";
	}
	
}
