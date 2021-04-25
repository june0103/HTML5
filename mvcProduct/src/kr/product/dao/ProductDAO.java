package kr.product.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.product.vo.ProductVO;

public class ProductDAO {

	// JDBC 1,2단계를 수행하고 Connction 객체를 반환
	private Connection getConnection() throws Exception {

		String driverName = "oracle.jdbc.OracleDriver";
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPass = "tiger";

		// JDBC 수행 1단계
		Class.forName(driverName);
		// JDBC 수행 2단계
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}

	// 자원정리
	private void executeClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
	}

	// 상품 등록
	public void insert(ProductVO productVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "INSERT INTO zproduct(num,name,price,stock,origin,content,reg_date) VALUES(zboard_seq.nextval,?,?,?,?,?,SYSDATE)";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getName());
			pstmt.setInt(2, productVO.getPrice());
			pstmt.setInt(3, productVO.getStock());
			pstmt.setString(4, productVO.getOrigin());
			pstmt.setString(5, productVO.getContent());

			// SQL문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			executeClose(null, pstmt, conn);
		}
	}

	public List<ProductVO> getList() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ProductVO> list = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "SELECT * FROM zproduct ORDER BY num DESC";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);

			// SQL문 실행
			rs = pstmt.executeQuery();

			// 하나의 레코드 정보는 자바빈에 저장하고 생성된 자바빈은 ArrayList에 저장
			list = new ArrayList<ProductVO>();
			while (rs.next()) {
				// 자바빈 생성
				ProductVO productVO = new ProductVO();
				productVO.setNum(rs.getInt("num"));
				productVO.setName(rs.getString("name"));
				productVO.setReg_date(rs.getDate("reg_date"));

				// ArrayList에 자바빈 저장
				list.add(productVO);
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
		return list;
	}// end getList

	// 상품상세
	public ProductVO getProduct(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductVO productVO = null;
		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "SELECT * FROM zproduct WHERE num=?";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 데이터 바인딩
			pstmt.setInt(1, num);
			// SQL문 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 자바빈 생성
				productVO = new ProductVO();
				productVO.setNum(rs.getInt("num"));
				productVO.setName(rs.getString("name"));
				productVO.setPrice(rs.getInt("price"));
				productVO.setStock(rs.getInt("stock"));
				productVO.setOrigin(rs.getString("origin"));
				productVO.setContent(rs.getString("content"));
				productVO.setReg_date(rs.getDate("reg_date"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(rs, pstmt, conn);
		}
		return productVO;
	}// end of getBoard

	// 상품수정
	public void update(ProductVO productVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "UPDATE zproduct SET name=?,price=?,stock=?,origin=?,content=? WHERE num=?";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 데이터 바인딩
			pstmt.setString(1, productVO.getName());
			pstmt.setInt(2, productVO.getPrice());
			pstmt.setInt(3, productVO.getStock());
			pstmt.setString(4, productVO.getOrigin());
			pstmt.setString(5, productVO.getContent());
			pstmt.setInt(6, productVO.getNum());
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
	} // end of update

	// 상품삭제
	public void delete(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "DELETE FROM zproduct WHERE num=?";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 데이터 바인딩
			pstmt.setInt(1, num);
			// SQL문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
	}

}
