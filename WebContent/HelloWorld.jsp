<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date,java.text.SimpleDateFormat"
    info="JSP 및 SERVLET 테스트용 페이지"
    session="true" 
    
    %>

<%
	SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateString = dataFormat.format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloWorld.jsp</title>
</head>
<body>
	<h2>HELLO WORLD(박대민)</h2>
	<fieldset>
		<legend>JSP테스트</legend>
		<h3>오늘은 <%= dateString %>입니다.</h3>
	</fieldset>
	<fieldset>
		<legend>Servlet테스트</legend>
		<h3><a href="HelloServlet.do">HELLO SERVLET</a></h3>
		<span style = "color:red;font-size:1.2em;font-weight:bold">${message}</span>
		<h2>계산기</h2>
		<form action="Calculator.kosmo">
			<input type="text" name="firstNum" size="10" maxlength="10"/>
			<select name="operator">
				<option value="+">더하기</option>
				<option value="-">빼기</option>
				<option value="*">곱하기</option>
				<option value="/">나누기</option>
			</select>	
			<input type="text" name="secondNum" size="10" maxlength="10"/>
			<input type="submit" value="결과">
			<span style = "color:red;font-size:1.2em;font-weight:bold">${result}</span>
		</form>
	</fieldset>
</body>
</html>