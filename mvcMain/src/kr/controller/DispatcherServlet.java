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
	// 서블릿 - 모델 - jsp 호출

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

		// 데이터 가공하여 .do만 남게 한다
		if (command.indexOf(req.getContextPath()) == 0) {
			command = command.substring(req.getContextPath().length());
		}

		// 모델 클래스가 사용할 변수
		Action com = null;
		// view경로
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
