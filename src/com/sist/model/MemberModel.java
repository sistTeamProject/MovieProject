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
	/*======================================================================================
									회원가입 페이지
	========================================================================================*/
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

	
	
	
	
	
	/*======================================================================================
										로그인 페이지
	========================================================================================*/

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
	
	
	
	/*======================================================================================
											마이페이지
	========================================================================================*/
	//1. 예매내역
	@RequestMapping("mypage/reserved_list.do")
	public String mypage_reservedList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/reserved_list.jsp");
		return "../main/main.jsp";
	}
	
	
	//2. 회원정보수정
	@RequestMapping("mypage/edit_info.do")
	public String mypage_editInfo(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		MemberDAO dao=MemberDAO.newInstance();
		MemberVO vo=dao.memberInfo(id);
		String post1=vo.getPost().substring(0,3);
		String post2=vo.getPost().substring(4);
		String tel=vo.getTel();
		String tel2=tel.substring(4,tel.lastIndexOf("-"));
		String tel3=tel.substring(tel.lastIndexOf("-")+1);
		
		request.setAttribute("vo", vo);
		request.setAttribute("post1", post1);
		request.setAttribute("post2", post2);
		request.setAttribute("tel2", tel2);
		request.setAttribute("tel3", tel3);
		request.setAttribute("main_jsp", "../mypage/edit_info.jsp");
		return "../main/main.jsp";
		
	}
	
	@RequestMapping("mypage/edit_info_ok.do")
	public String mypage_editInfoOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch (Exception e) {}
		HttpSession session=request.getSession();
		MemberVO vo=new MemberVO();
		vo.setId((String)session.getAttribute("id"));
		String pwd=request.getParameter("pwd");
		if(pwd!="") {
			vo.setPwd(pwd);
		}
		vo.setName(request.getParameter("name"));
		vo.setSex(request.getParameter("sex"));
		vo.setBirthday(request.getParameter("birthday"));
		vo.setEmail(request.getParameter("email"));
		String post=request.getParameter("post1")+"-"+request.getParameter("post2");
		vo.setPost(post);
		vo.setAddr1(request.getParameter("addr1"));
		vo.setAddr2(request.getParameter("addr2"));
		String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		vo.setTel(tel);
		
		MemberDAO dao=MemberDAO.newInstance();
		dao.memberInfoEdit(vo);
		return "redirect:../mypage/edit_info.do";
	}
	
	
	@RequestMapping("mypage/pwdcheck.do")
	public String pwdcheck(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/pwdcheck.jsp");
		return "../main/main.jsp";
		
	}
	
	@RequestMapping("mypage/pwdcheck_result.do")
	public String pwdcheck_result(HttpServletRequest request, HttpServletResponse response) {
		// 세션 아이디 받기
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		// 사용자가 보내준 PWD값 받기
		String pwd=request.getParameter("pwd");
		
		// 받은 pwd가 session에 저장된 pwd와 일치하는지 확인
		MemberDAO dao=MemberDAO.newInstance();
		boolean bCheck=dao.memberPwdCheck(id, pwd);
		 
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("main_jsp", "../mypage/pwdcheck_result.jsp");
		return "../main/main.jsp";
		
	}
	
	
}
