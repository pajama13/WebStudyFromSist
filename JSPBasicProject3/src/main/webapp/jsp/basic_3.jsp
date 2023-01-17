<%--
	1. JSP : java + html
	   자바 : 데이터 관리 (오라클 연동)
	   html : 브라우저에 출력할 용도 
	   ------------------------------------
	   자바/html 구분
	   ------------
	   => JSP의 스크립트 요소가 등장
	      1) 선언문 : 메소드, 메멉변수 => 사용빈도 거의 없음 : 보안상 문제 발생하기 때문
	                <%! %>
	      2) 스크립트릿 : 메소드 안에 들어가는 소스코딩
	                  메소드 호출, 지역변수, 제어문, 연산자 ...
	                  <% %>
	      3) 표현식 : 브라우저에 자바 관련 내용 출력, 변수값
	                <%= %>
	      4) 주석 <!-- --> (html주석)
	      
	      *주의사항 : <%! %>, <% %> 안에는 자바 문법 사용 
	      -out.println(여기에 출력하는 내용만 기재)
	      -중복하면 오류 발생 => <% <% %> %> 오류 발생
	      
	      
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//자바 => .class
	
	String name="홍길동";
	int a,b,c,d;
	
	public int add(int a,int b)
	{
		return a+b;
	}
	
	public int minus(int a,int b)
	{
		return a-b;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		선언식에 있는 메소드 호출 => 스크립트릿을 이용
		
	 --%>
	 <h1><%=name %></h1>  <%-- 출력위치 : html <태그></태그> / html주석은 출력 시 소스코드에 내용 보임 --%>
	 
	 <%
	 	int a=10;
	 	int b=20;
	 	int c=add(a,b);
	 	int d=minus(a,b);
	 %>
	 <h3><%=c %></h3>
	 <h3><%=d %></h3>
	 
</body>
</html>