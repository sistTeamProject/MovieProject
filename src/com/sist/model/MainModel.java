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
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
