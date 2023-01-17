<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%--
	화면 출력 부분이 아니고 전송된 데이터를 받아서 요청 처리만 수행함
	
	화면 출력 부분으로 이동을 한다 sendRedirect("list.jsp")
	요청 처리
	=> 목록 => insert, delete
	=> 상세보기 => update
	
--%>
<jsp:useBean id="dao" class="com.sist.dao.BoardDAO"/> <%-- BoardDAO dao=new BoardDAO() --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.sist.dao.BoardVO">
  <jsp:setProperty name="vo" property="*"></jsp:setProperty>
</jsp:useBean>
<%
	dao.boardInsert(vo);
	response.sendRedirect("list.jsp");
%>
<%--
	//1. 사용자가 보내준 데이터를 받는다
	//1-1. 한글 변환
	request.setCharacterEncoding("UTF-8");
	// <jsp:setProperty name="vo" property="*"/> 하면 아래 코드들을 한줄로 처리 가능
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	//1-2. VO에 값 채우기
	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	//1-3. 오라클로 전송
	BoardDAO dao=new BoardDAO();
	dao.boardInsert(vo);
	//1-4. 화면 이동
	response.sendRedirect("list.jsp");
	
--%>