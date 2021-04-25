package kr.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.product.dao.ProductDAO;
import kr.product.vo.ProductVO;

public class ModifyAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// ���۵� ������ ���ڵ� ó��
		request.setCharacterEncoding("utf-8");
		// �ڹ��� ��ü ����
		ProductVO productVO = new ProductVO();
		// request�� ����� �����͸� ��ȯ�޾Ƽ� �ڹٺ� ����
		productVO.setNum(Integer.parseInt(request.getParameter("num")));
		productVO.setName(request.getParameter("name"));
		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		productVO.setStock(Integer.parseInt(request.getParameter("stock")));
		productVO.setOrigin(request.getParameter("origin"));
		productVO.setContent(request.getParameter("content"));

		ProductDAO dao = new ProductDAO();

		dao.update(productVO);

		return "/views/modify.jsp";
	}
}
