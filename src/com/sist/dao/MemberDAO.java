package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//1. 연결, 등록, 반환
		private Connection conn;
	    private PreparedStatement ps;
	    private static MemberDAO dao;
	    public void getConnection()
	    {
	    	// DBCP 소스코딩 (톰캣이 Connection객체를 만든다 => 만들어진 주소만 사용)
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
	    //3. 아이디 중복 체크
	    public int memberidCheck(String id) {
	    	int count=0;
	    	try {
	    		getConnection();
	    		String sql="SELECT COUNT(*) FROM movie_member "
	    				+ "WHERE id=?";
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, id);
	    		ResultSet rs=ps.executeQuery();
	    		rs.next();
	    		count=rs.getInt(1);
	    		rs.close();
	    	}catch (Exception e) {
				e.printStackTrace();
			}finally {
				disConnection();
			}
	    	return count;
	    }
	    
	    
	    //4-1. 우편번호 검색
	    
	    //4-2. 우편번호 검색 결과
	    
	    
	    //5. 실제 회원가입
	    //6. 로그인
	    //7. 회원수정
	    //8. 회원탈퇴
	    //9. 아이디찾기, 비밀번호찾기
	    
	    
	    
}
