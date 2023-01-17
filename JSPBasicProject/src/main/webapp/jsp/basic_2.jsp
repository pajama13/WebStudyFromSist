<%-- 자바영역, html영역 괄호구분 잘하기 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
    for(int i=0; i<10; i++)
    {
  %>
  		<b><%=i %></b><br>
  <%
    }
  %>
</body>
</html>