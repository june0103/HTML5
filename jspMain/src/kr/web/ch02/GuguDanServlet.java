package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GuguDanServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Ŭ���̾�Ʈ�� ������ �����͸� ��ȯ
		int dan = Integer.parseInt(req.getParameter("dan"));

		// ����Ʈ Ÿ�� �� ĳ���ͼ� ����
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>������</title></head>");
		out.println("<body>");
		out.println(dan + "��<br>");
		for (int i = 1; i <= 9; i++) {
			out.println(dan + "x" + i + "=" + dan * i + "<br>");

		}
		out.println("</body>");
		out.println("</html>");

	}
}
