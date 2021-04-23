package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myinfo")
public class MyInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		String name = "홍길동", job = "학생", address = "서울시";
		int age = 20;
		out.println("<html>");
		out.println("<head><title>변수 선언 및 초기화</title></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");
		out.println("나이 : " + age + "살 <br>");
		out.println("직업 : " + job + "<br>");
		out.println("주소 : " + address);
		out.println("</body>");
		out.println("</html>");

	}
}
