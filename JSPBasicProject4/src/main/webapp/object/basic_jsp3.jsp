<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	response : 서버 응답에 대한 정보, 헤더 정보를 갖고 있음, 변환 정보
	=> getContentType() : 실행 시 어떤 형식의 데이터인지 확인
	   text/html(html), text/xml(xml), text/plain(json) => JSON / JSONP (프론트)
	=> getCharacterEncoding() : 한글 변환코드 뭘 썼는지 확인 (utf-8 등)
	=> setHeader() : 업로드/다운로드
	=> *** sendRedirect() => GET방식, 화면을 서버에서 변경
	
	JSP 1개 파일에서 1개만 응답 가능함
	=> 브라우저로 전송하는 것이 2개 뿐임 : 쿠키 또는 html(동시에는 불가)
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>response 메소드 : HttpServletResponse</h1>
  전송방식 : <%=response.getContentType() %>  <%--html형식으로 브라우저로 보냄 --%>
  한글 변환 코드 : <%=response.getCharacterEncoding()  %> 
  <%--
  	한글변환
  	EUC-KR
  	  전송 : EUC-KR (Window용, 리눅스에서 인식하지 않음) => AWS(리눅스)
  	        EUC-KR - UTF-8
  	UTF-8
  	  전송 : UTF-8 - EUC-KR(한글꺠짐)
  	      
   --%>
</body>
</html>