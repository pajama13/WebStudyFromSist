<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<jsp:useBean id="model" class="com.sist.model.SeoulModel"/>
<%
	model.seoulListData(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
   margin-top:100px;
}
.row{
   width: 960px;
   margin: 0px auto;
}
</style>
</head>
<body>

<div class="container">
  <div class="row">
    <h1>서울 명소 20</h1>
    <hr>
     <%--
         for(SeoulVO vo:list)
      --%>
     <c:forEach var="vo" items="${list }">
       

         <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.poster }" style="width:260px;height: 200px" class="img-rounded">
			        <div class="caption">
			          <p style="font-size: 9px;font-weight: bold">${vo.title }</p>
			        </div>
			      </a>
			    </div>
			  </div>
     
     </c:forEach>
  </div>
</div>
 
 
 
</body>
</html>