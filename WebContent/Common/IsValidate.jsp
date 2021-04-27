<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- IsValidate.jsp -->
<%!
	private boolean isValidate(JspWriter out,String param,String message){
		if(param == null || param.trim().length()==0){
			try{
				out.println("<script>");
				out.println("alert('"+message+"');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(Exception e){e.printStackTrace();}
			return false;
		}
		return true;
	}

	private boolean isValidate(JspWriter out,String[] param){
		if(param == null){
			try{
				out.println("<script>");
				out.println("alert('관심사항을 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(Exception e){e.printStackTrace();}
			return false;
		}
		else{
			if(param.length < 3){
				try{
					out.println("<script>");
					out.println("alert('관심사항은 3개 이상을 선택하세요');");
					out.println("history.back();");
					out.println("</script>");
				}
				catch(Exception e){e.printStackTrace();}
				return false;
			}
		}
		return true;
	}
%>