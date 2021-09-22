package com.sist.dao;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

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
			String sql="SELECT code,grade,title FROM movie WHERE cno=1 ORDER BY RESERVE DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setCode(rs.getString(1));
				vo.setGrade(rs.getString(2));
				vo.setTitle(rs.getString(3));
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
