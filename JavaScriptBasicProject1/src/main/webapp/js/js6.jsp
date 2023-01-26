<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	제어문
	  조건문
	    단일조건문
	    if(조건문)
	    {
	    	조건 true일 때 처리
	    }
	    
	    선택조건문
	    if(조건문)
	    {
	    	조건이 true일 때 처리
	    }
	    else
	    {
	    	조건이 false일 때 처리
	    }
	    
	    다중조건문
	    if(조건문)
	    {
	    }
	    else if
	    {
	    }
	    else
	    {
	    }
	    
	  선택문 : switch~case
	  반복문 : while, do~while, ***for(종류 많음)
	  반복제어문 : break, continue
	  
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
/* 	let a=10;
	if(a===10)
	{
		alert("a는 10입니다.")
	}
	
	//선택조건문
	let b=11;
	if(b%2===0)
	{
		alert("b는 짝수입니다.")
	}
	else
	{
		alert("b는 홀수입니다.")
	} */
	
	//다중조건문 
	let c=10;
	if(c%2===0)
	{
		alert("c는 짝수입니다.")
	}
	else if(c%2!==0)
	{
		alert("c는 홀수입니다.")
	}
	else
	{
		alert("c는 숫자가 아닙니다.")
	}
}
</script>
</head>
<body>

</body>
</html>