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
	
	
	@RequestMapping("mypage/pwdcheck.do")
	public String pwdcheck(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/pwdcheck.jsp");
		return "../main/main.jsp";
		
	}
	
	@RequestMapping("mypage/pwdcheck_result.do")
	public String pwdcheck_result(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/pwdcheck_result.jsp");
		return "../main/main.jsp";
		
	}
	
	@RequestMapping("mypage/edit_info.do")
	public String mypage_editInfo(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/edit_info.jsp");
		return "../main/main.jsp";
		
	}
}
