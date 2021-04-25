package kr.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class ModifyAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// ���۵� ������ ���ڵ� ó��
		request.setCharacterEncoding("utf-8");
		// �ڹ��� ��ü ����
		BoardVO boardVO = new BoardVO();
		// request�� ����� �����͸� ��ȯ�޾Ƽ� �ڹٺ� ����
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
			// ��й�ȣ ���� ��� true�� ��й�ȣ ��ġ, false�� ��й�ȣ ����ġ
			check = board.isCheckedPassword(request.getParameter("passwd"));
		}

		if (check) {
			// �Է��� ��й�ȣ�� DB�� ����� ��й�ȣ�� ��ġ�ϸ� �ۼ���
			dao.update(boardVO);
		}
		request.setAttribute("check", check);

		return "/views/modify.jsp";
	}
}
