package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/todayMenu")
public class TodayMenu extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		resp.setContentType("text/html;charset=utf-8;");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>오늘 점심 메뉴</title></head>");
		out.println("<body>");
		out.println("<h3>오늘 점심은</h3>");
		String[] values = req.getParameterValues("lunch");
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
