<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("UTF-8");  //한글 변환
	// 각 JSP마다 request를 갖고 있음 => 보내는 JSP에서 한글변환해줘야 함
	// GET은 window 10에서는 자동처리
	// POST방식은 한글 처리가 안 됨 request.setCharacterEncoding("UTF-8");
	String path="c:\\download"; //업로드된 파일 저장위치
	int size=1024*1024*100; //100mb 업로드된 파일의 최대 크기(벗어나면 못 들어감)
	String enctype="UTF-8"; //한글파일명 안 깨지도록
	MultipartRequest mr=new MultipartRequest(request,path,size,enctype,new DefaultFileRenamePolicy());
	//new DefaultFileRenamePolicy() => 같은 파일명일 때 파일명 변경
	//업로드 완료
	//데이터베이스에 저장
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	String filename=mr.getFilesystemName("upload");
					/*
						mr.getOriginalFileNmae("") => 사용자가 보내준 파일명
						mr.getFilesystemName("") => 변경된 파일명
					*/
	DataboardVO vo=new DataboardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	if(filename==null) //파일 업로드 없을 때
	{
		vo.setFilename("");
		vo.setFilesize(0);
	}
	else //파일 업로드 했을 때
	{
		File file=new File(path+"\\"+filename);
		vo.setFilename(filename);
		vo.setFilesize((int)file.length()); //실제 저장된 파일 크기를 읽어온다
	}
	//vo를 DAO를 통해서 오라클로 저장
	DataboardDAO dao=new DataboardDAO();
	dao.databoardInsert(vo);
	//화면이동 => 목록 출력
	response.sendRedirect("../main/main.jsp?mode=5"); //mode가 include하는 jsp구분자
	
%>    
