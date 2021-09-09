package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.MovieVO;

public class MovieDAO {
	
	private Connection conn;
	private PreparedStatement ps;
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
	// 데이터베이스 연결
	public List<MovieVO> movieListData(){
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql="SELECT mno,title,poster,genre FROM project_movie WHERE ROWNUM <= 18 ORDER BY mno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setGenre(rs.getString(4));
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
	public List<MovieVO> movieRealData(int page)
    {
    	List<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,poster,genre,grade,score,num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,score,rownum as num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,score "
    				+"FROM movie WHERE cno=1 ORDER BY mno ASC)) "
    				+"WHERE num BETWEEN ? AND ?";
    		ps=conn.prepareStatement(sql);
    		int rowSize=20;
    		int start=(rowSize*page)-(rowSize-1);
    		int end=rowSize*page;
    		
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setGenre(rs.getString(4));
    			vo.setGrade(rs.getString(5));
    			vo.setScore(rs.getDouble(6));
    			list.add(vo);
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    	
    }
    
    public List<MovieVO> movieSchData(int page)
    {
    	List<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,poster,genre,grade,num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,rownum as num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno "
    				+"FROM movie WHERE cno=2 ORDER BY mno ASC)) "
    				+"WHERE num BETWEEN ? AND ?";
    		ps=conn.prepareStatement(sql);
    		int rowSize=20;
    		int start=(rowSize*page)-(rowSize-1);
    		int end=rowSize*page;
    		
    		ps.setInt(1, start);
    		ps.setInt(2, end);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setGenre(rs.getString(4));
    			vo.setGrade(rs.getString(5));
    			list.add(vo);
    		}
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    // 상세보기
    public MovieVO movieDetailData(int mno)
    {
 	   MovieVO vo=new MovieVO();
 	   try
 	   {
 		   getConnection();
 		   String sql="SELECT mno,poster,title,genre,grade,regdate,engtitle,cno,nation,time,showUser,score "
 				     +"FROM movie "
 				     +"WHERE mno=?";
 		   ps=conn.prepareStatement(sql);
 		   ps.setInt(1, mno);
 		   ResultSet rs=ps.executeQuery();
 		   rs.next();
 		   vo.setMno(rs.getInt(1));
 		   vo.setPoster(rs.getString(2));
 		   vo.setTitle(rs.getString(3));
 		   vo.setGenre(rs.getString(4));
 		   vo.setGrade(rs.getString(5));
 		   vo.setRegdate(rs.getString(6));
 		   vo.setEngtitle(rs.getString(7));
 		   vo.setCno(rs.getInt(8));
 		   vo.setNation(rs.getString(9));
 		   vo.setTime(rs.getString(10));
 		   vo.setShowUser(rs.getInt(11));
 		   vo.setScore(rs.getDouble(12));
 		   rs.close();
 	   }catch(Exception ex)
 	   {
 		   ex.printStackTrace();
 	   }
 	   finally
 	   {
 		   disConnection();
 	   }
 	   return vo;
    }
    // 총페이지
    public int movieTotalPage()
    {
 	   int total=0;
 	   try
 	   {
 		   getConnection();
 		   String sql="SELECT CEIL(COUNT(*)/20.0) FROM movie";
 		   ps=conn.prepareStatement(sql);
 		   ResultSet rs=ps.executeQuery();
 		   rs.next();
 		   total=rs.getInt(1);
 		   rs.close();
 	   }catch(Exception ex)
 	   {
 		   ex.printStackTrace();
 	   }
 	   finally
 	   {
 		   disConnection();
 	   }
 	   return total;
 	   
    }

}
