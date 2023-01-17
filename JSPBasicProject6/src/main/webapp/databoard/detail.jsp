<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
	//1. 사용자가 보내준 데이터 받기(게시물 번호) => &no=N
	String no=request.getParameter("no");
	//list.jsp => detail.jsp 한테 no값 넘김
	//2. 데이터베이스 연결
	DataboardDAO dao=new DataboardDAO();
	DataboardVO vo=dao.databoardDetailData(Integer.parseInt(no));
	
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
    <h1 class="text-center">내용보기</h1>
    <table class="table">
      <tr>
        <th width=20% class="text-center success">번호</th>
        <td width=30% class="text-center"><%=vo.getNo() %></td>
        <th width=20% class="text-center success">작성일</th>
        <td width=30% class="text-center"><%=vo.getDbday() %></td>
      </tr>
      <tr>
        <th width=20% class="text-center success">작성자</th>
        <td width=30% class="text-center"><%=vo.getName() %></td>
        <th width=20% class="text-center success">조회수</th>
        <td width=30% class="text-center"><%=vo.getHit() %></td>
      </tr>
      <tr>
        <th width=20% class="text-center success">제목</th>
        <td colspan=3><%=vo.getSubject() %></td>
      </tr>
      
      <%
      	if(vo.getFilesize()>0) //파일 존재하면
      	{
      %>
      <tr>
        <th width=20% class="text-center success">첨부파일</th>
        <td colspan=3 >
          <a href="../databoard/download.jsp?fn=<%=vo.getFilename()%>"><%=vo.getFilename() %></a>(<%=vo.getFilesize() %>bytes)
        </td>
      </tr>
      <%
      	}
      %>
      <tr>
        <td colspan=4 class="text-left" valign="top" height=200>
		  <pre style="white-space:pre-wrap;border:none;background-color: white;"><%=vo.getContent() %></pre>
        </td>
      </tr>
      
      <tr>
        <td colspan=4 class="text-right">
          <a href="../main/main.jsp?mode=10&no=<%=vo.getNo() %>" class="btn btn-sm btn-success">수정</a>
          <a href="../main/main.jsp?mode=9&no=<%=vo.getNo() %>" class="btn btn-sm btn-info">삭제</a>
          <a href="../main/main.jsp?mode=5" class="btn btn-sm btn-warning">목록</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>