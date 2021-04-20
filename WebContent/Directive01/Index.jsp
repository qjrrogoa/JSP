<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="IncludePage.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Index.jsp</title>
    <link href="../Styles/divLayout.css" rel="stylesheet"/>
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 div 시작-->
            <div class="header">
                <div class="logo"><img src="../Images/kosmo.jpg" alt="회사 로고 이미지"></div>
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
                        <h2>메인 페이지(<%=currentPage %>)</h2>
                     </div>
                </div>
            </div>
            <!-- left 메뉴 및 중단 div 끝-->
            <!-- footer div 시작-->
            <div class="footer">
                <%@include file="/Template/Footer.jsp" %>
            </div>
            <!-- footer div 끝-->
        </div>
    </div>
    
</body>
</html>