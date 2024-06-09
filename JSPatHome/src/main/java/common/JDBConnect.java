package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {

	public Connection con; // 데이터베이스와 연결 담당.
	public Statement stmt; // 인파라미터가 없는 정적 쿼리문을 실행할 때 사용됨.
	public PreparedStatement psmt; // 인파라미터가 있는 동적 쿼리문을 실행할 때 사용됨. 인파라미터는 쿼리문 작성 시 매개변수로 전달된 값을 설정할 때 사용. "?"로 사용
	public ResultSet rs;

	// 기본 생성자
	public JDBConnect() {
		try {
			// JDBC 드라이버 로드. MySQL로 쓰려면 여기랑 url만 바꾸면 됨.
			Class.forName("oracle.jdbc.OracleDriver");

			// DB연결. 하드코딩 되어있다고 함. 좋은 방법은 아님. 사용자 정보가 바뀌면 다시 컴파일 해야되기 때문에 비효율적임.
			// 외부파일(ex.xml파일)을 이용해서 정보를 따로 입력하면 더 효율적.
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "C##MSH";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공~!(기본생성자)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);

			// DB에 연결
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공(인수 생성자1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		try {
			// JDBC 드라이버 로드
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			// DB에 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "C##MSH";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공(인수 생성자2)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 연결 해제(자원 반납)
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
