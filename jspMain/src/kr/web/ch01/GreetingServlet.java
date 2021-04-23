package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting")
public class GreetingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ���� Ÿ�� �� ĳ���ͼ� ����
		response.setContentType("text/html;charset=utf-8;");

		// HTML�±� ����� ���ؼ� ��� ��Ʈ�� ����
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>�ȳ��ϼ���!!</title></head>");
		out.println("<body>");
		out.println("�ȳ��ϼ���!!");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
