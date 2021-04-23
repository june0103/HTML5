package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting")
public class GreetingServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8;");

		// HTML태그 출력을 위해서 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>안녕하세요!!</title></head>");
		out.println("<body>");
		out.println("안녕하세요!!");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
