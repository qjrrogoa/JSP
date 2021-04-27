<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- WriteOk.jsp -->
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("USER_ID").toString();
	BBSDto dto = new BBSDto(null,id,title,content,null,null);
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.insert(dto);
	if(affected == 1){
		response.sendRedirect("List.jsp");
	}
	else{ %>
	<script>
		alert("잘못 입력했습니다만.");
		history.back();
	</script>
	<% }
%>