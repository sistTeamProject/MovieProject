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
	private static MovieDAO dao;
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
	public static MovieDAO newInstance() {
		if(dao==null)
			dao=new MovieDAO();
		return dao;
	}
	// 데이터베이스 연결
	public List<MovieVO> movieRankData(){
		List<MovieVO> list=new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql="SELECT mno,title,poster,genre,grade,score,reserve,num " 
					+"FROM (SELECT mno,title,poster,genre,grade,cno,score,reserve,rownum as num " 
					+"FROM (SELECT mno,title,poster,genre,grade,cno,score,reserve "
					+"FROM movie ORDER BY reserve DESC)) "
					+"WHERE rownum <= 20";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MovieVO vo=new MovieVO();
				vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));
    			vo.setGenre(rs.getString(4));
    			String grade=rs.getString(5);
    	 		grade=grade.trim().substring(grade.indexOf("]")+1,grade.indexOf("가")+1);
    	 		vo.setGrade(grade);
    			vo.setScore(rs.getDouble(6));
    			vo.setReserve(rs.getDouble(7));
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
    		String sql="SELECT mno,title,poster,genre,grade,score,reserve,num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,score,reserve,rownum as num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,score,reserve "
    				+"FROM movie WHERE cno=1 ORDER BY reserve DESC)) "
    				+"WHERE num BETWEEN ? AND ?";
    		ps=conn.prepareStatement(sql);
    		int rowSize=12;
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
    			// null 값 방지
    			try 
    			{
    				String grade=rs.getString(5);
    				grade=grade.trim().substring(grade.indexOf("]")+1,grade.indexOf("가")+1);
    				vo.setGrade(grade);
    			}catch(Exception ex) {}
    			vo.setScore(rs.getDouble(6));
    			vo.setReserve(rs.getDouble(7));
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
    		String sql="SELECT mno,title,poster,genre,grade,regdate,num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,regdate,rownum as num "
    				+"FROM (SELECT mno,title,poster,genre,grade,cno,regdate "
    				+"FROM movie WHERE cno=2 ORDER BY reserve DESC)) "
    				+"WHERE num BETWEEN ? AND ?";
    		ps=conn.prepareStatement(sql);
    		int rowSize=12;
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
    			// null값 방지
    			try 
    			{
    				String grade=rs.getString(5);
    				grade=grade.trim().substring(grade.indexOf("]")+1,grade.indexOf("가")+1);
    				vo.setGrade(grade);
    			}catch(Exception ex) {}
    	 		vo.setRegdate(rs.getString(6));
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
 		   String sql="SELECT mno,poster,title,genre,grade,regdate,engtitle,cno,nation,time,showUser,score,story,actor,director,key "
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
 		   // null값 방지
 		   try 
			{
				String grade=rs.getString(5);
				grade=grade.trim().substring(grade.indexOf("]")+1,grade.indexOf("가")+1);
				vo.setGrade(grade);
			}catch(Exception ex) {}
 		   vo.setRegdate(rs.getString(6));
 		   vo.setEngtitle(rs.getString(7));
 		   vo.setCno(rs.getInt(8));
 		   vo.setNation(rs.getString(9));
 		   vo.setTime(rs.getString(10));
 		   vo.setShowUser(rs.getInt(11));
 		   vo.setScore(rs.getDouble(12));
 		   vo.setStory(rs.getString(13));
 		   vo.setActor(rs.getString(14));
 		   vo.setDirector(rs.getString(15));
 		   String key=rs.getString(16);
 		   key=key.substring(key.lastIndexOf("/"));
 		   vo.setKey(key);
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
    public int RelmovieTotalPage()
    {
 	   int total=0;
 	   try
 	   {
 		   getConnection();
 		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM movie WHERE cno=1";
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
    public int SchmovieTotalPage()
    {
 	   int total=0;
 	   try
 	   {
 		   getConnection();
 		   String sql="SELECT CEIL(COUNT(*)/12.0) FROM movie WHERE cno=2";
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
    // 추천
    public List<MovieVO> movieRecommandData(String genre)
    {
    	List<MovieVO> list=new ArrayList<MovieVO>();
    	try
    	{
    		getConnection();
    		String sql="SELECT mno,title,poster,genre,num "
    				+"FROM (SELECT mno,title,poster,genre,rownum as num "
    				+"FROM (SELECT mno,title,poster,genre "
    				+"FROM movie ORDER BY score DESC)) "
    				+"WHERE genre LIKE '%'||?||'%' AND rownum <=4";
    		ps=conn.prepareStatement(sql);
    		
    		ps.setString(1, genre);
    		
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setTitle(rs.getString(2));
    			vo.setPoster(rs.getString(3));    			
    			String genre2=rs.getString(4);
    			if(genre2.indexOf(",")!=-1)
    			{
    				genre2=genre2.trim().substring(0,genre2.indexOf(","));
    				vo.setGenre(genre2);
    			}
    			else
    			{
    				vo.setGenre(genre2);	
    			}
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
    
    
    public List<MovieVO> searchMovieData(String fd,String type){
    	List<MovieVO> list=new ArrayList<MovieVO>();
    	try {
    		getConnection();
    		String sql="SELECT mno,poster,title,grade,actor,director,reserve "
    				+ "FROM movie WHERE "+type+" LIKE '%'||?||'%' ORDER BY reserve DESC";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, fd);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next()) {
    			MovieVO vo=new MovieVO();
    			vo.setMno(rs.getInt(1));
    			vo.setPoster(rs.getString(2));
    			vo.setTitle(rs.getString(3));
    			vo.setGrade(rs.getString(4));
    			vo.setActor(rs.getString(5));
    			vo.setDirector(rs.getString(6));
    			vo.setReserve(rs.getDouble(7));
    			list.add(vo);
    		}
    		rs.close();
    	}catch (Exception e) {
			e.printStackTrace();
		}finally {
			disConnection();
		}
    	return list;
    }

}
