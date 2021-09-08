package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;

@Controller
public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/idcheck.do")
	public String member_idcheck(HttpServletRequest request, HttpServletResponse response) {
		//사용자가 보내준 ID 받기
		String id=request.getParameter("id");
		
		//받은 ID가 DAO에 있는지, 없는지 확인
		MemberDAO dao=MemberDAO.newInstance();
		int count=dao.memberidCheck(id);
		
		//결과값 넘기기
		request.setAttribute("count", count);
		return "../member/idcheck_result.jsp";
	}
	
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../member/login.jsp";
	}
	
	@RequestMapping("member/mypage.do")
	public String member_mypage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/mypage.jsp");
		return "../member/mypage.jsp";
	}
}
