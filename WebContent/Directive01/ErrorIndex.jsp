<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="ErrorInfo.jsp"
    
    %>
<%
  //사용자가 입력한 값 받기]
	String stringAge=request.getParameter("age");
	out.print("stringAge: "+stringAge);
	
	String errorMessage="";
	int after10Years = -1;
	if(stringAge != null){
		//방법1] try ~ catch로 직접 에러처리
		/*
		try{
			after10Years = Integer.parseInt(stringAge)+10;
		}
		catch(NumberFormatException e){
			errorMessage="나이는 숫자만...";
		}*/
		
		//방법2] page지시어의 errorP
		after10Years = Integer.parseInt(stringAge)+10;
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>에러가 발생할 페이지</legend>
		<form>
			나이를 입력하세요
			<input type ="text" name="age"/>
			<input type ="submit" value ="확인"/>
		</form>
		<% if(after10Years != -1 ){ %>
			당신의 10년 후 나이는 <%=after10Years %>살 이군요
		<% } %>
		<%= errorMessage %>
	</fieldset>
</body>
</html>