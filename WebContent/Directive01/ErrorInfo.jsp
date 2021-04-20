<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>에러발생</legend>
		<h2>관리자에게 문의 하세요 : 010-1234-5678</h2>
		<h2>에러 내용</h2>
		<%= exception.getMessage() %>
	</fieldset>
</body>
</html>