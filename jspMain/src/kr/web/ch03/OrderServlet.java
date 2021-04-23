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
		out.println("<head><title>�ֹ���</title></head>");
		out.println("<body>");
		out.println("��ǰ�� : " + item + "<br>");
		out.println("���� : " + price + "��<br>");
		out.println("���� : " + quantity + "��<br>");
		out.println("���� ���� : " + comment + "<br>");
		out.println("</body>");
		out.println("</html>");

	}
}
