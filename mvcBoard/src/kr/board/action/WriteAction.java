package kr.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.board.dao.BoardDAO;
import kr.board.vo.BoardVO;
import kr.controller.Action;

public class WriteAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 전성된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");

		// 전송된 데이터를 반환받아서 자바빈 객체에 저장
		// 자바빈(VO)객체 생성
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle(request.getParameter("title"));
		boardVO.setName(request.getParameter("name"));
		boardVO.setPasswd(request.getParameter("passwd"));
		boardVO.setEmail(request.getParameter("email"));
		boardVO.setContent(request.getParameter("content"));
		boardVO.setIp(request.getRemoteAddr());

		// DAO 객체 생성
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.insert(boardVO);

		return "/views/write.jsp";
	}
}
