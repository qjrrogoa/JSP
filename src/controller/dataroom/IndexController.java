package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//메인 페이지 이동제어용 서블릿]
public class IndexController extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 저장]
		req.setAttribute("MAIN","누구나 자료를 올릴 수 있습니다");
		//메인 페이지(Main.jsp)로 페이지 이동]
		req.getRequestDispatcher("/DataRoom14/Main.jsp").forward(req, resp);
	}
	
}
