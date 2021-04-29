package controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Currency;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	 	NumberFormat nf = NumberFormat.getInstance();
	 	//천 단위로 콤마찍기: format()메서드
	 	String commaMoney=nf.format(10000);
	 	//현지 통화단위 기호 얻기]
	 	Currency currency = nf.getCurrency();
	 	String symbol=currency.getSymbol();
	 	String money=symbol+commaMoney;
	 	req.setAttribute("money", money);
		
		req.setAttribute("message", "Hello Servlet!!!");
		req.getRequestDispatcher("/HelloWorld.jsp").forward(req, resp);
	}///////////////////
}
