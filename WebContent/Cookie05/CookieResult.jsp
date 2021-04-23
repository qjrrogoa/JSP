<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키값 확인</legend>
	
		<%
		Cookie[] cookies = request.getCookies();
		//out.println("cookies"+cookies); //최초 요청에는 null이다,,
		if(cookies != null){
			for(Cookie cook:cookies){
				//쿠키명 얻기
				String name = cook.getName();
				//쿠키값 얻기
				String value = cook.getValue();
				out.println(String.format("%s : %s\r\n",name,value));
			}
			
		}
		%>
		
		
		

	</fieldset>
</body>
</html>