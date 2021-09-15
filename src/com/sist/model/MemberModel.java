package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MemberModel {
	// 1. 회원가입 페이지
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
	
	// 1-1. 회원가입 ▶ ID 중복체크
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
	
	// 1-2. 회원가입 ▶ 우편번호 찾기
	@RequestMapping("member/postfind.do")
	  public String member_postfind(HttpServletRequest request,HttpServletResponse response){
		 try
		  {
			  request.setCharacterEncoding("UTF-8");//디코딩 => post방식일때만 사용
		  }catch(Exception ex) {}
		 //사용자가 보내준 dong 받기
		 String dong=request.getParameter("dong");
		 
		 // DAO를 연결해서 데이터 읽기
		 MemberDAO dao=MemberDAO.newInstance();
		 List<ZipcodeVO> list=dao.postfind(dong);
		 int count=dao.postfindCount(dong);
		 
		 //결과값 넘기기
		 request.setAttribute("list", list);
		 request.setAttribute("count", count);
		 return "../member/postfind_result.jsp";
	  }
	
	// 1-3. 회원가입 완료
	@RequestMapping("member/join_ok.do")
	  public String member_join_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String id=request.getParameter("id");//스프링 => 매개변수 (MemberVO vo)
		  String pwd=request.getParameter("pwd");
		  String name=request.getParameter("name");
		  String sex=request.getParameter("sex");
		  String birthday=request.getParameter("birthday");
		  String email=request.getParameter("email");// UNIQUE  => 아이디 찾기
		  String post1=request.getParameter("post1");
		  String post2=request.getParameter("post2");
		  String addr1=request.getParameter("addr1");
		  String addr2=request.getParameter("addr2");
		  String tel1=request.getParameter("tel1");// UNIQUE => 아이디 찾기 (후보키)
		  String tel2=request.getParameter("tel2");//
		  String tel3=request.getParameter("tel3");//
		  
		  MemberVO vo=new MemberVO();
		  vo.setId(id);
		  vo.setPwd(pwd);
		  vo.setName(name);
		  vo.setSex(sex);
		  vo.setBirthday(birthday);
		  vo.setEmail(email);
		  vo.setPost(post1+"-"+post2);
		  vo.setAddr1(addr1);
		  vo.setAddr2(addr2);
		  vo.setTel(tel1+"-"+tel2+"-"+tel3);
		  // DAO로 전송 
		  MemberDAO dao=MemberDAO.newInstance();
		  dao.memberJoinInsert(vo);
		  
		  return "redirect:../main/main.do";// main에서 회원가입 데이터가 필요가 없다 (request초기화)
		  // sendRedirect() ==> DispatcherServlet => redirect:
	  }
	
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../member/login.jsp");
		return "../main/main.jsp";
	}

	
	@RequestMapping("member/login_result.do")
		public String member_login_result(HttpServletRequest request,HttpServletResponse response) {
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			
			MemberDAO dao=MemberDAO.newInstance();
			String result=dao.isLogin(id, pwd);
			if(!(result.equals("NOID")||result.equals("NOPWD"))) {
				HttpSession session=request.getSession();
				StringTokenizer st=new StringTokenizer(result,"|");
				String name=st.nextToken();
				String admin=st.nextToken();
				//
				session.setAttribute("id", id);
				session.setAttribute("admin", admin);
				session.setAttribute("name", name);
				result="OK";
			}
			  request.setAttribute("result", result);
			  return "../member/login_result.jsp";
		}
	
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
	
}
