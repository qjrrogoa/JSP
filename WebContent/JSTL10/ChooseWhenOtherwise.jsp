<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChsooseWhenOtherwise.jsp</title>
</head>
<body>
	<fieldset>
		<legend>choose~when~otherwise태그</legend>
		<!-- EL에서 사용할 변수 설정 -->
		<c:set var="numvar" value="99"/>
		<c:set var="strvar" value="자바"/>
		<h2>if태그로 짝/홀수 판단</h2>
		<c:if test="${numvar % 2 ==0 }" var="result">
			${numvar }는 짝수
		</c:if>
		<c:if test="${! result }">
			<!-- HTML주석입니다 -->
			${numvar }는 홀수
		</c:if>
		<h2>choose~when~otherwise태그로 짝/홀수 판단</h2>
		<!--choose태그안에 주석시 에러 .반드시 when~otherwise절만..-->
		<c:choose>			
			<c:when test="${numvar % 2 ==0 }">
				<!-- HTML주석입니다 -->
				${numvar }는 짝수
			</c:when>
			<c:otherwise>
				<!-- HTML주석입니다 -->
				${numvar }는 홀수
			</c:otherwise>		
		</c:choose>
		<h2>choose~when~otherwise태그로 문자열 비교</h2>
		<c:choose>
			<c:when test="${strvar=='JAVA' }">
				${strvar }는 JAVA
			</c:when>
			<c:when test="${strvar=='java' }">
				${strvar }는 java
			</c:when>
			<c:otherwise>
				${strvar }는 자바
			</c:otherwise>
		
		</c:choose>
		<fieldset>
			<legend>점수 확인</legend>
			<form>
			국어 <input type="text" name="kor"/>
			영어 <input type="text" name="eng"/>
			수학 <input type="text" name="math"/>
			<input type="submit" value="확인"/>
		</form>
		<!-- 국영수 점수를  받아서 평균이
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL만을 사용하여라
		   -->
			<!-- 파라 미터 체크 -->
			<c:set var="kor" value="${param.kor }"/>
			<c:set var="eng" value="${param.eng }"/>
			<c:set var="math" value="${param.math }"/>
			<c:set var="avg" value="${(kor+eng+math)/3 }"/>
			
			<c:if test="${empty kor && empty eng && empty math }" var="result">
			
			</c:if>
			<c:if test="${!result }">
				<c:choose>
					<c:when test="${avg >= 90 }">
						A학점
					</c:when>
					<c:when test="${avg >= 80 }">
						B학점
					</c:when>
					<c:when test="${avg >= 70 }">
						C학점
					</c:when>
					<c:when test="${avg >= 60 }">
						D학점
					</c:when>
					<c:otherwise>
						F학점
					</c:otherwise>
				</c:choose>
			</c:if>
		
		
		</fieldset>
		
		<fieldset>
			<legend>로그인</legend>
			<form>
				아이디 <input type="text" name="user"/>
				비밀번호 <input type="password" name="pass"/>
				<input type="submit" value="로그인"/>
			</form>
			 <!--
	           회원인 경우 "?님 반갑습니다"
	           아닌 경우 "로그인후 이용하세요"출력.
	           단,자신만의 태그라이브러리를 만들어
	           EL식으로 호출하여라 그리고 
	           실제 멤버 테이블을 연동(BBS게시판에서 사용했던 회원테이블 연동)하여라.
	        --> 
			<c:if test="${not empty param.user }">
				<c:choose>
					<c:when test="${my:isMember(pageContext.servletContext,param.user,param.pass ) }">
						<span style="color:green;font-size:1.4em">${param.user }님</span> 즐감하세요
					</c:when>
					<c:otherwise>
						로그인후 이용하세요					
					</c:otherwise>				
				</c:choose>			
			</c:if>
			
			
			
		</fieldset>
		
		
		
	</fieldset>
</body>
</html>