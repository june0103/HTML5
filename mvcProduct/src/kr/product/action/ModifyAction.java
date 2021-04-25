package kr.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.product.dao.ProductDAO;
import kr.product.vo.ProductVO;

public class ModifyAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 자바진 객체 생성
		ProductVO productVO = new ProductVO();
		// request에 저장된 데이터를 반환받아서 자바빈에 저장
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
