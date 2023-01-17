package com.sist.dao;
/*
	데이터베이스 : JDBC 자바 데이터 베이스 커넥션
	
	JDBC 순서
	1. 데이터베이스 연결 드라이버 설정 (thin드라이브 : 연결만 하는 역할, 무료, 속도 느림) => 드라이버는 각 업체에서 지원
	  Class.forName("드라이버명")
	                --------- 오라클 : oracle.jdbc.driver.OracleDriver
	                          MySQL : com.mysql.cj.jdbc.Driver
	2. 실제 오라클 연결
	  Conenction conn=DriverManager.getConnection(URL,"유저이름","비밀번호")
	3. SQL 문장 전송
	  PreparedStatement ps=conn.preparedStatement()
	4. ?에 값 채우기
	  -ps.setInt()
	  -ps.setString()
	  -ps.setDouble()
	  -ps.setDate() => 현재날짜 SYSDATE, 특정날짜 'YY/MM/DD'
	5. 오라클 실행 요청
	  ps.executeQuery() => SELECT로 데이터 값 가져올 때
	  ps.executeUpdate() => INSERT, UPDATE, DELETE 사용할 때 (commit포함)
	6. 결과값 받기
	  ResultSet rs=ps.executeQuery() => SELECT로 실행한 값을 받아오라는 뜻
	  -row가 1개일 때
	   rs.next() => 메모리에 출력된 데이터 첫번째 줄에 커서 위치 이동
	  -row가 여러 개일 때
	   while(rs.next()){}
	7. 처리 종료
	  rs.close()
	  ps.close()
	  conn.close()
	  
	------------------------------------- 여기까지가 일반 JDBC 코드
	  
	DBCP
	=> Connection 미리 생성, 연결에 소요되는 시간 줄임, 재사용 가능
	=> Setting : server.xml
	  <Resource
	    auth="Container" => 관리자(톰캣)
	    drivetClassName="" => 드라이버 등록
	    --------------
	    url=""
	    username=""
	    password=""
	    -------------- Connection 생성
	    name="(이름지정 ex jdbc/oracle)" => Connection 객체 찾기 위한 구분자 => lookup() 으로 객체 주소 얻기
	    type="javax.sql.DataSource" => 얻어온 주소값을 어떤 클래스로 받을지 설정 
	    --------------
	    maxActive="" : 최대 Connection 생성 갯수 (초과)
	    maxIdle="" : 실제 POOL에 저장된 갯수
	    maxWait="(ex -1)" : Connection을 전부 사용 시에는 사용자가 반환할 때까지 대기하는 시간
	    -------- 초단위, 음수면 무한정
	  />
	   
	  => XML : 대소문자 구분, 속성값 지정 "", 열고 닫기 꼼꼼히 ==> 오류 발생 시 run on server가 없어짐
    
    
    DBCP 코딩순서
    1) (톰캣에서) 미리 생성된 Connection의 주소값 얻기
      Connection객체 주소가 저장된 위치로 접근
      java://comp/env => 저장되는 위치
      jdbc/oracle
      
      Context init=new InuitailContext(); => 접근 (탐색기 여는 느낌)
      Context c=(Context)init.lookup("java.//comp/env");
      DataSource ds=(DataSource)c.lookup("jdbc/oracle")
      conn=ds.getConnection()
    -------------
    2) SQL문장 전송
    3) ?에 값 채우기
    4) 결과값 읽기
    ------------- JDBC와 동일
    5) 반환
      ps.close()
      conn.close()
    
    DBCP가 JDBC보다 속도 빠름 (미리 Connection 객체를 만들어두고 사용해서)
    
*/
import java.util.*; //ArrayList
import java.sql.*; //Connection, PrepareStatement, ResultSet
import javax.sql.*; //DataSource (데이터베이스에 대한 모든 정보)

import com.sist.vo.DataboardVO;

import javax.naming.*; //Context => 메모리 연결, 메모리에 저장된 데이터
public class DataboardDAO {
	private Connection conn; //오라클 연결 객체
	private PreparedStatement ps; //오라클 송수신 객체
	
	//1. 미리 생성된 Connection 객체 주소 읽기
	public void getConnection()
	{
		try
		{
			Context init=new InitialContext(); //탐색기 형식으로 저장 => JNDI 
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		}catch(Exception ex) {}
	}
	//2. 반환 => Connection 관리하는 영역(POOL)
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close(); 
		}catch(Exception ex) {}
	}
	//기능 설정
	//3-1. 목록 출력 => 페이징 (인라인뷰)
	/*
		메소드
		  1) 사용자로부터 어떤 값을 받을지 => 매개변수
		  2) 결과값을 어떤값 => 리턴형
		    -목록 ArrayList
		    -상세 ~VO => 게시물 1개에 대한 모든 데이터 변수를 가짐
		    -일반 (총페이지, 검색, 로그인처리)
		     경우수
		     ---- 여러개 (String, int) => id, pwd, ok
		          1개 해당 데이터를 사용
		  3) 메소드 구현   
		  
		  => 언어 : 자바, 자바스크립트 (제이쿼리, Ajax, VueJS, ReatJS)
		           1. 변수
		           2. 메소드 처리
		  4) 웹
		     사용자 전송  =>  매개변수
		            request
		                   |
		                 서버에서 요청 처리(데이터, 크롤링, 통계처리) => 결과값을 사용자에게 전송
		                                               response
	*/
	public ArrayList<DataboardVO> databoardListData(int page)
	{
		ArrayList<DataboardVO> list=new ArrayList<DataboardVO>();
		try
		{
			//1. Connection 주소 얻기
			getConnection();
			//2. SQL문장 => index : unique, primary key는 자동으로 인덱스 생성됨
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,filesize,num "
						+"FROM (SELECT no,subject,name,regdate,hit, filesize,rownum as num "
						+"FROM (SELECT /*+ INDEX_DESC(databoard db_no_pk)*/ no,subject,name,regdate,hit,filesize "
						+"FROM databoard)) "
						+"WHERE num BETWEEN ? AND ?";
						// rownum 등 오라클은 대부분 1번부터 시작
			//3. 전송
			ps=conn.prepareStatement(sql);
			//4. ?에 값 채우기
			int rowSize=10; //10개씩 출력
			int start=(rowSize*page)-(rowSize-1); //1, 11, 21...
			int end=rowSize*page; //10, 20, 30...
			ps.setInt(1, start);
			ps.setInt(2, end);
			//5. 실행요청
			ResultSet rs=ps.executeQuery();
			//6. ArrayList에 읽어온 데이터 담기
			while(rs.next())
			{
				DataboardVO vo=new DataboardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4)); //TO_CHAR일 땐 무조건 String으로 받기
				vo.setHit(rs.getInt(5));
				vo.setFilesize(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			//반환
			disConnection();
		}
		return list;
	}
	//3-2. 새글 => 업로드
	public void databoardInsert(DataboardVO vo)
	{
		try
		{
			getConnection();
			String sql="insert into databoard(no,name,subject,content,pwd,filename,filesize) "
					+ "values (db_no_seq.nextval,?,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			//?에 값 채우기
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
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
	//3-3. 상세보기 => 조회수 증가, 다운로드 => response.setHeader()
	public DataboardVO databoardDetailData(int no) // 사용자가 보낸 no : ../main/main.jsp?mode=8&no= 
	{
		DataboardVO vo=new DataboardVO();
		try
		{
			//1. Connection 주소값 얻기
			getConnection();
			//2. sql문장
			//2-1. 
			String sql="UPDATE databoard SET "
						+"hit=hit+1 "
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			//조회수 증가
			//상세볼 데이터 읽기
			sql="SELECT no,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD'),hit,filename,filesize "
				+"FROM databoard "
				+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			/*
				회원가입 => 로그인, 회원가입, 회원수정, 회원탈퇴, 아이디 찾기, 비밀번호 찾기
				게시판 => 계층형 댓글, 묻고 답하기
				예약, 결제, 추천
			*/
			ps.setInt(1, no);
			//결과값 읽기
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbday(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace(); //에러 처리
		}
		finally
		{
			disConnection();
			//반환
		}
		return vo;
	}
	//총페이지
	public int databoardRowCount()
	{
		int count=0;
		try
		{
			//1. Connection 주소 읽기
			getConnection();
			//2. sql문장
			String sql="SELECT count(*) FROM databoard";
			//3. sql문장 전송
			ps=conn.prepareStatement(sql);
			//4. 실행결과 받기
			ResultSet rs=ps.executeQuery();
			//5. 변수에 저장
			rs.next(); //데이터가 출력되는 위치로 커서 이동
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
	//3-4. 수정 => 파일명이 변경됐을 때 기존것 제거, 새로운 파일 추가 
	
	//3-5. 삭제 => 파일과 동시에 삭제
	public DataboardVO databoardInfoData(int no)
	{
		DataboardVO vo=new DataboardVO();
		try
		{
			getConnection();
			String sql="SELECT filename,filesize FROM databoard "
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFilename(rs.getString(1));
			vo.setFilesize(rs.getInt(2));
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
	public boolean databoardDelete(int no,String pwd)
	{
		boolean bCheck=false;
		try
		{
			getConnection();
			String sql="SELECT pwd FROM databoard " //비밀번호 확인
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd)) //본인여부 확인 (
			{
				bCheck=true;
				//실제 데이터베이스 삭제
				sql="DELETE FROM databoard "
					+"WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return bCheck;
	}
	
	//수정 데이터 가지고 오기
	public DataboardVO databoardUpdateData(int no) // 사용자가 보낸 no : ../main/main.jsp?mode=8&no= 
	{
		DataboardVO vo=new DataboardVO();
		try
		{
			//1. Connection 주소값 얻기
			getConnection();
			//2. sql문장
			//2-1. 
			String sql="SELECT no,name,subject,content "
						+"FROM databoard "
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			/*
				회원가입 => 로그인, 회원가입, 회원수정, 회원탈퇴, 아이디 찾기, 비밀번호 찾기
				게시판 => 계층형 댓글, 묻고 답하기
				예약, 결제, 추천
			*/
			ps.setInt(1, no);
			//결과값 읽기
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace(); //에러 처리
		}
		finally
		{
			disConnection();
			//반환
		}
		return vo;
	}
	
	//실제 수정
	public boolean databoardUpdate(DataboardVO vo)
	{
		boolean bCheck=false;
		try
		{
			getConnection();
			//비밀번호 검색, 확인
			String sql="SELECT pwd FROM databoard "
						+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				sql="UPDATE databoard SET "
					+"name=?,subject=?,content=? "
					+"WHERE no=?";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				ps.executeUpdate();
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return bCheck;
	}
}





