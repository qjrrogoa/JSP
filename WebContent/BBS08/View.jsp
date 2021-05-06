<%@page import="java.util.Map"%>
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
	String queryString="";//검색용 쿼리 스트링
	
	if(searchColumn !=null){				
		queryString=String.format("searchColumn=%s&searchWord=%s&", searchColumn,searchWord);
	}//////////////
			

	//2]CRUD작업용 BbsDAO생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가 하기 위함
	String referer=request.getHeader("referer");
	int beginIndex=referer.lastIndexOf("/")+1;
	String prevPage = referer.substring(beginIndex);
	//조회수 업데이트 및 상세보기
	BBSDto dto= dao.selectOne(no,prevPage);
	//이전글/다음글 조회
	Map<String,BBSDto> map= dao.prevNext(no);
	dao.close();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
<link href="<%=request.getContextPath()%>/Styles/divLayout.css"
	rel="stylesheet" />
	<script>
		var isDelete = function(){
			if(confirm("정말로 삭제하시겠습니까?"))
				location.replace("Delete.jsp?<%=queryString%>no=<%=dto.getNo() %>&nowPage=<%=nowPage%>");
			
		};
	
	</script>
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
							<legend>글 상세보기 페이지</legend>

							<table width="75%" bgcolor="gray" cellspacing="1">
								<tr bgcolor="white">
									<td width="30%" align="center">작성자</td>
									<td style="padding: 5px"><%=dto.getName() %></td>
								</tr>
								<tr bgcolor="white">
									<td width="30%" align="center">작성일</td>
									<td style="padding: 5px"><%=dto.getPostDate() %></td>
								</tr>
								<tr bgcolor="white">
									<td width="30%" align="center">조회수</td>
									<td style="padding: 5px"><%=dto.getVisitCount() %></td>
								</tr>

								<tr bgcolor="white">
									<td width="30%" align="center">제목</td>
									<td style="padding: 5px"><%=dto.getTitle() %></td>
								</tr>
								<tr bgcolor="white">
									<td width="30%" align="center">내용</td>
									<td style="padding: 5px"><%=dto.getContent().replace("\r\n","<br/>") %></td>

								</tr>
								<tr bgcolor="white" align="center">
									<td colspan="2">
									<% if(dto.getId().equals(session.getAttribute("USER_ID"))){ %>
									<a href="Edit.jsp?<%=queryString %>no=<%=dto.getNo() %>&nowPage=<%=nowPage%>">수정</a> | <a href="javascript:isDelete()">삭제</a> | 
									<% }//if %>
									<a href="List.jsp?<%=queryString %>nowPage=<%=nowPage %>">목록</a>
									</td>
								</tr>
							</table>

							<!-- 이전글/다음글 -->
							<table style="width: 75%">
								<tr>
									<td style="width: 15%">이전글</td>
									<td><%=map.get("PREV")==null ? "이전글이 없습니다":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle()) %></td>
								</tr>
								<tr>
									<td style="width: 15%">다음글</td>
									<td><%=map.get("NEXT")==null ? "다음글이 없습니다":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle()) %></td>
								</tr>
							</table>

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