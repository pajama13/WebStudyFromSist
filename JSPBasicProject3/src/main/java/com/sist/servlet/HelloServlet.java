package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*

	MVC => Controller(Servlet) => Spring

*/

@WebServlet("/HelloServlet") // 매칭되는 클래스 이름 (이름은 바꿀 수 있음)
                             // 회사명 => a.daum, a.nhn, a.naver
/* 클라이언트 (브라우저) <========> 서버
                      주소창
   
   클라이언트에서 어떤 값을 전송할지... -프론트엔드
   요청값을 받아서 어떤 화면을 브라우저로 전송할지 -백엔드
   
   예)
   		로그인 => id, pwd
   		화면 => main
   		
   		명소 => 상세보기
   		---
   		client => 명소 번호 전송
   		server => 오라클에 저장 => 화면 목록으로 이동
   		
   		게시판 => 글쓰기
   		----
   		client => 글쓴 내용을 전송
   		server => 오라클에 저장 => 화면 목록으로 이동
   		
   		=> 웹공부 *** : 화면 클릭, url확인(파일명 등), 화면 확인
   		
   
   서블릿 호출**
   1) http://localhost/JSPBasicProject3/HelloServlet 브라우저에서 요청
   2) 서버에서 => WAS에서 서블릿 클래스를 찾음 (HelloServlet)
               ---- Web Application Server (톰캣, 레진...) => WAS, 형상관리(깃)
   3) init() 메소드 호출
   4) service() 메소드 호출 => html을 브라우저로 전송
      -------- doGet(), doPost()
   5) 브라우저, 화면 이동 => destroy()
   
*/
// 사용자 url 주소 => 마지막에 /HelloServlet => 톰캣이 HelloServlet를 호출
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// => 톰캣에 의해 호출됨

	public void init(ServletConfig config) throws ServletException {
		//멤버 변수 초기화, 자동 로그인 => 파일 읽기(Cookie) => 생성자 역할
		System.out.println("서블릿 초기화 메소드 호출...");
	}


	public void destroy() {
		//브라우저 종료, 파일 이동, 새로고침 => 자동 메모리 해제
	}
	/*
		html
		----
		데이터를 전송 => 서버가 받아서 처리
		|            ------------- 자바
		GET / POST / PUT / DELETE
		----------- update delete
		GET : 데이터 전송 방식 : hhtp://localhost/main/main.jsp?no=10; => url 뒤에 데이터를 묶어서 전송
		                                          --------------
		                                          main.jsp로 no값을 전송 => 메소드가 없기 때문에 매개변수를 이용할 수 없음
		                                          
		POST : no=10 => 감춰서 보내줌 (url 뒤에 데이터가 안 보임)
		       => 보안 : id, password, 데이터가 많은 경우(회원가입/글쓰기/상품 입력 등)
		
		GET => doGet()
		POST => doPost()
		        -------- service(), JSP는 구분이 없음 => 자체 조건문으로 (GET, POST)
		  
	*/

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
			서버로 전송 : GET / POST
			
			HTML
			<a> => GET 방식만 사용 가능 => 데이터 전송 (?변수=값)
			
			JavaScript
			  location.href="" => GET
			  ***Ajax
			     type=POST, GET...
			  ***VueJS
			     axios.get(), axios,post()
			  ***ReactJS
			     axios.get(), axios,post()
			  
			  Java
			     sendRedirect() => POST
		

		
		*/
		//1. 브라우저에 보내는 type 형식 지정 : text/html(HTML), text/xml(XML), text/plain(JSON)
		response.setContentType("text/html;charset=UTF-8"); //한글포함
		//2. 어떤 브라우저로 전송할지 설정
		PrintWriter out=response.getWriter();
		//              요청한 브라우저의 정보 (IP)
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Hello Servlet</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	//브라우저 화면을 출력하는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
