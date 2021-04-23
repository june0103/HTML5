package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myinfo")
public class MyInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		String name = "ȫ�浿", job = "�л�", address = "�����";
		int age = 20;
		out.println("<html>");
		out.println("<head><title>���� ���� �� �ʱ�ȭ</title></head>");
		out.println("<body>");
		out.println("�̸� : " + name + "<br>");
		out.println("���� : " + age + "�� <br>");
		out.println("���� : " + job + "<br>");
		out.println("�ּ� : " + address);
		out.println("</body>");
		out.println("</html>");

	}
}
