package kr.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class ModifyAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 자바진 객체 생성
		BoardVO boardVO = new BoardVO();
		// request에 저장된 데이터를 반환받아서 자바빈에 저장
		boardVO.setNum(Integer.parseInt(request.getParameter("num")));
		boardVO.setTitle(request.getParameter("title"));
		boardVO.setName(request.getParameter("name"));
		boardVO.setEmail(request.getParameter("email"));
		boardVO.setIp(request.getRemoteAddr());
		boardVO.setPasswd(request.getParameter("passwd"));
		boardVO.setContent(request.getParameter("content"));

		BoardDAO dao = new BoardDAO();

		BoardVO board = dao.getBoard(boardVO.getNum());
		boolean check = false;

		if (board != null) {
			// 비밀번호 인증 결과 true면 비밀번호 일치, false면 비밀번호 불일치
			check = board.isCheckedPassword(request.getParameter("passwd"));
		}

		if (check) {
			// 입력한 비밀번호가 DB에 저장된 비밀번호와 일치하면 글수정
			dao.update(boardVO);
		}
		request.setAttribute("check", check);

		return "/views/modify.jsp";
	}
}
