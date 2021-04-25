package kr.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// DAO ��ü ����
		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> list = boardDAO.getList();

		request.setAttribute("list", list);
		// JSP ��� ��ȯ
		return "/views/list.jsp";
	}

}
