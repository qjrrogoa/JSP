<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Delete.jsp -->
<%
	//1]파라미터 받기
	String no = request.getParameter("no");
	//2]CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.delete(no);
	
	dao.close();
	if(affected==1)
		response.sendRedirect("List.jsp");
	else{
		out.println("<script>");
		out.println("alert('삭제 실패했어요');");
		out.println("history.back();");
		out.println("</script>");
	}


%>