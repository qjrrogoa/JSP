package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;

//1]HttpServlet 상속 받는다
public class ViewController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//3]요청분석
		String no = req.getParameter("no");
		//4]모델 호출 및 결과값 받기
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		DataRoomDTO dto= dao.selectOne(no);
		dao.close();
		//내용 줄바꿈 처리
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		//5]필요한 값 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);
		//6]뷰 선택후 포워딩
		req.getRequestDispatcher("/DataRoom14/View.jsp").forward(req, resp);
	}/////////////
}
