<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
File f = new File("C:/LJH/Workspace/Java/JavaBasicApp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/JSPProj/Upload");
File[] files=f.listFiles();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>
</head>
<body>
	<fieldset>
		<legend>업로드된 파일 목록</legend>
		<ul>
			<%
			for(File file:files) {
			%>
			<li>파일명 :<a href="Download.jsp?filename=<%=file.getName() %>"><%=file.getName() %></a> , 파일크기 :<%=(int)Math.ceil(file.length()/1024.0) %> KB </li>
			<% } %>
		</ul>
	</fieldset>
</body>
</html>