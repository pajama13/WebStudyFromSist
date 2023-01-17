<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	
	JSP : Java Server Page
	
	JSP = html + java
	
	httped 파일 찾기
	
	html/xml/json
	=> 번역할 필요 없음, 브라우저에서 바로 실행 가능
	
	실행과정 :
	1) 사용자 요청 url(파일명)
	  
	  http://localhost:8080/JSPBasicProject/jsp/basic_1.jsp
	  
	2) 톰캣이 요청을 받는다
	3) 파일 찾기
	 찾은경우
	  -1) jsp 파일을 자바파일로 변경 : 파일명.jsp.java
	  -2) 변경된 파일을 컴파일 한다 : 파일명.jsp.class
	  -3) JVM에서 .class파일 로딩
	  -4) 한줄씩 번역 시작 (인터프리터)
	  -5) 메모리에 html만 출력
	 
	 못찾은 경우 : 404 화면 출력
	
	
	소스코딩 :
	  자바영역
	  1) <%@ page import=""%>
	  2) 일반 자바 코딩 영역
	     <%
	       변수 선언
	       제어문
	       메소드 호출
	       자바 주석
	     %>
	  3) 출력 : 변수값
	    <%= 변수%>
	    
	  HTML 영역
	    <%@ %> <% %> <% %>를 제외한 영역
	
 --%>
<%--

JSP에선 out.print("")가 포함돼있어 생략됨

초창기 코드 : out.print("<!DOCTYPE html>")
           out.print("<html>")

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
  String name="홍길동";
  out.println(name);
  %>
</body>
</html>