package ljw;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	
	public static Connection con() throws SQLException {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
//			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 에러: "+e.getMessage());
		} 
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
//		System.out.println("연결 성공★");
		
		return con;	
	}
	
	public static void close(ResultSet rs, Statement stmt, Connection con ) {	
		try {
			if(rs != null ) rs.close();
			if(stmt != null ) stmt.close();
			if(con != null ) con.close();		
		} catch (SQLException e) {
			System.out.println("연결 종료 예외 발생: "+e.getMessage());
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e1) {
					System.out.println("[ResultSet]: "+e1.getMessage());
				}	
			}
			if(stmt != null) {
				try {
					stmt.close();
				}catch(SQLException e1) {
					System.out.println("[Statement]: "+e.getMessage());
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e1) {
					System.out.println("[Connection]: "+e.getMessage());
				}
			}
		}	
	}
	
}
