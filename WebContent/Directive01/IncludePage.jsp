<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IncludePage.jsp -->
<!-- 여러 JSP페이지에서 공통으로 사용할 변수나 상수, 메소드 정 -->
<%!
	SimpleDateFormat dateFormat = new SimpleDateFormat();
	//공통 메서드]
	String getDate(String pattern){
		dateFormat.applyPattern(pattern);
		return dateFormat.format(new Date());
	}
%>
<%
	//공통 변수	
	String tempPage = request.getRequestURL().toString();
	int beginIndex = tempPage.lastIndexOf("/")+1;
	String currentPage = tempPage.substring(beginIndex);
%>