<%--
	
	C/S => 17p
	
	Client / Server (결과값 전송) => 동적페이지 : JSP/PHP/CGI/ASP
	------
	실행되는 프로그램 : HTML => 정적페이지
	Client : 브라우저/핸드폰 => 요청
	Server : 요청 받아서 처리
	         ------------
	         웹서버 ==> 아파치(java) / IIS(MS) => 요청만 받아서 응답 역할
	                  프로그램 번역기능이 없음 (html/xml/json)
	         웹컨테이너 ==> 톰캣 (자바를 번역해서 => html, xml로 변환)
	                     |
	                     테스트용 웹서버(50명) => AWS (리눅스) => 과금 주의 : 인스턴스(운영체제 빌리기) => PaaS
	                     	                            => IP (고정IP)
	                     	                            => IP => 인스턴스 삭제 필요!!
	                     	                            => 4200만원 (=> 채굴당해서 과금 많이 발생한 케이스)
	                   
	                     
	         => Servlet
	            ------- Server + Applet (let : 가벼운 프로그램)
	            |
	            단점 : 순수하게 자바로만 코딩하기 때문에, 변경 시마다 컴파일을 다시 해야함
	                  --------------- 소스 노출이 없음 (.class)
	                  JSP => 스크립트 형식으로 제작 => 실행과 동시에 변경 가능
	                  --- 자바/html 분리, 보안 취약함 (JSP자체), 재사용성이 없음, 반복 코딩이 많음
	                                             ----
	                                             MVC (최근 JSP : View는 Front 담당)
	                                             ---
	                                             M : 백엔드 (Model : ~VO, DAO, Service, Manager)
	                                             V(view) : 프론트엔드 (html, JSP)
	                                             C(controller) : 연결
	                                             ------------- 스프링에서 제작돼있음
	         클라이언트 : 파일 요청 : HttpServletRequest => url 맨마지막 : 파일명
	         서버     : 파일 찾아서 사용자 브라우저로 전송 : HttpServletResponse
	                                ----------- 브라우저에서 실행하는 파일을 전송(html, xml)
	                                
			 JSP : 웹 프로그램 언어는 동적으로 페이지를 생성하기 위한 서버측 스크립트 언어
			                                                ---------- 단순한 언어
			 JSP : java + html
			       -----------
			       자바 코딩 : <% %>
			       브라우저에 출력 : <%= %>
			       메소드, 변수 선언 : <%! %>
			       ---------------------- 영역을 벗어나면 브라우저 일반 텍스트
			 
			 72p
			 사용자 : a.jsp => a.jsp.java => a.jsp.class => 실행 (html)
			                               ----------- 서블릿
			                                           => 실행결과를 메모리에 저장
			                                           => 브라우저에서 미리보기
			       
	         74p
	         JSP 생명주기
	         ---------
	         _jspInit() => 코딩 불가능 / web.xml
	         |
	         _jspServlet() => JSP에서 코딩한 내용이 첨부됨 => 브라우저에 실행되는 화면 UI
	         |                ***JSP는 클래스가 아니라 메소드 영역임
	         _jspDestroy() => 새로고침, 파일 이동 시 자동으로 메모리에서 해제됨
	         
	         /a.jsp => new => 메모리 해제
	         /a.jsp => new => 메모리 해제
	         ------------------------- 현재 위치에서 작업(자바스크립트) => ajax, Vue, React
	
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