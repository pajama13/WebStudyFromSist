package com.sist.model;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class FoodModel {
	public void foodListData(HttpServletRequest request, HttpServletResponse response)
	{
		String fno=request.getParameter("fno");
		FoodDAO dao=new FoodDAO();
		FoodVO vo=dao.foodListData(Integer.parseInt(fno));
		request.setAttribute("vo", vo);
	}
}
