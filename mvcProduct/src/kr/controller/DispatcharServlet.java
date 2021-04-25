package kr.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.product.action.DeleteAction;
import kr.product.action.DeleteFormAction;
import kr.product.action.DetailAction;
import kr.product.action.ListAction;
import kr.product.action.ModifyAction;
import kr.product.action.ModifyFormAction;
import kr.product.action.RegisterAction;
import kr.product.action.RegisterFormAction;

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

		// 주소를 가져온다 예) /mvcBoard/list.do
		String command = req.getRequestURI();

		// 모델 클래스가 사용할 변수
		Action com = null;
		// view경로
		String view = null;

		// 데이터 가공하여 .do만 남게 한다
		if (command.indexOf(req.getContextPath()) == 0) {

			command = command.substring(req.getContextPath().length());
		}

		if (command == null || command.equals("/list.do")) {
			com = new ListAction();
		} else if (command.equals("/registerForm.do")) {
			com = new RegisterFormAction();
		} else if (command.equals("/register.do")) {
			com = new RegisterAction();
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
			// 모델클래스의 execute메서드를 실행한 결과값(jsp경로)을 반환받는다
			view = com.execute(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// forward 방식으로 view(jsp) 호출
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);

	}

}
