package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// ���۵� ������ ���ڵ�
		request.setCharacterEncoding("utf-8");

		// ���۵� ������
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.checkMember(id);
		boolean check = false;

		if (member != null) { // id����
			// ��й�ȣ ��ġ ���� üũ
			check = member.isCheckedPassword(passwd);
		}

		if (check) {
			// ����ڰ� �Է��� id�� ��й�ȣ�� ����� id�� ��й�ȣ�� ��ġ�ϸ�
			HttpSession session = request.getSession();
			session.setAttribute("user_num", member.getNum());
			session.setAttribute("user_id", member.getId());

		}

		request.setAttribute("check", check);

		return "/views/login.jsp";
	}
}
