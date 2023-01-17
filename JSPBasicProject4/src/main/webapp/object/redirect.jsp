<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	System.out.println("redirect.jsp:id=>"+id);
	//이동
	response.sendRedirect("basic_jsp5.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
	화면 이동하면(jsp파일 바뀌면) request는 초기화됨
--%>
<body>
  
</body>
</html>