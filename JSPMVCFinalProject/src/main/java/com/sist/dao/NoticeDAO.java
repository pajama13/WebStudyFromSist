package com.sist.dao;
import java.util.*;

import com.sist.vo.NoticeVO;

import java.sql.*;
public class NoticeDAO {
   private Connection conn;
   private PreparedStatement ps;
   
   //Footer에 저장
   //공지사항 탑5
   public List<NoticeVO> noticeTop5()
   {
      List<NoticeVO> list=new ArrayList<NoticeVO>();
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT no,name,subject,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),rownum "
                     +"FROM (SELECT no,name,subject,regdate "
                     +"FROM project_notice ORDER BY hit DESC) "
                     +"WHERE rownum<=5"; //Top-N (인기순위)

         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            NoticeVO vo=new NoticeVO();
            vo.setNo(rs.getInt(1));
            vo.setName(rs.getString(2));
            vo.setSubject(rs.getString(3));
            vo.setDbday(rs.getString(4));
            list.add(vo);
         }
         
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         CreateConnection.disConnection(conn, ps);
      }
      return list;
   }
   //공지사항 리스트
   public List<NoticeVO> noticeListData(int page)
   {
      List<NoticeVO> list=new ArrayList<NoticeVO>();
      try
      {
         conn=CreateConnection.getConnection();
         String sql="SELECT no,type,name,subject,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS'),hit,num "
                     +"FROM (SELECT no,type,name,subject,regdate,hit,rownum as num "
                     +"FROM (SELECT /*+INDEX_DESC(project_notice pro_no_pk)*/ no,type,name,subject,regdate,hit "
                     +"FROM project_notice)) "
                     +"WHERE num BETWEEN ? AND ?"; 

         ps=conn.prepareStatement(sql);
         int rowSize=10;
         int start=(rowSize*page)-(rowSize);
         int end=rowSize*page;
         
         ps.setInt(1, start);
         ps.setInt(2, end);
         
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            NoticeVO vo=new NoticeVO();
            vo.setNo(rs.getInt(1));
            vo.setType(rs.getInt(2));
            vo.setName(rs.getString(3));
            vo.setSubject(rs.getString(4));
            vo.setDbday(rs.getString(5));
            vo.setHit(rs.getInt(6));
            list.add(vo);
         }
         
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         CreateConnection.disConnection(conn, ps);
      }
      return list;
   }
   //공지사항 총페이지
   public int noticeTotalPage()
   {
	   int total=0;
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="SELECT CEIL(count(*)/10.0) FROM project_notice";
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
   public void noticeInsert(NoticeVO vo)
   {
	   try
	   {
		   conn=CreateConnection.getConnection();
		   String sql="INSERT INTO project_notice VALUES("
				      +"(SELECT NVL(no)+1,1) FROM project_notice),?,?,?,?,SYSDATE,0)";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, vo.getType());
		   ps.setString(2, vo.getName());
		   ps.setString(3, vo.getSubject());
		   ps.setString(4, vo.getContent());
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
}