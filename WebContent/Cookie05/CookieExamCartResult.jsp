<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!

	private String getProductName(String code){
		return code.replace("product", "상품");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieExamCartResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>장바구니 예제:장바구니에 담은 상품들</legend>
		<ul>
			<%
			//쿠키값 읽어오기]	
			Cookie[] cookies = request.getCookies();			
			if(cookies !=null){
				for(Cookie cookie : cookies){
					//쿠키명 얻기]
					String name = cookie.getName();
					//쿠키값 얻기]
					String value = cookie.getValue();
					
					if(name.indexOf("product")!=-1){
						out.println(String.format("<li>%s</li>",getProductName(name)));
					}
				}		
			}////////////if			
			%>	
		</ul>
		<a href="CookieExamIndex.jsp">계속 쇼핑하기</a>
	
	</fieldset>
</body>
</html>