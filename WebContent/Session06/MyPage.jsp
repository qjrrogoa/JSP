<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MyPage.jsp</title>
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
						<fieldset style="padding: 10px">
						
							<legend>마이 페이지</legend>
							<table style="width: 300px; border-spacing: 1px; background-color: green">
									<tr style="background-color: white">
										<td style="width: 25%">아이디</td>
										<td style="padding-left: 5px"><%=session.getAttribute("USER_ID")%></td>
									</tr>

									<tr style="background-color: white">
										<td colspan="2"><a href="Logout.jsp">로그아웃</a></td>
									</tr>

								</table>
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