package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.Controller;
/*
	MVC
	
	Model
	  -사용자 요청값 처리, 데이터베이스 연동
	  -사용자 요청을 처리하여 request에 결과값을 저장
	View
	  -Controller가 보내준 request만 출력
	Controller
	  -.do(지정문구)를 확인하여 요청 받는 역할(.do 가 있으면 Dispatcher 호출됨)
	  -Model 찾고 메소드 호출, request에 해당 JSP 전송
	 
	JSP 요청 => button, a, form, menu <===> Controller <======> Model <===> DAO
	                                request       request,session   request
*/
import com.sist.controller.RequestMapping;
@Controller
public class FreeBoardModel {
	@RequestMapping("freeboard/list.do")
	public String freeboard_list(HttpServletRequest request,HttpServletResponse response)
	{
		//1. 사용자 요청값 
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		//현재페이지 지정 => 사용자 보는 페이지 지정
		int curpage=Integer.parseInt(page);
		//2. 데이터베이스 연동
		FreeBoardDAO dao=new FreeBoardDAO();
		List<FreeBoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		
		//3. 결과값을 request에 저장
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main_jsp", "../freeboard/list.jsp");
		return "../main/main.jsp";  //
	}
	@RequestMapping("freeboard/insert.do")
	public String freeboard_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../freeboard/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("freeboard/insert_ok.do")  //_ok => redirect
	public String freeboard_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		//한글 변환 처리(필수)
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		//사용자가 보내준 데이터를 받는다
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		//FreeBoardVO에 묶어서 => 오라클 전송
		FreeBoardVO vo=new FreeBoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		FreeBoardDAO dao=new FreeBoardDAO();
		dao.boardInsert(vo);
		//화면이동 => list.do
		//redirect: 부분은 Spring.jar와 관련됨, 이전 Controller패키지 파일 참고
		return "redirect:../freeboard/list.do";   //sendRedirect("../freeboard/list.do")
	}
	@RequestMapping("freeboard/detail.do")
	public String freeboard_detail(HttpServletRequest request,HttpServletResponse response)
	{
		//출력에 필요한 데이터 전송
		//사용자가 요청한 데이터를 받아서 처리 => 게시물 번호 받기
		String no=request.getParameter("no");
		//DAO로 전송 => 오라클에서 데이터 읽기
		FreeBoardDAO dao=new FreeBoardDAO();
		FreeBoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../freeboard/detail.jsp");
		return "../main/main.jsp";
	}
}
