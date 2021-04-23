package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");

		resp.setContentType("text/html; charset=utf-8;");
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title></title></head>");
		out.println("<body>");
		out.println("�̸� : " + name + "<br>");
		out.println("��ȭ��ȣ : " + phone + "<br>");
		out.println("�ּ� : " + address);
		out.println("</body>");
		out.println("</html>");
	}
}
