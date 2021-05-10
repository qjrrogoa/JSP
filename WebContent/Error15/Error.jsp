<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error.jsp</title>
</head>
<body>
	<fieldset>
		<legend>web.xml에 설정을 통한 에러처리</legend>
		<%
		//방법1] try-catch사용	
		//selenium
		/*
		try{
			out.println("전송방식:"+request.getMethod()+"<br/>");
			out.println("파라미터의 문자열 길이:"+request.getParameter("name").length()+"<br/>");
		}
		catch(NullPointerException e){
			out.println("<h2>관리자에게 문의하세요</h2>");
		}
		*/
		//방법2] page지시어 속성 사용
		//방법3] web.xml의 설정으로 예외 처리
		/*
		설정을 통한 에러 처리]
			-개발완료후 범용적인 에러 처리시
				방법1:에러코드로
				방법2:예외 클래스 직접 지정
					예외 클래스 직접 지정이 우선한다.
					
			location : 컨텍스트 루트를 제외한 /로 시작하는 웹상의 경로
		*/
		Integer.parseInt("일억");
		out.println("전송방식:"+request.getMethod()+"<br/>");
		out.println("파라미터의 문자열 길이:"+request.getParameter("name").length()+"<br/>");
		%>
	</fieldset>
</body>
</html>