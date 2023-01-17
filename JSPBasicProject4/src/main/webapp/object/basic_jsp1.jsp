<!-- 
	171p
	
	내장객체*** => spring과 관련
	
	1) 내부객체(=내부객체, 기본객체)
	   => 미리 객체를 생성한 다음에 사용 가능
	   => 9개
	   => JSP파일 => _jspService()에 필요한 코딩을 하는 파일
	   
      public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException
      {
	   
			final javax.servlet.jsp.PageContext pageContext;
		    javax.servlet.http.HttpSession session = null;
		    final javax.servlet.ServletContext application;
		    final javax.servlet.ServletConfig config;
		    javax.servlet.jsp.JspWriter out = null;
		    final java.lang.Object page = this;
		    javax.servlet.jsp.JspWriter _jspx_out = null;
		    javax.servlet.jsp.PageContext _jspx_page_context = null;
		    
		    //JSP코딩 위치;
		    
	   }
	   
	   *** request
	   *** response
	   *** pageContext
	   *** session
	   *** application
	   config
	   ***out
	   pag e
	   exception
	   -------------------- 내장객체
	   
	   _jspService() => 브라우저 화면에 출력
	   {
	   		JSP파일
	   }
	   
	   1) 요청 관련 데이터 관리, 사용자의 브라우저 정보, 추가 기능
	      request : HttpServletRequest
	      
	      *기능
	      1. 브라우저 정보 / 서버 정보 보유
	         http://localhost:8080/JSPBasicProject4/object/basic_jsp1.jsp => URL
	         --------------------- ---------------------------------------
	         서버정보                 사용자 요청 정보(URI)
	                               ----------------
	                               ContextPath
	         -*** getRequestURL()
	         -*** getRequestURI()
	         -*** getContextPath()
	         -*** getRemoteAddr() => 사용자의 IP => 조회수 기능 관련 (같은 IP에선 중복 안 되도록)
	         -getServerPort() => 80
	         -getServerInfo() => localhost
	         
	      2. 요청 관련 데이터 보유 (사용자, 브라우저 정보는 HttpServletRequest에 저장됨)
	      
	         -사용자가 보내준 단일데이터 : getParameter()
	         -사용자가 보내준 다중데이터 => checkbox : getParameterValues()  //키값 넣는 것
	         -사용자가 보내준 데이터 Parameter => getParameterNames()
	         -브라우저 ==> Java(2byte)
	         
	                1byte => 2byte로 변경(디코딩)
	          Java(2byte) => 1byte(인코딩)
	         
	         https://www.google.co.kr/search?q=%EC%9E%90%EB%B0%94&source=hp&ei=i2G7Y9HcGZn3hwOlrbKoAQ&iflsig=AK50M_UAAAAAY7tvmz8O7giJutJjGLjAAPg7m1PHtsqE&ved=0ahUKEwiRzqapn7n8AhWZ-2EKHaWWDBUQ4dUDCAo&uact=5&oq=%EC%9E%90%EB%B0%94&gs_lcp=Cgdnd3Mtd2l6EAMyCwgAEIAEELEDEIMBMggIABCABBCxAzIICAAQgAQQsQMyBQgAEIAEMgUIABCABDIFCAAQgAQyCAgAEIAEELEDMgUIABCABDIFCAAQgAQyBAgAEAM6EQguEIAEELEDEIMBEMcBENEDOggILhCABBCxAzoLCC4QgAQQsQMQgwE6BwguENQCEANQAFiYBGChCWgBcAB4AYAB9wKIAegGkgEHMC4yLjEuMZgBAKABAQ&sclient=gws-wiz
	         브라우저 전송 시 byte배열로 바뀜(인코딩)
	         
	         byte[]변경 : 인코딩
	         자바 => 한글 변환 byte[] => String : 디코딩
	         -------------------------------------
	         1) byte[] => String 브라우저에서 값을 받는 경우 : 디코딩(받을 때)
	            request.setCharacterEncoding("UTF-8"); => POST방식에서 디코딩
	         2) String => byte[] 브라우저에서 값 전송 : 인코딩(보낼 떄)
	            URIEncoder.encoder(데이터,"UTF-8") => 자바/자바스크립트가 동일
	         ------------------------------------- 처리방식 GET/POST 따라 다름
	         											----- window 10 (자동처리) => server.xml
	         											63번째줄 URIEncoding="UTF-8"
	         
	         *** 데이터 전송
	         	 받는파일명?변수명=값
	         	 ------ ----- --
	         	        key   vlaue (map방식)
	         	 
	         	 a.jsp?no=10
	         	 => a.jsp
	         	    request.getParamater("no");
	         	                         ----- key값 들어감
	         	 
	         	 a.jsp?id=admin&pwd=1234;
	         	      --------- ---------
	         	      request.getParameter("id"); //admin
	         	      request.getParameter("pwd"); //1234
	         	      
	         	      ** 모든 데이터는 데이터값이 String
	         	      
	         	 
	         	 a.jsp?hobby=a&hobby=b&ohbby&habboy=c;
	         	       ------------------------------
	         	       String[] request.getParameterValues("hobby);
	         	        
	       3. 추가기능 : 사용자가 보내준 데이터 + 필요한 데이터 추가해서 전송 (MVC, Spring)
	          setAttribute(키,값) :\=> Object를 첨부 (ArrayList) 
	          getAttribute(키)
	          
	       
	       응답
	       response : HttpServletResponse
	       -------- JSP 1개에서 1번만 response를 할 수 있음
	                              ----------
	                               html파일 전송, 쿠키 전송 따로 함 
	       
	       -setHeader() : 파일업로드, 다운로드 시 사용
	       -sendRedirect() : 서버에서 다른 파일로 이동 / forward()
 	       
	     	                         
	   
	   
	
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 전송값 받기 : request -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row {
   width: 500px;
   margin: 0px auto;
}
h1{
   text-align: center
}
</style>
</head>
<body>
   <div class="container">
     <h1>개인정보</h1>
	 <div class="row">
	  <form method=post action="output.jsp">
	  <%--  
	  	    method : GET/POST 방식 설정 => 데이터 양이 많으니 post
	        action 받는 파일 지정(jsp파일)
	        전송되는 데이터 : input, select, textarea => 입력 관련 내용만 전송
	  		
	  --%>
	   <table class="table">
	     <tr>
	       <th class="text-center" width="20%">이름</th>
	       <td width="80%">
	         <input type=text name="name" class="input-sm" size=15>
	         <!-- request.getParameter("name") : 입력된 값을 읽어옴 
	         	  ?name=홍길동&sez=남자
	         	  ---------------------
	         	  GET/POST => 값을 전송하거나 받는 경우 Map 방식 이용 : 키/값
	         -->
	       </td>
	     </tr>
	     <tr>
	       <th class="text-center" width="20%">성별</th>
	       <td width="80%">
	         <input type=radio name="sex" checked value="남자">남자
	         <input type=radio name="sex" value="여자">여자
	         <!-- input type radio를 쓸 땐 name이 동일해야 그룹으로 묶어 1개씩 선택가능,
	         	  반드시 보낼 데이터 value를 설정한다
	          -->
	       </td>
	     </tr>
	     
	     <tr>
	       <th class="text-center" width=20%>지역</th>
	         <td width=80%>
	           <select name="loc" class="input-sm">
	             <option>서울</option>
	             <option>강원</option>
	             <option>부산</option>
	             <option>제주</option>
	             <!-- 
	             	<option>서울</option> => '서울'은 사용자에게 보여주는 값
	             	<option value="seoul">서울</option> => value값(실제값)인 seoul이 넘어감
	              -->
	           </select>
	         </td>
	     </tr>
	     <tr>
	       <th class="text-center" width=20%>취미</th>
	         <td width=80%>
	           <input type="checkbox" value="" name=hobby>등산 <!-- name값 반드시 지정 -->
	           <input type="checkbox" value="" name=hobby>여행 <!-- name값 반드시 지정 -->
	           <input type="checkbox" value="" name=hobby>수영 <!-- name값 반드시 지정 -->
	           <input type="checkbox" value="" name=hobby>기타 <!-- name값 반드시 지정 -->
	           <%-- 전송값 : value, name은 동일해야 함 : String[] getParameterValues("hobby") --%>
	         </td>
	     </tr>
	     <tr>
	       <th width=20% class="text-center">소개</th>
	       <td width=80%>
	         <textarea rows=8 cols=35 name=content></textarea>
	       </td>
	     </tr>
	     <tr>
	       <td colspan=2 class="text-center">
	         <input type=submit value="전송" class="btn btn-sm btn-danger">
	       </td>
	     </tr>
	   </table>
      </form>
	 </div>
   </div>
</body>
</html>






















