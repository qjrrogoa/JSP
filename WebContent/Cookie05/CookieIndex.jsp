<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>쿠키</legend>
		<h2>쿠키 설정하기</h2>
		<%
			//1]쿠키 객체 생성 : new Cookie("쿠키명","쿠키값");
			//쿠키명 설정하는 setName()이 없다. 반드시 생성자로 쿠키명 설정
			Cookie cookie = new Cookie("UserID","KOSMO");
			//2]쿠키가 적용되는 PATH 설정
			//보통 프로젝트 전체에 설정한다.
			cookie.setPath(request.getContextPath());// /JSPProj 넣어도된다.
			//3]쿠키 유효시간 설정 - 초 단위
			/*
				유효기간 미 설정시 쿠키는 웹브라우저에 저장됨
				- 웹 브라우저 닫을 때
				유효기간 설정시는 사용자의 PC(HDD의 텍스트 파일형태)에 저장됨.
				- 유효기간이
				지나면 자동으로 삭제됨.
			*/
			cookie.setMaxAge(60);
			//4]생성된 쿠키를 응답헤더에 설정 : addCookie()
			response.addCookie(cookie);
		%>
		<h2>쿠키를 생성하는 현재 페이지에서 쿠키값 읽기</h2>
		
		<h2> 페이지 이동 후 쿠키값 확인</h2>
		<a href="CookieResult.jsp">쿠키값 확인</a>
	</fieldset>
</body>
</html>