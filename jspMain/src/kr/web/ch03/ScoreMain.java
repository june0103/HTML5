package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/scoreMain")
public class ScoreMain extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String name = req.getParameter("name");
		int korean = Integer.parseInt(req.getParameter("korean"));
		int english = Integer.parseInt(req.getParameter("english"));
		int math = Integer.parseInt(req.getParameter("math"));
		int sum = korean + english + math;
		int avg = sum / 3;
		String grade = "";

		resp.setContentType("text/html;charset=utf-8;");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>점수구하기</title></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");
		out.println("국어 : " + korean + "점<br>");
		out.println("영어 : " + english + "점<br>");
		out.println("수학 : " + math + "점<br>");
		out.println("총점 : " + sum + "점<br>");
		out.println("평균 : " + avg + "점<br>");
		switch (avg / 10) {
		case 10:
			break;
		case 9:
			grade = "A";
			break;
		case 8:
			grade = "B";
			break;
		case 7:
			grade = "C";
			break;
		case 6:
			grade = "D";
			break;
		default:
			grade = "F";
			break;
		}
		out.println("등급 : " + grade);

		out.println("</body>");
		out.println("</html>");
	}
}
