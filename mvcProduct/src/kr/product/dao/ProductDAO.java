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

	// JDBC 1,2�ܰ踦 �����ϰ� Connction ��ü�� ��ȯ
	private Connection getConnection() throws Exception {

		String driverName = "oracle.jdbc.OracleDriver";
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPass = "tiger";

		// JDBC ���� 1�ܰ�
		Class.forName(driverName);
		// JDBC ���� 2�ܰ�
		Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		return conn;
	}

	// �ڿ�����
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

	// ��ǰ ���
	public void insert(ProductVO productVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection ��ü ����
			conn = getConnection();
			// SQL�� �ۼ�
			sql = "INSERT INTO zproduct(num,name,price,stock,origin,content,reg_date) VALUES(zboard_seq.nextval,?,?,?,?,?,SYSDATE)";

			// PreparedStatment ��ü ����
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getName());
			pstmt.setInt(2, productVO.getPrice());
			pstmt.setInt(3, productVO.getStock());
			pstmt.setString(4, productVO.getOrigin());
			pstmt.setString(5, productVO.getContent());

			// SQL�� ����
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
			// Connection ��ü ����
			conn = getConnection();
			// SQL�� �ۼ�
			sql = "SELECT * FROM zproduct ORDER BY num DESC";

			// PreparedStatment ��ü ����
			pstmt = conn.prepareStatement(sql);

			// SQL�� ����
			rs = pstmt.executeQuery();

			// �ϳ��� ���ڵ� ������ �ڹٺ� �����ϰ� ������ �ڹٺ��� ArrayList�� ����
			list = new ArrayList<ProductVO>();
			while (rs.next()) {
				// �ڹٺ� ����
				ProductVO productVO = new ProductVO();
				productVO.setNum(rs.getInt("num"));
				productVO.setName(rs.getString("name"));
				productVO.setReg_date(rs.getDate("reg_date"));

				// ArrayList�� �ڹٺ� ����
				list.add(productVO);
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
		return list;
	}// end getList

	// ��ǰ��
	public ProductVO getProduct(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductVO productVO = null;
		try {
			// Connection ��ü ����
			conn = getConnection();
			// SQL�� �ۼ�
			sql = "SELECT * FROM zproduct WHERE num=?";

			// PreparedStatment ��ü ����
			pstmt = conn.prepareStatement(sql);
			// ? ������ ���ε�
			pstmt.setInt(1, num);
			// SQL�� ����
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// �ڹٺ� ����
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

	// ��ǰ����
	public void update(ProductVO productVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection ��ü ����
			conn = getConnection();
			// SQL�� �ۼ�
			sql = "UPDATE zproduct SET name=?,price=?,stock=?,origin=?,content=? WHERE num=?";

			// PreparedStatment ��ü ����
			pstmt = conn.prepareStatement(sql);
			// ? ������ ���ε�
			pstmt.setString(1, productVO.getName());
			pstmt.setInt(2, productVO.getPrice());
			pstmt.setInt(3, productVO.getStock());
			pstmt.setString(4, productVO.getOrigin());
			pstmt.setString(5, productVO.getContent());
			pstmt.setInt(6, productVO.getNum());
			// SQL�� ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
	} // end of update

	// ��ǰ����
	public void delete(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			// Connection ��ü ����
			conn = getConnection();
			// SQL�� �ۼ�
			sql = "DELETE FROM zproduct WHERE num=?";

			// PreparedStatment ��ü ����
			pstmt = conn.prepareStatement(sql);
			// ? ������ ���ε�
			pstmt.setInt(1, num);
			// SQL�� ����
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
	}

}
