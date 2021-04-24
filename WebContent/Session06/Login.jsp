<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
<link href="<%=request.getContextPath()%>/Styles/DivLayout.css"
	rel="stylesheet" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고 div 시작-->
			<div class="header">
				<div class="logo">
					<img src="<%=request.getContextPath()%>/Images/kosmo.jpg"
						alt="회사 로고 이미지">
				</div>
				<div class="topMenu">
					<%@include file="/Template/Top.jsp"%>
				</div>
			</div>
			<!-- 탑메뉴 및 로고 div 끝-->
			<!-- left 메뉴 및 중단 div 시작-->
			<div class="section">
				<div class="leftMenu">
					<%@include file="/Template/Left.jsp"%>
				</div>
				<div class="body">
					<div class="content">
						<h2>로그인 페이지</h2>
						<fieldset style="padding: 10px">
						
							<legend>로그인 페이지</legend>
							<span style="color: red; font-weight: bold"><%=request.getAttribute("NOT_LOGIN")==null?"": request.getAttribute("NOT_LOGIN")%></span>
							<form method="post" action="LoginProcess.jsp">
								<table style="width: 300px; border-spacing: 1px; background-color: green">
									<tr style="background-color: white">
										<td style="width: 25%">아이디</td>
										<td style="padding-left: 5px"><input type="text" name="user" value="<%=request.getParameter("user")==null?"":request.getParameter("user")%>"/></td>
									</tr>

									<tr style="background-color: white">
										<td>비밀번호</td>
										<td style="padding-left: 5px"><input type="password" name="pass" value="<%=request.getParameter("pass")==null?"":request.getParameter("pass")%>"></td>
									</tr>

									<tr style="background-color: white; text-align: center">
										<td colspan="2"><input type="submit" value="로그인" /></td>
									</tr>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!-- left 메뉴 및 중단 div 끝-->
			<!-- footer div 시작-->
			<div class="footer">
				<%@include file="/Template/Footer.jsp"%>
			</div>
			<!-- footer div 끝-->
		</div>
	</div>

</body>
</html>