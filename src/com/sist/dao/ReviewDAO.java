package com.sist.dao;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

import com.sist.vo.*;

public class ReviewDAO
{
	
	private Connection conn;
	private PreparedStatement ps;
	public static ReviewDAO dao;
	
	
	public void getConnection()
	{
		try
		{
			Context init = new InitialContext();
			Context c = (Context)init.lookup("java://comp//env");
			DataSource ds = (DataSource)c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	
	public void disConnection()
	{
		try
		{
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		catch(Exception ex) { }
	}
	
	
	public static ReviewDAO newInstance()
	   {
		   if(dao == null)
			   dao = new ReviewDAO();
		   return dao;
	   }
	
	
	public List<ReviewVO> reviewListData(int page)
	{
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		
		try
		{
			getConnection();
			String sql = 
				"SELECT reviewCD, rating, regdate, contents, spoil, "
			  + "likes, dislike, ID, mno, title, num "
			  + "FROM (SELECT reviewCD, rating, regdate, contents, spoil, "
			  + "likes, dislike, ID, mno, title, ROWNUM as num "
			  + "FROM (SELECT reviewCD, rating, r.regdate, contents, spoil, "
			  + "likes, dislike, ID, r.mno, title "
			  + "FROM movie_review r, movie m "
			  + "WHERE r.mno = m.mno "
			  + "ORDER BY reviewCD DESC)) "
			  + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			
			int rowSize = 8;
			int start = (rowSize * page) - (rowSize - 1);
			int end = rowSize * page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ReviewVO vo = new ReviewVO();
				vo.setReviewCD(rs.getInt(1));
				vo.setRating(rs.getDouble(2));
				vo.setRegdate(rs.getDate(3));
				vo.setContents(rs.getString(4));
				vo.setSpoil(rs.getString(5));
				vo.setLikes(rs.getString(6));
				vo.setDislike(rs.getString(7));
				vo.setId(rs.getString(8));
				vo.setMno(rs.getInt(9));
				vo.setTitle(rs.getString(10));
				
				list.add(vo);
			}
			rs.close();
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		
		return list;
	}
	
	
	public int reviewTotalPage()
	{
		int total = 0;
		   
		try
		{
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/8.0) FROM movie_review";
			ps = conn.prepareStatement(sql);
			   
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		   return total; 
	}
	
	public List<MovieVO> currentMovieData()
	{
		List<MovieVO> list = new ArrayList<MovieVO>();
		
		try
		{
			getConnection();
			String sql = 
				"SELECT title, regdate, cno FROM movie "
			   +"WHERE cno=1";
			  
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				MovieVO vo = new MovieVO();
				vo.setTitle(rs.getString(1));
				list.add(vo);
			}
			rs.close();			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		
		return list;
	}
	
	
	public void reviewInsert(ReviewVO vo)
	{
	   try
	   {
		   getConnection();
		   System.out.println(vo.getContents());
		   String sql =
				   "INSERT INTO movie_review "
				 + "(reviewCD, rating, contents, spoil, "
				 + "p_prod, p_perf, p_story, p_visual, p_ost, "
				 + "satis, id, mno) "
				 + "VALUES(mr_reviewCD_seq.nextval,?,?,?, "
				 + "?,?,?,?,?, "
				 + "?,?, "
				 + "(SELECT mno FROM movie "
				 + "WHERE title = ?))";
		   ps = conn.prepareStatement(sql);
		   ps.setDouble(1, vo.getRating());
		   ps.setString(2, vo.getContents());
		   ps.setString(3, vo.getSpoil());
		   ps.setString(4, "0");
		   ps.setString(5, "0");
		   ps.setString(6, "0");
		   ps.setString(7, "0");
		   ps.setString(8, "0");
		   ps.setString(9, vo.getSatis());
		   ps.setString(10, vo.getId());
		   ps.setString(11, vo.getTitle());
		   ps.executeUpdate(); 
	   }
	   catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   disConnection();
	   }
	}

	
	public ReviewVO reviewUpdateData(int reviewCD)
	{
		ReviewVO vo = new ReviewVO();
		try
		{
			getConnection();
			String sql = 
					"SELECT reviewCD, r.mno, title, rating, satis, contents, "
				  + "p_prod, p,story, p_visual, p_ost, p_perf, spoil "
				  + "FROM movie_review r, movie m "
				  + "WHERE r.mno = m.mno AND reviewCD = ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reviewCD);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			vo.setReviewCD(rs.getInt(1));
			vo.setMno(rs.getInt(2));
			vo.setTitle(rs.getString(3));
			vo.setRating(rs.getDouble(4));
			vo.setSatis(rs.getString(5));
			vo.setContents(rs.getString(6));
			vo.setP_prod(rs.getString(7));
			vo.setP_story(rs.getString(8));
			vo.setP_visual(rs.getString(9));
			vo.setP_ost(rs.getString(10));
			vo.setP_perf(rs.getString(11));
			vo.setSpoil(rs.getString(12));
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
        finally
		{
        	disConnection();
		}
		
		return vo;
	}

	   
	public boolean reviewUpdate(ReviewVO vo)
	{
		boolean bCheck = false;
		try
		{
			getConnection();
			   
			String sql=
					"SELECT ID FROM movie_review "
				  + "WHERE reviewCD = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getReviewCD());
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_id = rs.getString(1);
			rs.close();
			
			if(db_id.equals(vo.getId())) 
			{
				bCheck = true;
				sql =
					"UPDATE movie_review SET "
				  + "rating=?, contents=?, spoil=?, "
				  + "p_prod=?, p_perf=?, p_story=?, p_visual=?, p_ost=?, "
				  + "satis=?, mno=(SELECT mno FROM movie WHERE title=?) "
				  + "WHERE reviewCD = ?";
				
				ps = conn.prepareStatement(sql);
				ps.setDouble(1, vo.getRating());
				ps.setString(2, vo.getContents());
				ps.setString(3, vo.getSpoil());
				ps.setString(4, vo.getP_prod());
				ps.setString(5, vo.getP_perf());
				ps.setString(6, vo.getP_story());
				ps.setString(7, vo.getP_visual());
				ps.setString(8, vo.getP_ost());
				ps.setString(9, vo.getSatis());
				ps.setInt(10, vo.getReviewCD());
				ps.executeUpdate();
			}
			else
			{
				bCheck=false;
			}
		}
		catch(Exception ex)
		{
		   ex.printStackTrace();
		}
		finally
		{
		   disConnection();
		}
		return bCheck;
	}


	public boolean reviewDelete(int reviewCD, String id)
	{
		boolean bCheck = false;
		try
		{
			getConnection();
			conn.setAutoCommit(false);
			
			String sql = 
					"SELECT ID FROM movie_review "
				  + "WHERE reviewCD=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, reviewCD);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_id=rs.getString(1);
			rs.close();
			   
			if(id.equals(db_id)) 
			{
			   bCheck=true;
			   sql = "DELETE FROM movie_review "
				   + "WHERE reviewCD=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, reviewCD);
			   ps.executeUpdate();
			   conn.commit();
		   }
		   else
		   {
			   bCheck=false;// history.back()
		   }
	   }
	   catch(Exception ex)
	   {
		   ex.printStackTrace();
		   try
		   {
			   conn.rollback();
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
	   }
	   finally
	   {
		   try
		   {
			   conn.setAutoCommit(true);
		   }
		   catch(Exception ex) {}
		   disConnection();
	   }
	   return bCheck;
   }



}
