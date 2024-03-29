<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
	//1. 사용자가 보낸 값 받기
	String no=request.getParameter("no");
	//2. DAO 통해 데이터 값 읽기
	DataboardDAO dao=new DataboardDAO();
	DataboardVO vo=dao.databoardUpdateData(Integer.parseInt(no));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
  width:800px;
}
</style>
</head>
<body>
  <div class="row row1">
    <h1 class="text-center">수정하기</h1>
    <%--
    	main => main.jsp로 이동 : 화면 출력하는 JSP등록
    	JSP
    	 1) 화면출력 => main.jsp 불러오기
    	 2) 값을 받아서 처리 => _ok 등 자체 jsp 불러오기
    	 
    --%>
    <%--
    	349p => 파일을 전송해서 업로드하기 위해서는 form에 enctype 부분까지 다 써줘야 함
    	<form method=post action="../databoard/insert_ok.jsp" enctype="multipart/form-data">
    	                                                              ----------------------
    	                                                              post 기반 파일업로드 프로토콜
     --%>
    <form method=post action="../databoard/update_ok.jsp">
    <table class="table">
      <tr>
        <th width=15% class="text-center success">이름</th>
        <td width=85%>
          <input type=text name=name size=15 class="input-sm" required value="<%=vo.getName()%>">
          <input type=hidden name=no value="<%=no %>">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">제목</th>
        <td width=85%>
          <input type=text name=subject size=45 class="input-sm" required value="<%=vo.getSubject()%>">
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">내용</th>
        <td width=85%>
          <textarea rows="10" cols="50" name=content required><%=vo.getContent() %></textarea>
        </td>
      </tr>
      <tr>
        <th width=15% class="text-center success">비밀번호</th>
        <td width=85%>
          <input type=password name=pwd size=10 class="input-sm" required>
        </td>
      </tr>
      <tr>
        <td colspan=2 class="text-center">
          <input type=submit value="수정" class="btn btn-sm btn-primary">
          <input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
        </td>
      </tr>
    </table> 
    </form>
  </div>
</body>
</html>