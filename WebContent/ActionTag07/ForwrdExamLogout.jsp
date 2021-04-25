<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//로그아웃 처리 후 로그인 페이지로 이동해라?
	session.invalidate();
%>
 	<jsp:forward page="/ActionTag07/ForwardExamLogin.jsp"/>
