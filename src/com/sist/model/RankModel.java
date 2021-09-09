package com.sist.model;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieDAO;
import com.sist.vo.MovieVO;
import com.sist.dao.*;
@Controller
public class RankModel {
	@RequestMapping("movieinfo/rank.do")
	public String rank_page(HttpServletRequest request,HttpServletResponse response) {
		
		
		MovieDAO dao=new MovieDAO();
		List<MovieVO> list=dao.movieRankData();

		request.setAttribute("list",list);

		request.setAttribute("main_jsp", "../movieinfo/rank.jsp");
		return "../main/main.jsp";
	}
}
