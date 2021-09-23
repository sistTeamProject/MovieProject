package com.sist.dao;

import com.sist.vo.*;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class MemberDAO {
	//1. 연결, 등록, 반환
		private Connection conn;
	    private PreparedStatement ps;
	    private static MemberDAO dao;
	    public void getConnection()
	    {
	    	try
	    	{
	    		Context init=new InitialContext();
	    		Context c=(Context)init.lookup("java://comp//env");
	    		DataSource ds=(DataSource)c.lookup("jdbc/oracle");
	    		conn=ds.getConnection();
	    	}catch(Exception ex)
	    	{
	    		ex.printStackTrace();
	    	}
	    }
	    public void disConnection()
	    {
	    	try
	    	{
	    		if(ps!=null) ps.close();
	    		if(conn!=null) conn.close();
	    	}catch(Exception ex) {}
	    	
	    }
		
	    //2. 싱글턴 패턴
	    public static MemberDAO newInstance() {
	    	if(dao==null)
	    		dao=new MemberDAO();
	    	return dao;
	    }
	    
	    
	    //▼ 기능
	    //3-1. 아이디 중복 체크
	    public int memberidCheck(String id)
	    {
	  	  int count=0;
	  	  try
	  	  {
	  		  getConnection();
	  		  String sql="SELECT COUNT(*) FROM movie_member1 "
	  				    +"WHERE id=?";
	  		  ps=conn.prepareStatement(sql);
	  		  ps.setString(1,id);
	  		  ResultSet rs=ps.executeQuery();
	  		  rs.next();
	  		  count=rs.getInt(1);
	  		  rs.close();
	  	  }catch(Exception ex)
	  	  {
	  		  ex.printStackTrace();
	  	  }
	  	  finally
	  	  {
	  		  disConnection();
	  	  }
	  	  return count;
	    }
	    
	    
	    //3-2-1. 우편번호 검색
	    public List<ZipcodeVO> postfind(String dong)
	    {
	  	  List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	  	  try
	  	  {
	  		  getConnection();
	  		  String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
	  				    +"FROM zipcode "
	  				    +"WHERE dong LIKE '%'||?||'%'";
	  		  ps=conn.prepareStatement(sql);
	  		  ps.setString(1,dong);
	  		  ResultSet rs=ps.executeQuery();
	  		  while(rs.next())
	  		  {
	  			  ZipcodeVO vo=new ZipcodeVO();
	  			  vo.setZipcode(rs.getString(1));
	  			  vo.setSido(rs.getString(2));
	  			  vo.setGugun(rs.getString(3));
	  			  vo.setDong(rs.getString(4));
	  			  vo.setBunji(rs.getString(5));
	  			  list.add(vo);
	  		  }
	  		  rs.close();
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
	    
	    //3-3-2. 우편번호
	    public int postfindCount(String dong)
	    {
	  	  int count=0;
	  	  try
	  	  {
	  		  getConnection();
	  		  String sql="SELECT COUNT(*) "
	  				    +"FROM zipcode "
	  				    +"WHERE dong LIKE '%'||?||'%'";
	  		  ps=conn.prepareStatement(sql);
	  		  ps.setString(1,dong);
	  		  ResultSet rs=ps.executeQuery();
	  		  rs.next();
	  		  count=rs.getInt(1);
	  		  rs.close();
	  	  }catch(Exception ex)
	  	  {
	  		  ex.printStackTrace();
	  	  }
	  	  finally
	  	  {
	  		  disConnection();
	  	  }
	  	  return count;
	    }
	    
	    //3-3. 회원가입 완료 
	    public void memberJoinInsert(MemberVO vo)
	    {
	  	  try
	  	  {
	  		  getConnection();
	  		  //id,pwd,name,sex,birthday, email,post,addr1,addr2,tel, admin
	  		  String sql="INSERT INTO movie_member1 VALUES(?,?,?,?,?,?,?,?,?,?,'n')"; // admin(n=일반회원,y=관리자)
	  		  ps=conn.prepareStatement(sql);
	  		  ps.setString(1, vo.getId());
	  		  ps.setString(2, vo.getPwd());
	  		  ps.setString(3, vo.getName());
	  		  ps.setString(4, vo.getSex());
	  		  ps.setString(5, vo.getBirthday());
	  		  ps.setString(6, vo.getEmail());
	  		  ps.setString(7, vo.getPost());
	  		  ps.setString(8, vo.getAddr1());
	  		  ps.setString(9, vo.getAddr2());
	  		  ps.setString(10, vo.getTel());
	  		  ps.executeUpdate();
	  	  }catch(Exception ex)
	  	  {
	  		  ex.printStackTrace();
	  	  }
	  	  finally
	  	  {
	  		  disConnection();
	  	  }
	    }
	    
	    
	    //4. 로그인 
	    public String isLogin(String id,String pwd)
	    {
	  	  String result="";
	  	  try
	  	  {
	  		  getConnection();
	  		  String sql="SELECT COUNT(*) "
	  				    +"FROM movie_member1 "
	  				    +"WHERE id=?";
	  		  ps=conn.prepareStatement(sql); //id가 존재하는지 체크
	  		  ps.setString(1, id);
	  		  ResultSet rs=ps.executeQuery();
	  		  rs.next();
	  		  int count=rs.getInt(1);
	  		  rs.close();
	  		  
	  		  //4-1. ID 존재 유무 확인
	  		  if(count==0) //ID 없음
	  		  {
	  			  result="NOID";
	  		  }
	  		  else // ID 있음
	  		  {
	  			  sql="SELECT pwd,name,admin FROM movie_member1 "
	  				 +"WHERE id=?";
	  			  ps=conn.prepareStatement(sql);
	  			  ps.setString(1, id);
	  			  rs=ps.executeQuery();
	  			  rs.next();
	  			  String db_pwd=rs.getString(1);
	  			  String name=rs.getString(2);
	  			  String admin=rs.getString(3);
	  			  rs.close();
	  			  
	  			  //4-2. 비밀번호 확인 
	  			  if(db_pwd.equals(pwd))//로그인
	  			  {
	  				  result=name+"|"+admin;
	  			  }
	  			  else
	  			  {
	  				  result="NOPWD";
	  			  }
	  		  }
	  	  }catch(Exception ex)
	  	  {
	  		  ex.printStackTrace();
	  	  }
	  	  finally
	  	  {
	  		  disConnection();
	  	  }
	  	  return result;
	    }	    
	    
	    //5. 회원정보 수정
	    //5-1. 비밀번호 체크
	    public boolean memberPwdCheck(String id,String pwd) {
	    	boolean bCheck=false;
	    	try {
	    		getConnection();
	    		String sql="SELECT pwd FROM movie_member1 "
	    				+ "WHERE id=?";
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, id);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		String db_pwd=rs.getString(1);
	    		rs.close();
	    		
	    		if(db_pwd.equals(pwd)) {
	    			bCheck=true;
	    		}
	    	}catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
	    	return bCheck;
	    }
	    //5-2. 데이터 가져오기
	    public MemberVO memberInfo(String id)
	    {
	    	MemberVO vo=new MemberVO();
	  	  	try
	  	  	{
				getConnection();
				//id,pwd,name,sex,birthday, email,post,addr1,addr2,tel, admin
				String sql="SELECT id,pwd,name,sex,birthday,email,post,addr1,addr2,tel "
				+ "FROM movie_member1 "
				+ "WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setSex(rs.getString(4));
				vo.setBirthday(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setPost(rs.getString(7));
				vo.setAddr1(rs.getString(8));
				vo.setAddr2(rs.getString(9));
				vo.setTel(rs.getString(10));
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
	    
	    //5-3. 실제 수정
	    public boolean memberInfoEdit(MemberVO vo) {
	    	boolean bCheck=false;
	    	try {
	    		getConnection();
	    		//1. 비밀번호 가져오기
	    		String sql="SELECT pwd FROM movie_member1 "
	    				+ "WHERE id=?";
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, vo.getId());
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		String db_pwd=rs.getString(1);
	    		rs.close();
	    		//2. 비밀번호 일치 시 수정
	    		if(db_pwd.equals(vo.getPwd()))// 수정가능
	    		{
	    			bCheck=true;
	    			// 실제 수정을 한다 
	    			sql="UPDATE movie_member1 SET "
	    			   +"pwd=?,name=?,sex=?,birthday=?,email=?,post=?,addr1=?,addr2=?,tel=? "
	    			   +"WHERE id=?";
	    			ps=conn.prepareStatement(sql);
	    			ps.setString(1, vo.getPwd());
	    			ps.setString(2, vo.getName());
	    			ps.setString(3, vo.getSex());
	    			ps.setString(4, vo.getBirthday());
	    			ps.setString(5, vo.getEmail());
	    			ps.setString(6, vo.getPost());
	    			ps.setString(7, vo.getAddr1());
	    			ps.setString(8, vo.getAddr2());
	    			ps.setString(9, vo.getTel());
	    			ps.executeUpdate();
	    		}
	    		else
	    		{
	    			bCheck=false;
	    		}
	    	}catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
	    	return bCheck;
	    }

	    
	    
	    
}
