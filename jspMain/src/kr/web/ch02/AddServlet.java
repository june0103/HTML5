package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));

		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>µ¡¼ÀÇÏ±â</title></head>");
		out.println("<body>");
		out.println(num1 + " + " + num2 + " = " + (num1 + num2) + "<br>");
		out.printf("%d + %d = %d", num1, num2, num1 + num2);
		out.println("</body>");
		out.println("</html>");
	}
}
