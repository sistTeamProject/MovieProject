package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MovieDAO;
import com.sist.vo.MovieVO;

@Controller
public class SearchModel {
	@RequestMapping("search/search.do")
	public String search_search(HttpServletRequest request,HttpServletResponse response){
		//검색어 받기
		try {
			request.setCharacterEncoding("UTF-8");
		}catch (Exception e) {}
		String fd=request.getParameter("fd");
		//검색
		MovieDAO dao=MovieDAO.newInstance();
		List<MovieVO> tList=dao.searchMovieData(fd, "title");
		List<MovieVO> dList=dao.searchMovieData(fd, "director");
		List<MovieVO> aList=dao.searchMovieData(fd, "actor");
		//전송
		request.setAttribute("tList", tList);
		request.setAttribute("dList", dList);
		request.setAttribute("aList", aList);
		request.setAttribute("fd", fd);
		request.setAttribute("main_jsp", "../search/search_result.jsp");
		return "../main/main.jsp";
	}
}
