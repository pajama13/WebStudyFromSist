package com.sist.dao;
import java.util.*;

import com.sist.vo.FreeBoardVO;

import java.sql.*;
/*
	SELECT, DELETE, UPDATE, INSERT
	인라인뷰 / 조인 / 서브쿼리
	


           Collection
               |
       -----------------
       |       |       |
      List    Set     Map
       |
    ArrayList
     Vector
	
*/
public class FreeBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	//목록 출력
	public List<FreeBoardVO> boardListData(int page)
	{
		List<FreeBoardVO> list=new ArrayList<FreeBoardVO>();
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,num "
					  +"FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					  +"FROM (SELECT /*+ INDEX_DESC(project_freeboard pf1_no_pk)*/ no,subject,name,regdate,hit "
					  +"FROM project_freeboard)) "
					  +"WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql); //SQL문장을 오라클 전송
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				FreeBoardVO vo=new FreeBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps); //반환
		}
		return list;
	}
	
	public int boardTotalPage()
	{
		int total=0;
		try
		{
			conn=CreateConnection.getConnection();
			String sql="SELECT CEIL(count(*)/10.0) FROM project_freeboard";
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
			CreateConnection.disConnection(conn, ps);
		}
		return total;
	}
	//추가(글쓰기)
	public void boardInsert(FreeBoardVO vo)
	{
		try
		{
			conn=CreateConnection.getConnection();
			String sql="INSERT INTO project_freeboard(no,name,subject,content,pwd) "
						+"VALUES(pf_no_seq.nextval,?,?,?,?)";
			//sql 문장 전송
			ps=conn.prepareStatement(sql);
			//실행 전 ?에 값 채우기
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			//실행 명령 => executeUpdate() => commit 포함
			ps.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
	}
	//상세보기
	public FreeBoardVO boardDetailData(int no)
	{
		FreeBoardVO vo=new FreeBoardVO();
		try
		{
			conn=CreateConnection.getConnection();
			//조회수 증가
			String sql="UPDATE project_freeboard SET "
						+"hit=hit+1 "
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			//실제 게시물번호에 해당되는 데이터 가져오기
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'yyyy-MM-dd'),hit "
				+"FROM project_freeboard "
				+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			CreateConnection.disConnection(conn, ps);
		}
		return vo;
	}
	//수정
	//삭제
	//댓글 ==> 프로시저
}
