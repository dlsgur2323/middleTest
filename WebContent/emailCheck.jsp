<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");
	
	if(result.equals("fail")){
	%>
		{ "sw" : "실패" }
	<%	
	} else if(result.equals("success")){
	%>
		{ "sw" : "성공" }
	<%	
	} else if(result.equals("null")){
	%>
		{ "sw" : "없음" }
	<%	
	}
%>