package kr.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.product.dao.ProductDAO;
import kr.product.vo.ProductVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// DAO 객체 생성
		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> list = productDAO.getList();

		request.setAttribute("list", list);
		// JSP 경로 반환
		return "/views/list.jsp";
	}

}
