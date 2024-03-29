package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

@Controller
public class AdminModel {
	@RequestMapping("adminpage/admin_main.do")
	public String admin_main(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	private String[] prefix={"","일반공지","이벤트공지","맛집공지","여행공지","상품공지"};
	@RequestMapping("adminpage/notice_list.do")
	public String admin_notice_list(HttpServletRequest request,HttpServletResponse response)
	{
		
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		NoticeDAO dao=new NoticeDAO();
		List<NoticeVO> list=dao.noticeListData(curpage);
		
		for(NoticeVO vo:list)
		{
			vo.setPrefix("["+prefix[vo.getType()]+"]");
		}
		
		int totalpage=dao.noticeTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		
		request.setAttribute("admin_jsp", "../adminpage/notice_list.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_insert.do")
	public String notice_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("admin_jsp", "../adminpage/notice_insert.jsp");
		request.setAttribute("main_jsp", "../notice/list.jsp");
		CommonsModel.footerData(request);
		return "../main/main.jsp";
	}
	@RequestMapping("adminpage/notice_insert_ok.do")
	public String admin_notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		//사용자 전송 데이터 받기
		//한글 변환 처리
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String type=request.getParameter("type");
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		//DAO연결 => 오라클
		
		return "redirect:notice_list.do";
	}
}
