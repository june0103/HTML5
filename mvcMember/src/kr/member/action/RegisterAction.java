package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class RegisterAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 전성된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");

		// 전송된 데이터를 반환받아서 자바빈 객체에 저장
		// 자바빈(VO)객체 생성
		MemberVO memberVO = new MemberVO();
		memberVO.setId(request.getParameter("id"));
		memberVO.setName(request.getParameter("name"));
		memberVO.setPasswd(request.getParameter("passwd"));
		memberVO.setEmail(request.getParameter("email"));
		memberVO.setAddress(request.getParameter("address"));
		memberVO.setPhone(request.getParameter("phone"));

		// DAO 객체 생성
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.insertMember(memberVO);

		return "/views/register.jsp";
	}
}
