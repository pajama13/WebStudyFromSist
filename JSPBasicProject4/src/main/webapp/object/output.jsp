<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 사용자가 보내준 데이터를 받는다
	//2. 데이터베이스 연결
	//3. 화면 이동 / 출력
	
    /*
    	화면 이동 : 회원가입 후 회원 수정함 => main.jsp 메인페이지 이동
    	         글쓰기 업로드 완료 => 목록 화면 보여주기
    */
    
    //name, sez, loc, hobby, content
    //--------------         -------
    //한글변환 처리(한글깨짐방지)
    request.setCharacterEncoding("UTF-8");
    String name=request.getParameter("name");
    String sex=request.getParameter("sex");
    String loc=request.getParameter("loc");
    String content=request.getParameter("content");
    //<input type=text, password...>,<textarea>,<select> => request.getParameter()
    //<input type=checkbox> request.getParameterValues()
    String[] hobby=request.getParameterValues("hobby");
    		
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>전송받은 값 출력</h1>
  이름  <%=name %><br>
  성별  <%=sex %><br>
  지역  <%=loc %><br>
  소개  <%=content %><br>
  취미 
    <ul>
    <%
    	if(hobby!=null) //if 대신 try/catch 이용해도 됨
    	{
    		for(String h:hobby)
    		{
    %>
    		<li><%=h %></li>
    <%
    		}
    	}else
    	{
    %>
    		<span style="color:red">취미가 없습니다</span>
    <%
    	}
    %>
    </ul>
</body>
</html>