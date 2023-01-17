<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*"%>
<%
	request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지
	
%>
<%--
	<jsp:useBean id="bean" class="com.sist.vo.MyBean">
	==> 동일한 코드 : MyBean bean=new MyBean();
	
	<jsp:setProperty name="bean" property="*"/>
	==> 동일한 코드 :  String name=request.getParameter("name");
					String sex=request.getParameter("sex");
					String loc=request.getParameter("loc");
					String content=request.getParameter("content");
					
					bean.setName(name);
					bean.setSex(sex);
					bean.setLoc(loc);
					bean.setContent(content);	
	
	public String beanData(Mybean vo) => 스프링 메소드는 매개변수 지정하면 자동으로 값이 채워짐
 --%>
<jsp:useBean id="bean" class="com.sist.vo.MyBean">
  <jsp:setProperty name="bean" property="*"/>
</jsp:useBean>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>개인정보 출력</h1>
  이름 : <jsp:getProperty name="bean" property="name"/><br> <%-- getProperty:get메소드 호출 --%>
  성별 : <jsp:getProperty name="bean" property="sex"/><br>
  지역 : <jsp:getProperty name="bean" property="loc"/><br>
  소개 : <jsp:getProperty name="bean" property="content"/><br>
</body>
</html>