<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp"%>
<%
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord   = request.getParameter("searchWord");	

	//2]CRUD작업용 BbsDAO생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가 하기 위함
	String referer=request.getHeader("referer");
	int beginIndex=referer.lastIndexOf("/")+1;
	String prevPage = referer.substring(beginIndex);
	//조회수 업데이트 및 상세보기
	BBSDto dto= dao.selectOne(no,prevPage);
	
	dao.close();


%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Edit.jsp</title>
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
							<legend>글 수정 페이지</legend>
							<form action="EditOk.jsp" method="post">
								<input type="hidden" name="no" value="<%=dto.getNo() %>"/>
								<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
								
								<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>
								<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
								<table width="75%" bgcolor="gray" cellspacing="1">
									<tr bgcolor="white">
										<td width="30%" align="center">제목</td>
										<td style="padding: 5px">
											<input type="text" value="<%=dto.getTitle() %>" name="title"	style="width: 98%" />
										</td>
									</tr>
									<tr bgcolor="white">
										<td align="center">내용</td>
										<td style="padding: 5px">
											<textarea rows="10" style="width: 98%" name="content"><%=dto.getContent() %></textarea>
										</td>

									</tr>
									<tr bgcolor="white" align="center">
										<td colspan="2"><input type="submit" value="수정" /></td>
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