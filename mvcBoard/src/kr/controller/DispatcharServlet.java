package kr.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.action.DeleteAction;
import kr.board.action.DeleteFormAction;
import kr.board.action.DetailAction;
import kr.board.action.ListAction;
import kr.board.action.ModifyAction;
import kr.board.action.ModifyFormAction;
import kr.board.action.WriteAction;
import kr.board.action.WriteFormAction;

@WebServlet("*.do")
public class DispatcharServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	private void requestPro(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		// �ּҸ� �����´� ��) /mvcBoard/list.do
		String command = req.getRequestURI();

		// �� Ŭ������ ����� ����
		Action com = null;
		// view���
		String view = null;

		// ������ �����Ͽ� .do�� ���� �Ѵ�
		// getContextPath�� /mvcBoard�� ���Ѵ�.
		if (command.indexOf(req.getContextPath()) == 0) {
			// ��) /mvcBoard/list.do���� /mvcBoard�� �����ϰ� ������ ���ڿ��� ��ȯ
			command = command.substring(req.getContextPath().length());
		}

		if (command == null || command.equals("/list.do")) {
			com = new ListAction();
		} else if (command.equals("/writeForm.do")) {
			com = new WriteFormAction();
		} else if (command.equals("/write.do")) {
			com = new WriteAction();
		} else if (command.equals("/detail.do")) {
			com = new DetailAction();
		} else if (command.equals("/modifyForm.do")) {
			com = new ModifyFormAction();
		} else if (command.equals("/modify.do")) {
			com = new ModifyAction();
		} else if (command.equals("/deleteForm.do")) {
			com = new DeleteFormAction();
		} else if (command.equals("/delete.do")) {
			com = new DeleteAction();
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
