package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class ModifyFormAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer user_num = (Integer) session.getAttribute("user_num");

		// 로그인 여부 체크
		if (user_num == null) {
			return "/views/checkLogin.jsp";
		}

		// 로그인 된 경우
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.getMember(user_num);

		request.setAttribute("member", member);

		return "/views/modifyForm.jsp";
	}
}
