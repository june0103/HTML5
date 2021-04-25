package kr.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.product.dao.ProductDAO;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		int num = Integer.parseInt(request.getParameter("num"));

		ProductDAO dao = new ProductDAO();

		dao.delete(num);

		return "views/delete.jsp";
	}

}
