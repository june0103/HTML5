package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// request에 데이터 저장
		request.setAttribute("message", "회원 정보 삭제");
		// JSP 경로 반환
		return "/views/delete.jsp";
	}

}