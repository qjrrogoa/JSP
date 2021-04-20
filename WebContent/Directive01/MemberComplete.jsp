<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="IncludePage.jsp" %>
<%!
	private boolean isValidate(JspWriter out,String param,String message){
		if(param == null || param.trim().length()==0){
			try{
				out.println("<script>");
				out.println("alert('"+message+"')");
				out.println("history.back()");
				out.println("</script>");
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}
	
	private boolean isValidate(JspWriter out,String[] param){
		if(param==null){
			try{
				out.println("<script>");
				out.println("alert('관심사항을 선택하세요')");
				out.println("history.back()");
				out.println("</script>");
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return false;
		}
		else{
			if(param.length < 3){
				try{
					out.println("<script>");
					out.println("alert('관심사항은 3개 이상...')");
					out.println("history.back()");
					out.println("</script>");
				}
				catch(Exception e){
					e.printStackTrace();
				}
				return false;
			}
		}
		return true;
	}
	

%>
<%
	//POST방식일때 아래 코드 추가(한글처리용)]
	request.setCharacterEncoding("UTF-8"); 
	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("self.close()");
		out.println("</script>");
		return;//void_jspService() 메서드 빠져 나가기.
	}
	//파라미터 받기]
	String id = request.getParameter("id");
	if(!isValidate(out, id, "아이디를 입력하세요")) return; //아이디 미 입력시 : 서버단에서도 유효성 체크
	String pwd = request.getParameter("pwd");
	if(!isValidate(out, pwd, "비밀번호를 입력하세요")) return;
	String gender = request.getParameter("gender");
	if(!isValidate(out, gender, "성별을 입력하세요")) return;
	String[] inter = request.getParameterValues("inter");
	if(!isValidate(out, inter)) return;
	String grade = request.getParameter("grade");
	if(!isValidate(out, grade, "학력을 입력하세요")) return;
	String file = request.getParameter("file");
	if(!isValidate(out, file, "파일을 첨부하세요")) return;
	String self = request.getParameter("self");
	if(!isValidate(out, self, "자기소개를 입력하세요")) return;

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MemberComplete.jsp</title>
    <link href="../Styles/divLayout.css" rel="stylesheet"/>
</head>
<body>
	<div class="allWrap">
		<div class="partWrap">
			<!-- 탑메뉴 및 로고 div 시작-->
			<div class="header">
				<div class="logo">
					<img src="../Images/kosmo.jpg" alt="회사 로고 이미지">
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
						<h2>회원가입 완료페이지(<%=currentPage%>)</h2>
						<form name="frmObj" action="https://www.nate.com" method="get"
							onsubmit="console.log('submit 이벤트 발생');return false;">


							<table
								style="width: 75%; border-spacing: 1px; background-color: green">
								<tr style="background-color: white">
									<td>아이디</td>
									<td ><input type="text" size="20" value="<%=id %>"/> 
									<span style="color: red; font-size: 0.8em" id="idError"></span></td>
								</tr>
								<tr style="background-color: white">
									<td>비밀번호</td>
									<td><input type="text" size="20" value="<%=pwd %>"/></td>
								</tr>
								<tr style="background-color: white">
									<td>성별</td>
									<td><input type="radio" value="man" <% if("MAN".equalsIgnoreCase(gender.toUpperCase())) { %> checked <% } %> />남 <input
										type="radio" value="woman" <% if("WOMAN".equalsIgnoreCase(gender.toUpperCase())) { %> checked <% } %>/>녀 <input
										type="radio" value="trans" <% if("TRANS".equalsIgnoreCase(gender.toUpperCase())) { %> checked <% } %>/>트랜스젠더</td>
								</tr>
								<tr style="background-color: white">
									<td>관심사항</td>
									<td><input type="checkbox" value="pol" <%if(Arrays.toString(inter).indexOf("pol") != -1){ %> checked <% } %> />정치
										<input type="checkbox" value="eco" <%if(Arrays.toString(inter).indexOf("pol") != -1){ %> checked <% } %>/>경제 
										<input type="checkbox" value="spo" <%if(Arrays.toString(inter).indexOf("pol") != -1){ %> checked <% } %> />스포츠 
										<input type="checkbox" value="ent" <%if(Arrays.toString(inter).indexOf("pol") != -1){ %> checked <% } %>/>연예
									</td>
								</tr>
								<tr style="background-color: white">
									<td>학력사항</td>
									<td><select name="grade">
											<option value="ele" <%if(grade.equals("ele")){%> selected <% } %>>초등학교</option>
											<option value="mid" <%if(grade.equals("ele")){%> selected <% } %>>중학교</option>
											<option value="hig" <%if(grade.equals("ele")){%> selected <% } %>>고등학교</option>
											<option value="uni" <%if(grade.equals("ele")){%> selected <% } %>>대학교</option>
									</select></td>
								</tr>
								<tr style="background-color: white">
									<td>첨부파일</td>
									<td><input type="file" name="file" size="40" /><%=file %></td>
								</tr>
								<tr style="background-color: white">
									<td>자기소개</td>
									<td><textarea cols="60" rows="5" name="self"><%=self %></textarea></td>
								</tr>
								<tr style="background-color: white">
									<td colspan="2" text-align="center">
										<table>
											<!-- 방법1:submit기능이 있는 폼 하위태그-->
											<tr>
												<td><input type="submit" style="height: 50px"
													value="submit버튼" title="type=submit" /></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</form>
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