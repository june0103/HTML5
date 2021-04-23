package kr.web.ch01;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/now")
public class NowServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// �����Ͻú��� ������ ��� ���� Date��ü ����
		Date now = new Date();
		// ��¥ ���� ����
		SimpleDateFormat sf = new SimpleDateFormat("yyyy��MM��dd�� a hh:mm:ss");
		// ���� Ÿ�� �� ĳ���ͼ� ����
		resp.setContentType("text/html;charset=utf-8");
		// HTML�±� ����� ���� ��� ��Ʈ�� ����
		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<head><title>���� ��¥�� �ð�</title></head>");
		out.println("<body>");
		out.println("���� ��¥�� �ð� : " + sf.format(now));
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
