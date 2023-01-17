package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SeoulModel {
	public void seoulListData(HttpServletRequest request,HttpServletResponse response)
	{
		/*String no=request.getParameter("no");*/
		SeoulDAO dao=new SeoulDAO();
		
		ArrayList<SeoulVO> list=dao.seoulListData();
		request.setAttribute("list", list);
		
	}
}
