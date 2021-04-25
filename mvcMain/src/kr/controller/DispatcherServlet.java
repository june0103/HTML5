package kr.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.member.action.DeleteAction;
import kr.member.action.ListAction;
import kr.member.action.UpdateAction;
import kr.member.action.WriteAction;
import kr.member.action.WriteFormAction;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	// ���� - �� - jsp ȣ��

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	private void requestPro(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		String command = req.getRequestURI();

		// ������ �����Ͽ� .do�� ���� �Ѵ�
		if (command.indexOf(req.getContextPath()) == 0) {
			command = command.substring(req.getContextPath().length());
		}

		// �� Ŭ������ ����� ����
		Action com = null;
		// view���
		String view = null;

		if (command == null || command.equals("/list.do")) {
			com = new ListAction();
		} else if (command.equals("/write.do")) {
			com = new WriteAction();
		} else if (command.equals("/update.do")) {
			com = new UpdateAction();
		} else if (command.equals("/delete.do")) {
			com = new DeleteAction();
		} else if (command.equals("/writeForm.do")) {
			com = new WriteFormAction();
		}

		try {
			// ��Ŭ������ execute�޼��带 ������ �����(jsp���)�� ��ȯ�޴´�
			view = com.execute(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// forward ������� view(jsp) ȣ��
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);

	}
}
