package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/welcome")
public class WelcomeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String user_name = req.getParameter("user_name");

		resp.setContentType("text/html; charset=utf-8;");
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title></title></head>");
		out.println("<body>");
		out.println(user_name + "·Î±×ÀÎ .<br>");
		out.println("</body>");
		out.println("</html>");
	}

}
