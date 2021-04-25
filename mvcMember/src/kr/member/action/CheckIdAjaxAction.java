package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class CheckIdAjaxAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.checkMember(id);
		String result = null;
		if (member == null) { // ���̵� ���ߺ�
			result = "{\"result\":\"idNotFound\"}";
		} else { // ���̵� �ߺ�
			result = "{\"result\":\"idDuplicated\"}";

		}

		request.setAttribute("result", result);

		return "/views/checkId.jsp";
	}
}
