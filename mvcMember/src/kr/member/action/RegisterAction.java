package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class RegisterAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// ������ ������ ���ڵ� ó��
		request.setCharacterEncoding("utf-8");

		// ���۵� �����͸� ��ȯ�޾Ƽ� �ڹٺ� ��ü�� ����
		// �ڹٺ�(VO)��ü ����
		MemberVO memberVO = new MemberVO();
		memberVO.setId(request.getParameter("id"));
		memberVO.setName(request.getParameter("name"));
		memberVO.setPasswd(request.getParameter("passwd"));
		memberVO.setEmail(request.getParameter("email"));
		memberVO.setAddress(request.getParameter("address"));
		memberVO.setPhone(request.getParameter("phone"));

		// DAO ��ü ����
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.insertMember(memberVO);

		return "/views/register.jsp";
	}
}
