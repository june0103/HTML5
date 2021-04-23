package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GuguDanServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 클라이언트가 전송한 데이터를 반환
		int dan = Integer.parseInt(req.getParameter("dan"));

		// 컨텐트 타입 및 캐릭터셋 지정
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>구구단</title></head>");
		out.println("<body>");
		out.println(dan + "단<br>");
		for (int i = 1; i <= 9; i++) {
			out.println(dan + "x" + i + "=" + dan * i + "<br>");

		}
		out.println("</body>");
		out.println("</html>");

	}
}
