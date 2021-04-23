package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String item = req.getParameter("item");
		Long price = Long.parseLong(req.getParameter("price"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		String comment = req.getParameter("comment");

		resp.setContentType("text/html; charset=utf-8;");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>주문서</title></head>");
		out.println("<body>");
		out.println("상품명 : " + item + "<br>");
		out.println("가격 : " + price + "원<br>");
		out.println("수량 : " + quantity + "개<br>");
		out.println("전달 내용 : " + comment + "<br>");
		out.println("</body>");
		out.println("</html>");

	}
}
