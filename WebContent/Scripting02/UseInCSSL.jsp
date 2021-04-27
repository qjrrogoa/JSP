<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글처리-post방식일때
	request.setCharacterEncoding("UTF-8");
	//사용자 선택값 받기]
	String color = request.getParameter("color");
	String font = request.getParameter("font");
	out.print(String.format("색상:%s,글꼴:%s",color, font));
	if(color == null || color.length()==0) color="black";
	if(font==null || font.equals("")) font="Verdana";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseInCSSL.jsp</title>
<style>
	span{
		color:<%=color%>;
		font-family: <%=font%>;
	}
</style>
</head>
<body>
	<fieldset>
		<legend>HTML안에서 스크립팅 요소 사용</legend>
		<%
			for(int i=1;i <=6;i++){
		%>
		<h<%=i %>>제목<%=i %></h<%=i %>>
		<% } %>
		<form>
			<input type="text" name="counter"/>
			<input type="submit" value="이미지 카운터"/>
		</form>
		<%
			String counter=request.getParameter("counter");
			if(counter !=null){
				char[] ch= counter.toCharArray();
				for(char num:ch){
		%>
			<img src="../Images/num_<%=num %>.gif" alt="<%=num %>번 이미지"/>
		<% 
				}//for
			}//if%>
	</fieldset>
	<fieldset>
		<legend>CSS안에서 스크립팅 요소 사용</legend>
		<span>CSS를 적용한 텍스트</span>
		<form method="post">
			[글자색] <select name="color">
				<option value="">색상 선태요망</option>
				<option value="Red">빨강</option>
				<option value="Green">그린</option>
				<option value="Blue">블루</option>
			</select> 
			[글꼴] <select name="font">
				<option value="">글꼴 선태요망</option>
				<option value="굴림체">굴림체</option>
				<option value="바탕체">바탕체</option>
				<option value="휴먼옛체">휴먼옛체</option>
			</select> 
			<input type="submit" value="글꼴 및 색상 변경" />
		</form>
	</fieldset>
	<%
	// 사용자 입력값 받기]
	String user = request.getParameter("id");
	String pass = request.getParameter("pwd");					
	
	%>
	<script>
		//방법1]
		<%--
			if(user !=null){
				if("KIM".equals(user) && "1234".equals(pass)){
		--%>
					//alert("<%--=user--%>님 즐감하세요");		
		<%--			
				}//안쪽 if
			
				else{
		--%>
					//alert("회원가입후 이용하세요");	
		<%--		
				}//else
			}//바깥 if
		--%>
		//방법2]
		<%
		if(user !=null){
			if("KIM".equals(user) && "1234".equals(pass))
				out.println("alert('"+user+"님 즐감...');");			
			else
				out.println("alert('회원전용입니다');");
			
		}
			
		%>
	
	</script>
	<fieldset>
		<legend>자스안에서 스크립팅 요소 사용</legend>
		<form>
			아이디 <input type="text" name="id" /> 
			비밀번호 <input type="password" name="pwd" /> 
				<input type="submit" value="로그인" />
		</form>
	</fieldset>
	
</body>
</html>