package controller.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MultiController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String crud=req.getParameter("crud");
		String crudMessage;
		if("create".equals(crud)) crudMessage="입력처리 요청입니다";
		else if("read".equals(crud)) crudMessage="조회처리 요청입니다";
		else if("update".equals(crud)) crudMessage="수정처리 요청입니다";
		else crudMessage="삭제처리 요청입니다";
		req.setAttribute("crudMessage", crudMessage);
		req.getRequestDispatcher("/Servlet13/Servlet.jsp").forward(req, resp);
	}
}
