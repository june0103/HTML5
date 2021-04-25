package kr.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.member.action.CheckIdAjaxAction;
import kr.member.action.DeleteAction;
import kr.member.action.DeleteFormAction;
import kr.member.action.LoginAction;
import kr.member.action.LoginFormAction;
import kr.member.action.LogoutAction;
import kr.member.action.MainAction;
import kr.member.action.ModifyAction;
import kr.member.action.ModifyFormAction;
import kr.member.action.MyPageAction;
import kr.member.action.RegisterAction;
import kr.member.action.RegisterFormAction;

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
		if (command.indexOf(req.getContextPath()) == 0) {

			command = command.substring(req.getContextPath().length());
		}

		if (command == null || command.equals("/main.do")) {
			com = new MainAction();
		} else if (command.equals("/registerForm.do")) {
			com = new RegisterFormAction();
		} else if (command.equals("/register.do")) {
			com = new RegisterAction();
		} else if (command.equals("/checkId.do")) {
			com = new CheckIdAjaxAction();
		} else if (command.equals("/loginForm.do")) {
			com = new LoginFormAction();
		} else if (command.equals("/login.do")) {
			com = new LoginAction();
		} else if (command.equals("/logout.do")) {
			com = new LogoutAction();
		} else if (command.equals("/myPage.do")) {
			com = new MyPageAction();
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
