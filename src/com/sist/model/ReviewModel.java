package com.sist.model;

import java.util.*;
import javax.servlet.http.*;

import com.sist.vo.*;
import com.sist.dao.*;
import com.sist.controller.*;

@Controller
public class ReviewModel {
	
	@RequestMapping("review/review_list.do")
	public String review_list(HttpServletRequest request,
							HttpServletResponse response)
	{
		ReviewDAO dao = ReviewDAO.newInstance();
		int totalPage = dao.reviewTotalPage();
		
		String page = request.getParameter("page");
		if(page == null) page = "1";
		int curPage = Integer.parseInt(page);
		
		final int BLOCK = 5;
		int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;
		if(endPage > totalPage) endPage = totalPage;
		
		List<ReviewVO> list = dao.reviewListData(curPage);
		
		request.setAttribute("curpage", curPage);
		request.setAttribute("totalpage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../review/review_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_insert.do")
	public String review_insert(HttpServletRequest request,
							    HttpServletResponse response)
	{
		ReviewDAO dao = ReviewDAO.newInstance();
		List<MovieVO> movieList = dao.currentMovieData();
	    request.setAttribute("movieList", movieList);
	    
	    request.setAttribute("main_jsp", "../review/review_insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("review/review_insert_ok.do")
	public String review_insert_ok(HttpServletRequest request,
								   HttpServletResponse response)
	{
	    try
	    {
	    	request.setCharacterEncoding("UTF-8");
		}
	    catch(Exception ex) {}
		
	    HttpSession hs = request.getSession();
		String id = (String)hs.getAttribute("id");
		String title = request.getParameter("title");
		Double rating = Double.parseDouble(request.getParameter("rating"));
		String satis = request.getParameter("satis");
		String contents = request.getParameter("contents");
		String spoil = request.getParameter("spoil");
		String p_prod = "0";
		String p_perf = "0";
		String p_story = "0";
		String p_visual = "0";
		String p_ost = "0";
		
		ReviewVO vo = new ReviewVO();
		vo.setId(id);
		vo.setTitle(title);
		vo.setRating(rating);
		vo.setSatis(satis);
		vo.setContents(contents);
		vo.setSpoil(spoil);
		vo.setP_prod(p_prod);
		vo.setP_perf(p_perf);
		vo.setP_story(p_story);
		vo.setP_visual(p_visual);
		vo.setP_ost(p_ost);
		
		ReviewDAO dao = ReviewDAO.newInstance();
		dao.reviewInsert(vo);
		
		return "redirect:../review/review_list.do";
	}
	

	@RequestMapping("review/update.do")
	public String review_update(HttpServletRequest request,
								HttpServletResponse response)
	{
		String reviewCD = request.getParameter("reviewCD");

		ReviewDAO dao = ReviewDAO.newInstance();
		ReviewVO vo = dao.reviewUpdateData(Integer.parseInt(reviewCD));

		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../review/update.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("review/update_ok.do")
	public String review_update_ok(HttpServletRequest request,
								   HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}
		catch(Exception ex) {}
		
		String reviewCD = request.getParameter("reviewCD");
		HttpSession hs = request.getSession();
		String id = (String)hs.getAttribute("id");
		String title = request.getParameter("title");
		Double rating = Double.parseDouble(request.getParameter("rating"));
		String satis = request.getParameter("satis");
		String contents = request.getParameter("contents");
		String spoil = request.getParameter("spoil");
		String p_prod = "0";
		String p_perf = "0";
		String p_story = "0";
		String p_visual = "0";
		String p_ost = "0";
		  
		ReviewVO vo = new ReviewVO();
		vo.setReviewCD(Integer.parseInt(reviewCD));
		vo.setId(id);
		vo.setTitle(title);
		vo.setRating(rating);
		vo.setSatis(satis);
		vo.setContents(contents);
		vo.setSpoil(spoil);
		vo.setP_prod(p_prod);
		vo.setP_perf(p_perf);
		vo.setP_story(p_story);
		vo.setP_visual(p_visual);
		vo.setP_ost(p_ost);
		
		ReviewDAO dao = ReviewDAO.newInstance();
		
		boolean bCheck = dao.reviewUpdate(vo);
		 
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("reviewCD", reviewCD);
		
		return "../review/update_ok.jsp";
	}
	
	
	@RequestMapping("review/review_delete.do")
	public String review_delete(HttpServletRequest request,
			 					HttpServletResponse response)
	{
		String reviewCD = request.getParameter("reviewCD");
		request.setAttribute("reviewCD", reviewCD);
		request.setAttribute("main_jsp", "../review/review_delete.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("review/review_delete_ok.do")
	public String review_delete_ok(HttpServletRequest request,
								   HttpServletResponse response)
	{
		String id = request.getParameter("id");
		String reviewCD = request.getParameter("reviewCD");
		  
		ReviewDAO dao = ReviewDAO.newInstance();
		
		boolean bCheck = dao.reviewDelete(Integer.parseInt(reviewCD), id);
		 
		request.setAttribute("bCheck", bCheck);
		return "../review/review_delete_ok.jsp";
	}


}