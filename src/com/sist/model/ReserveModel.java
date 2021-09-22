package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.vo.*;

@Controller
public class ReserveModel {
	@RequestMapping("reserve/reserve.do")
	public String reserve(HttpServletRequest request,HttpServletResponse response) {
		ReserveDAO dao=ReserveDAO.newInstance();
		List<MovieVO> list=dao.movieSelect();
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../reserve/reserve.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/movie_list.do")
	public String movie_list(HttpServletRequest request,HttpServletResponse response) {
		ReserveDAO dao=ReserveDAO.newInstance();
		List<MovieVO> list=dao.movieSelect();
		request.setAttribute("list", list);
		return "../reserve/movie_list.jsp";
	}
	@RequestMapping("reserve/date.do")
	public String reserve_date(HttpServletRequest request,HttpServletResponse response) {
		// 사용자 요청한 데이터 => 년도/월
		String strYear=request.getParameter("year");
		String strMonth=request.getParameter("month");

		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		String today=sdf.format(date);
		
		StringTokenizer st=new StringTokenizer(today,"-");
		
		String sy=st.nextToken();
		String sm=st.nextToken();
		String sd=st.nextToken();
		
		if(strYear==null)
			strYear=sy;
		if(strMonth==null)
			strMonth=sm;
		
		int year=Integer.parseInt(strYear);
		int month=Integer.parseInt(strMonth);
		int day=Integer.parseInt(sd);
		//1. 1월 1일부터 전년도까지의 총합
		int total=(year-1)*365
				+(year-1)/4
				-(year-1)/100
				+(year-1)/400;
		//2. 1월 1일 - 전달까지의 합
		int[] lastday= {31,28,31,30,31,30,
						31,31,30,31,30,31};
		if((year%4==0 && year%100!=0) ||(year%400==0))
		{
			lastday[1]=29;
		}else
			lastday[1]=28;
		
		for(int i=0;i<month-1;i++) {
			total+=lastday[i];
		}
		//3. +1=> 각달의 1일
		total++;
		//4. (1+2+3)%7 ==> 요일계산 => 윤년 공식
		int week=total%7;
		String[] strWeek= {"일","월","화","수","목","금","토"};
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday[month-1]);
		request.setAttribute("strWeek", strWeek);
		return "../reserve/date.jsp";
	}
}
