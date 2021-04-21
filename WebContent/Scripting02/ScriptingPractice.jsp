<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%!
	//[멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private JspWriter out;
	
	//[메서드]
	private void connect(){
		try{
			//드라이버 로딩]
			Class.forName("oracle.jdbc.OracleDriver");
			//데이터 베이스 연결]
			conn = DriverManager.getConnection("JDBC:oracle:thin:@localhost:1521:xe","scott","scott");
		}
		catch(ClassNotFoundException e){
			try{
			out.println("<h2>드라이버 로딩 실패</h2>");
			}
			catch(IOException e1){
				e1.printStackTrace();
			}
		}
		catch(SQLException e){
			try{
				out.println("<h2>데이터베이스 연결 실패</h2>");
				}
				catch(IOException e1){
					e1.printStackTrace();
				}
		}
	}////////connect
	private void close(){
	
		try{
			if(rs != null)
				rs.close();
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}////
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptiongPractice</title>
</head>
<body>
	<fieldset>
		<legend>스크립팅 요소 연습하기</legend>
		<h2>표현식으로 출력</h2>
		<table style="border-spacing:2px;background-color: green">
			<tr style="background-color: white">
				<td>사번</td>
				<td>이름</td>
				<td>직책</td>
				<td>입사일</td>
				<td>연봉</td>						
				<td>보너스</td>							
				<td>부서코드</td>						
			</tr>
			<!-- 아래 tr을 반복 -->
			<%
				this.out = out;
				//데이터 베이스 연결]
				connect();
				//쿼리문 준비]
				String sql = "SELECT * FROM emp ORDER BY empno DESC";
				//쿼리 실행용 객체 얻기
				psmt = conn.prepareStatement(sql,
						ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_READ_ONLY);
				//쿼리 실행
				rs = psmt.executeQuery();
				while(rs.next()){
			%>
			<tr style="background-color: white">
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getDate(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7)==null ? "" : rs.getString(7) %></td>				
				<td><%=rs.getString(8) %></td>				
			</tr>
			<% }//while %>
		</table>
		<h2>표현식으로 출력</h2>
		
		<h2> out 내장 객체로 출력</h2>
		<table style="border-spacing:2px;background-color: green">
			<tr style="background-color: white">
				<td>사번</td>
				<td>이름</td>
				<td>직책</td>
				<td>입사일</td>
				<td>연봉</td>						
				<td>보너스</td>							
				<td>부서코드</td>						
			</tr>
			<%
				while(rs.previous()){
					out.print("<tr style=\"background-color: white\">");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td>"+rs.getString(2)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getDate(5)+"</td>");
					out.println("<td>"+(rs.getString(7)==null ? "" : rs.getString(7))+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("</tr>");
				}
			%>
			
		</table>
		
		
		<%
			//자원 반납
			close();
		%>
	</fieldset>
</body>
</html>