package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class RankModel {
	@RequestMapping("list/rank.do")
	public String rank_page(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../list/rank.jsp");
		return "../main/main.jsp";
	}
}
