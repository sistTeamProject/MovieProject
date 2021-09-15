package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MypageModel {
	@RequestMapping("mypage/reserved_list.do")
	public String mypage_reservedList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/reserved_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/edit_info.do")
	public String mypage_editInfo(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/edit_info.jsp");
		return "../main/main.jsp";
		
	}
	
}
