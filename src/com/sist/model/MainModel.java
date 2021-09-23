package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieDAO;
import com.sist.vo.MovieVO;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request,HttpServletResponse response) {
		MovieDAO dao=MovieDAO.newInstance();
		List<MovieVO> list=dao.homeSliderData();
		List<MovieVO> left1=dao.homeMovieList(1, "regdate DESC");
		List<MovieVO> left2=dao.homeMovieList(1, "reserve DESC");
		List<MovieVO> left3=dao.homeMovieList(2, "regdate ASC");
		List<MovieVO> right4=dao.homeMovieList(1, "showUser DESC");
		List<MovieVO> right5=dao.homeRecentReviewList();		
		
		request.setAttribute("list", list);
		request.setAttribute("left1", left1);
		request.setAttribute("left2", left2);
		request.setAttribute("left3", left3);
		request.setAttribute("right4", right4);
		request.setAttribute("right5", right5);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
