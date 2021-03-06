package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		resp.setContentType("text/html; charset=utf-8;");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>게시판</title></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");
		out.println("제목 : " + title + "ㅇ<br>");
		out.println("내용 : " + content + "<br>");
		out.println("</body>");
		out.println("</html>");
	}
}
