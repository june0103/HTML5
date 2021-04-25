package kr.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class DetailAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();
		BoardVO boardVO = dao.getBoard(num);

		request.setAttribute("boardVO", boardVO);

		return "/views/detail.jsp";
	}
}
