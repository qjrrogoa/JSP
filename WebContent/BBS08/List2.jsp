<%@page import="model.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/IsMember.jsp" %>
<%

	BBSDao dao = new BBSDao(application,"JSP","JSP");
	List<BBSDto> list = dao.selectList();
	dao.close();

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
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
							<legend>회원제 게시판 목록(3/10)</legend>
							<!-- 글쓰기 버튼 -->
							<table style="width: 100%">
								<tr>
									<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
								</tr>
							</table>
							<table width="100%"	style="border-spacing: 1px; background-color: gray">
								<tr style="background-color: white" align="center">
									<th width="10%">번호</th>
									<th width="45%">제목</th>
									<th width="15%">작성자</th>
									<th width="10%">조회수</th>
									<th>작성일</th>
								</tr>	
								
								<%if(list.isEmpty()) {%>
								<tr style="background-color: white" align="center">
									<td colspan="5">등록된 글이 없어요</td>
								</tr>
								<%}
								else {
									for(BBSDto dto:list){%>
								<!-- 아래 반복 -->
								<tr style="background-color: white" align="center">
									<td><%=dto.getNo() %></td>
									<td style="text-align: left"><%=dto.getTitle() %></td>
									<td><%=dto.getName() %></td>
									<td><%=dto.getVisitCount() %></td>
									<td><%=dto.getPostDate() %></td>
								</tr>
								<%
									}
								}
								%>
								
								
								
							</table>
							<!-- 페이징 -->
							<table width="100%">
								<tr align="center">
									<td>1 2 3 4 5 6 7 8 9 10</td>
								</tr>
							</table>
							<!-- 검색UI -->
							<form method="post">
								<table width="100%">
									<tr align="center">
										<td>
											<select name="searchColumn">
													<option value="title">제목</option>
													<option value="name">작성자</option>
													<option value="content">내용</option>
											</select> 
											<input type="text" name="searchWord" /> 
											<input type="submit" value="검색" />
										</td>
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