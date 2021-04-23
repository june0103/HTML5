package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hundred")
public class HundredServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		int total = 0;
		for (int i = 1; i <= 100; i++) {
			total += i;
		}
		out.println("<html>");
		out.println("<head><title>1부터 100까지의 합 출력</title></head>");
		out.println("<body>");

		out.println("1부터 100까지의 합은 " + total);
		out.println("</body>");
		out.println("</html>");

	}
}
