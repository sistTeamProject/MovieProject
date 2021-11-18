package com.sist.dao;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

import com.sist.vo.CinemaVO;
import com.sist.vo.MovieVO;

import java.util.*;

public class ReserveDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ReserveDAO dao;
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	//  싱글턴 
	public static ReserveDAO newInstance(){
		if(dao==null)
			dao=new ReserveDAO();
		return dao;
	}
	
	public List<MovieVO> movieSelect(){
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql="SELECT code,grade,title,poster FROM movie WHERE cno=1 ORDER BY RESERVE DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setCode(rs.getString(1));
				String grade=rs.getString(2);
				if(grade.contains("12")){
					grade="../img/grade/12.svg";
				}else if(grade.contains("15")) {
					grade="../img/grade/15.svg";
				}else if(grade.contains("전체")) {
					grade="../img/grade/all.svg";
				}else {
					grade="../img/grade/18.svg";
				}
				vo.setGrade(grade);
				vo.setTitle(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	// 구별 영화관
	public List<CinemaVO> cinema(){
		List<CinemaVO> list=new ArrayList<CinemaVO>();
		try {
			getConnection();
			String sql="SELECT t_id,nt_id,t_nm,cd_nm FROM cinema ORDER BY Cd_nm DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CinemaVO vo=new CinemaVO();
				vo.setT_id(rs.getString(1));
				vo.setNt_id(rs.getString(2));
				vo.setT_nm(rs.getString(3));
				vo.setCd_nm(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			disConnection();
		}
		return list;
	}
	
}
