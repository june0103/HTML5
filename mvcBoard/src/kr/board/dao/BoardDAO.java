package kr.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;

//DAO : Data Access Object (데이터베이스의 데이터에 접속하는 객체)
public class BoardDAO {

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

	// 글 저장
	public void insert(BoardVO boardVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "INSERT INTO zboard(num,title,name,passwd,email,content,ip,reg_date) VALUES(zboard_seq.nextval,?,?,?,?,?,?,SYSDATE)";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getTitle());
			pstmt.setString(2, boardVO.getName());
			pstmt.setString(3, boardVO.getPasswd());
			pstmt.setString(4, boardVO.getEmail());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setString(6, boardVO.getIp());

			// SQL문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {

		} finally {
			executeClose(null, pstmt, conn);
		}
	}

	public List<BoardVO> getList() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<BoardVO> list = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "SELECT * FROM zboard ORDER BY num DESC";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);

			// SQL문 실행
			rs = pstmt.executeQuery();

			// 하나의 레코드 정보는 자바빈에 저장하고 생성된 자바빈은 ArrayList에 저장
			list = new ArrayList<BoardVO>();
			while (rs.next()) {
				// 자바빈 생성
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setTitle(rs.getString("title"));
				boardVO.setName(rs.getString("name"));
				boardVO.setReg_date(rs.getDate("reg_date"));

				// ArrayList에 자바빈 저장
				list.add(boardVO);
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
		return list;
	}// end getList

	// 글상세
	public BoardVO getBoard(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardVO board = null;
		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "SELECT * FROM zboard WHERE num=?";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 데이터 바인딩
			pstmt.setInt(1, num);
			// SQL문 실행
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 자바빈 생성
				board = new BoardVO();
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setName(rs.getString("name"));
				board.setPasswd(rs.getString("passwd"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(rs, pstmt, conn);
		}
		return board;
	}// end of getBoard

	// 글수정
	public void update(BoardVO boardVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "UPDATE zBoard SET title=?,name=?,email=?,content=?,ip=? WHERE num=?";

			// PreparedStatment 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 데이터 바인딩
			pstmt.setString(1, boardVO.getTitle());
			pstmt.setString(2, boardVO.getName());
			pstmt.setString(3, boardVO.getEmail());
			pstmt.setString(4, boardVO.getContent());
			pstmt.setString(5, boardVO.getIp());
			pstmt.setInt(6, boardVO.getNum());
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			executeClose(null, pstmt, conn);
		}
	} // end of update
		// 글삭제

	public void delete(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			// Connection 객체 생성
			conn = getConnection();
			// SQL문 작성
			sql = "DELETE FROM zboard WHERE num=?";

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
