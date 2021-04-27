<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] inters = request.getParameterValues("inter");
	String inter="";
	for(String value:inters) 
		inter+=value + " ";
	String grade = request.getParameter("grade");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectParamExamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>자바코드(스크립팅 요소)로 파라미터 받기</legend>
		<ul>
			<li>이름 : <%=name %></li>
			<li>성별 : <%=gender %></li>
			<li>관심사항 : <%=inter %></li>
			<li>학력 : <%=grade %></li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>EL 파라미터 받기</legend>
		<ul>
			<li>이름 : ${param.name}</li>
			<li>성별 : ${param['gender']}</li>
			<li>관심사항 : ${inter}</li>
			<li>학력 : ${param["grade"]}</li>
		</ul>
	</fieldset>
</body>
</html>