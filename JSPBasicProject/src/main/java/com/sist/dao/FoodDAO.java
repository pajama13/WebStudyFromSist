
package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//DBCP => 웹에서만 사용 가능(Connection 생성 => 톰캣에서 생성)
	//장점1: 접속시간 줄일 수 있음(연결 속도 향상)
	//장점2: 보안
	//장점3: Connection의 개수를 관리할 수 있음
	//pool안에 미리 만든 Connection들을 담아서 필요 시 사용함
	//JDBC = DBCP = ORM(Mybatis, JPA)
	/*
		select * from project_category
		where cno=1;
		
		insert into~~
		
		=> void save()
		=> CategoryVO findByCno(int cno);
		
	*/
	public void getConnection() //미리 만들어진 Connection 객체를 가지고 옴
	{
		try
		{
			//등록된 위치로 접속
			Context init=new InitialContext(); //JNDI (폴더형식)
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle"); // 이 이름을 가진 커넥션을 달라
			conn=ds.getConnection();
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public void disConnection() //재사용하기 위해 반환
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();	
		}catch(Exception ex){}
	}
	
	public ArrayList<CategoryVO> categoryAllData()
	{
		ArrayList<CategoryVO> list=new ArrayList<CategoryVO>();
		try
		{
			getConnection(); //Connection 가지고 오기
			String sql="SELECT cno,title,subject,poster "
					   +"FROM project_category "
					   +"ORDER BY cno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				CategoryVO vo=new CategoryVO();
				vo.setCno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setPoster(rs.getString(4));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			//Connection 반환
			disConnection();
		}
		return list;		
	}

}
