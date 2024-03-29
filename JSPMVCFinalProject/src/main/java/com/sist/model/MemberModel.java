package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

import java.util.*;
@Controller
public class MemberModel {
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
	  CommonsModel.footerData(request);
	  return "../main/main.jsp";
  }
  //자바스크립트로 ajax 등이 단독수행할 시 해당 jsp파일 return
  @RequestMapping("member/idcheck.do")
  public String member_idCheck(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/idcheck.jsp";  //ajax 쓸 땐 .do가 아닌 해당 jsp파일로 이동
  }
  @RequestMapping("member/idcheck_result.do")
  public String member_idcheck_result(HttpServletRequest request,HttpServletResponse response)
  {
	  String id=request.getParameter("id"); //idcheck.jsp에서 보낸 id 값 받기
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberIdCheck(id);
	  request.setAttribute("count", count); //JSP로 값을 전송(해당 jsp파일 ajax에서 값 읽어감)
	  return "../member/idcheck_result.jsp";
  }
  @RequestMapping("member/postfind.do")
  public String member_postfind(HttpServletRequest request,HttpServletResponse response)
  {
	  return "../member/postfind.jsp";
  }
  @RequestMapping("member/postfind_result.do")
  public String member_postfind_result(HttpServletRequest request,HttpServletResponse response)
  {
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  //data:{"dong":dong} => ?dong=역삼
	  String dong=request.getParameter("dong");
	  //DAO 연동
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberPostCount(dong);
	  List<ZipcodeVO> list=dao.memberPostFind(dong);
	  request.setAttribute("count", count);
	  request.setAttribute("list", list);
	  return "../member/postfind_result.jsp";
  }
  @RequestMapping("member/email_check.do")
  public String member_email_check(HttpServletRequest request,HttpServletResponse response)
  {
	  String email=request.getParameter("email");
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberEmailCheck(email);
	  request.setAttribute("count", count);
	  return "../member/email_check.jsp";
  }
  @RequestMapping("member/tel_check.do")
  public String member_tel_check(HttpServletRequest request,HttpServletResponse response)
  {
	  String phone=request.getParameter("phone");
	  MemberDAO dao=new MemberDAO();
	  int count=dao.memberPhoneCheck(phone);
	  request.setAttribute("count", count);
	  return "../member/tel_check.jsp";
  }
  @RequestMapping("member/join_ok.do")
  public String member_insert(HttpServletRequest request,HttpServletResponse response)
  {
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  String name=request.getParameter("name");
	  String sex=request.getParameter("sex");
	  String birthday=request.getParameter("birthday");
	  String post=request.getParameter("post");
	  String addr1=request.getParameter("addr1");
	  String addr2=request.getParameter("addr2");
	  String email=request.getParameter("email");
	  String tel1=request.getParameter("tel1");
	  String tel2=request.getParameter("tel2");
	  String content=request.getParameter("content");
	  
	  MemberVO vo=new MemberVO();
	  vo.setId(id);
	  vo.setPwd(pwd);
	  vo.setName(name);
	  vo.setSex(sex);
	  vo.setBirthday(birthday);
	  vo.setPost(post);
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  vo.setEmail(email);
	  vo.setPhone(tel1+"-"+tel2);
	  vo.setContent(content);
	  
	  MemberDAO dao=new MemberDAO();
	  dao.memberInsert(vo);
	  
	  return "redirect:../main/main.do";
  }
  @RequestMapping("member/login.do")
  public String member_login(HttpServletRequest request,HttpServletResponse response)
  {
	  //data:{"id":id,"pwd":pwd} 받아온 후
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  MemberDAO dao=new MemberDAO();
	  //결과값 받기
	  MemberVO vo=dao.memberLogin(id, pwd);
	  if(vo.getMsg().equals("OK"))
	  {
		  //session(전역변수 성격)에 저장 => 모든 jsp에서 사용할 수 있도록 (ex 예약페이지에서 id값 사용 등)
		  //데이터를 계속 유짛고 싶을 때 session에 저장
		  //session 생성 (세션이나 쿠키는 모두 request 통해서 생성함)
		  HttpSession session=request.getSession();
		  session.setAttribute("id", vo.getId());
		  session.setAttribute("name", vo.getName());
		  session.setAttribute("admin", vo.getAdmin());
	  }
	  request.setAttribute("result", vo.getMsg());
	  return "../member/login.jsp";
  }
  @RequestMapping("member/logout.do")
  public String member_logout(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  session.invalidate(); //모든 정보 해제
	  return "redirect:../main/main.do";
  }
}