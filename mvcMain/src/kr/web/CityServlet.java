package kr.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/city")
public class CityServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html; charset=utf-8");

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>여행</title></head>");
		out.println("<body>");
		out.println("<h1>도시 여행</h1>");
		out.println("<p>서울에서의 도시 여행</p>");
		out.println("</body>");
		out.println("</html>");

		out.close();
	}
}
