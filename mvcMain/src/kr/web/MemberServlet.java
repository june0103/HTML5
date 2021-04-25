package kr.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member")
public class MemberServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		String name = req.getParameter("name");
		String job = req.getParameter("job");

		resp.setContentType("text/html; charset=utf-8");

		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head><title>회원가입</title></head>");
		out.println("<body>");
		out.println("<h1>회원가입</h1>");
		out.println("<p>");
		out.println("이름 : " + name + "<br>");
		out.println("직업 : " + job + "<br>");
		out.println("</p>");
		out.println("</body>");
		out.println("</html>");

		out.close();

	}
}
