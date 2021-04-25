package kr.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.product.dao.ProductDAO;
import kr.product.vo.ProductVO;

public class RegisterAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 전성된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");

		// 전송된 데이터를 반환받아서 자바빈 객체에 저장
		// 자바빈(VO)객체 생성
		ProductVO productVO = new ProductVO();
		productVO.setName(request.getParameter("name"));
		productVO.setPrice(Integer.parseInt(request.getParameter("price")));
		productVO.setStock(Integer.parseInt(request.getParameter("stock")));
		productVO.setOrigin(request.getParameter("origin"));
		productVO.setContent(request.getParameter("content"));

		// DAO 객체 생성
		ProductDAO productDAO = new ProductDAO();
		productDAO.insert(productVO);

		return "/views/register.jsp";
	}
}
