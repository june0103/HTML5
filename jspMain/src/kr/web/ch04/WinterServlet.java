package kr.web.ch04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/winter")
public class WinterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html; charset=utf-8");

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>겨울</title></head>");
		out.println("<body>");
		out.println("<h1>겨울 여행</h1>");
		out.println("</body>");
		out.println("</html>");

	}
}
