<%--
	
	82p
	
	JSP 동작과정
	1. 사용자 브라우저 주소창에서 요청 (사용자 요청은 항상 주소창에서 한다 => 주소창은 반드시 파일명을 맨마지막에 첨부)
	   http://localhost/JSPBasicProject3/jsp/basic_2.jsp
	                    -------------------------------- basic_2.jsp를 브라우저에서 보여달라
	2. Web Server에서 파일을 받아서 (.html, .xml)이 아닌 경우 : 톰캣으로 전송
	3. 톰캣
	   1) basic_2.jsp => 자바로 변경 (basic_2_jsp.java) => servlet파일(웹에서 실행하는 자바파일)**
	      확인 : 존재여부 => 없는 경우 [생성], 있는 경우 [수정] => CREATE OR REPLACE
	   2) basic_2_jsp.java => 컴파일 => class파일 생성 : basic_2_jsp.class파일
	   3) JVM 가상머신
	      basic_2_jsp.class파일 로딩(읽어오기)
	      인터프리터 통해 번역 
	      => out.write("<html>") => 메모리 안에 <html>만 출력
	   4) 메모리에 저장된 html을 브라우저가 읽어서 출력
	   
	   
	   _jspInit() => web.xml (설정)
	   _jspService() => 사용자 요청에 의한 html 작성 => 메소드 안에 들어가는 소스코딩 (JSP파일)
	   _jspDestroy() => 메모리 해제
	   
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>