package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/travel")
public class TravelServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		resp.setContentType("text/html;charset=utf-8;");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>여행지</title></head>");
		out.println("<body>");
		String name = req.getParameter("name");
		out.println("이름 : " + name + "<br>");
		out.println("선택한 여행지<br>");
		String[] values = req.getParameterValues("city");
		if (values != null) {

			for (int i = 0; i < values.length; i++) {
				out.println(values[i] + "<br>");
			}
		} else {
			out.println("선택하지 않음");
		}
		out.println("</body>");
		out.println("</html>");
	}
}
