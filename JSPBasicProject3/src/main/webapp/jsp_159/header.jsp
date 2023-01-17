<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode=request.getParameter("mode");

	String jsp="";
	if(mode==null)
		mode="0";
	switch(mode)
	{
		case "0": jsp="home.jsp"; break;
		case "1": jsp="food.jsp"; break;
		case "2": jsp="recipe.jsp"; break;
		case "3": jsp="t.jsp"; break;
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">JSP액션</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main.jsp?mode=0">홈</a></li>
      <li><a href="main.jsp?mode=1">맛집</a></li>
      <li><a href="main.jsp?mode=2">레시피</a></li>
      <li><a href="main.jsp?mode=3">여행</a></li>
    </ul>
  </div>
</nav>
</body>
</html>