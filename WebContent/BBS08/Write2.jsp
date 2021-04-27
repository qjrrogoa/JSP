<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Write.jsp</title>
<link href="<%=request.getContextPath()%>/Styles/divLayout.css"
	rel="stylesheet" />
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고 감싸는 div 시작 -->
			<div class="header">
				<div class="logo">
					<img src="<%=request.getContextPath()%>/Images/kosmo.jpg"
						alt="회사 로고 이미지" />
				</div>
				<div class="topMenu">
					<jsp:include page="/Template/Top.jsp" />
				</div>
			</div>
			<!-- 탑메뉴 및 로고 감싸는 div 끝 -->
			<!--Left메뉴 및 실제 내용 감싸는 div시작-->
			<div class="section">
				<div class="leftMenu">
					<jsp:include page="/Template/Left.jsp" />
				</div>
				<div class="body">
					<div class="content">
						<fieldset>
							<legend>글 작성 페이지</legend>
							<form action="WriteOk.jsp" method="post">
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td style="padding: 5px">
											<input type="text" name="title"	style="width: 98%" />
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
											<textarea rows="10" style="width: 98%" name="content"></textarea>
										</td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="등록" /></td>
									</tr>
								</table>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!--Left메뉴 및 실제 내용 감싸는 div끝-->
			<!--footer를 감싸는 div 시작-->
			<div class="footer">
				<jsp:include page="/Template/Footer.jsp" />
			</div>
			<!--footer를 감싸는 div 끝-->

		</div>
	</div>
</body>
</html>