package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/num")
public class NumServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int num = Integer.parseInt(req.getParameter("num"));

		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>¦/Ȧ�� ���ϱ�</title></head>");
		out.println("<body>");
		out.println("�Է��� ���� : " + num + "<br>");
		if (num <= 0) {
			out.println("������ �Է��ϼ���.");
		} else if (num % 2 == 0) {
			out.println(num + "�� ¦���Դϴ�.");
		} else {
			out.println(num + "�� Ȧ���Դϴ�.");
		}
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

}
