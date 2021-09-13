package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

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
		
		//전송
		request.setAttribute("fd", fd);
		request.setAttribute("main_jsp", "../search/search_result.jsp");
		return "../main/main.jsp";
	}
}
