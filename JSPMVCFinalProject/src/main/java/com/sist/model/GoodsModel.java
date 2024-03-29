package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class GoodsModel {
   @RequestMapping("goods/goods_all.do") //if문 대신 사용 : 어노테이션("A")이면 아래 메소드 호출해라
   public String goodsAll(HttpServletRequest request,HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      GoodsDAO dao=new GoodsDAO();      
      ArrayList<GoodsVO> list=dao.goodsAllListData(curpage);
      int totalpage=dao.goodsAllTotalPage();
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      if(endPage>totalpage)
         endPage=totalpage;
      // 화면에 출력할 모든 데이터를 JSP로 전송 
      // 페이지 나누고 목록 출력
      request.setAttribute("list", list);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("main_jsp", "../goods/goods_all.jsp");// main.jsp에서 include되는
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
   
   @RequestMapping("goods/goods_best.do")
   public String goodsBest(HttpServletRequest request,HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      GoodsDAO dao=new GoodsDAO();      
      ArrayList<GoodsVO> list=dao.goodsBestListData(curpage);
      int totalpage=dao.goodsBestTotalPage();
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      if(endPage>totalpage)
         endPage=totalpage;
      // 화면에 출력할 모든 데이터를 JSP로 전송 
      // 페이지 나누고 목록 출력
      request.setAttribute("list", list);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("main_jsp", "../goods/goods_best.jsp");// main.jsp에서 include되는
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
   
   @RequestMapping("goods/goods_new.do")
   public String goodsNew(HttpServletRequest request,HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      GoodsDAO dao=new GoodsDAO();      
      ArrayList<GoodsVO> list=dao.goodsNewListData(curpage);
      int totalpage=dao.goodsNewTotalPage();
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      if(endPage>totalpage)
         endPage=totalpage;
      // 화면에 출력할 모든 데이터를 JSP로 전송 
      // 페이지 나누고 목록 출력
      request.setAttribute("list", list);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("main_jsp", "../goods/goods_new.jsp");// main.jsp에서 include되는
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
   
   @RequestMapping("goods/goods_sp.do")
   public String goodsSpecial(HttpServletRequest request,HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      GoodsDAO dao=new GoodsDAO();      
      ArrayList<GoodsVO> list=dao.goodsSpecialListData(curpage);
      int totalpage=dao.goodsSpecialTotalPage();
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      if(endPage>totalpage)
         endPage=totalpage;
      // 화면에 출력할 모든 데이터를 JSP로 전송 
      // 페이지 나누고 목록 출력
      request.setAttribute("list", list);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("main_jsp", "../goods/goods_sp.jsp");// main.jsp에서 include되는
      CommonsModel.footerData(request);
      return "../main/main.jsp";
   }
}