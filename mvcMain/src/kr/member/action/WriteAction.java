package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 전송된 데이터 반환
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String job = request.getParameter("job");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		// request에 데이터 저장
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		request.setAttribute("password", password);
		request.setAttribute("job", job);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);
		request.setAttribute("message", "회원가입 성공");
		// JSP 경로 반환
		return "/views/write.jsp";
	}

}