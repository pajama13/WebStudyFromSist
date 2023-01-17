<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	//DAO 연결
	BoardDAO dao=new BoardDAO();
	boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
	//목록 이동
	if(bCheck==true)
	{
		response.sendRedirect("list.jsp");
	}
	else
	{
%>
		<script>
		alert("비밀번호가 올바르지 않습니다.");
		history.back();
		</script>
<%
	}
%>