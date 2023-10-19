package ljw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ljw.vo.WaitingCancelEnter;

public class WaitingCcEntDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 취소하기<<손님
	public void cancelWCustomer(WaitingCancelEnter cwc ) {
		String sql="UPDATE WAITING\r\n"
				+ "SET CANCEL ='T', ENTER_CHECK ='F'\r\n"
				+ "WHERE user_email=?\r\n"
				+ "AND to_char(to_date(?, 'YYYY/MM/DD'),'YYYY/MM/DD') = TO_char(wstarttime,'YYYY/MM/DD') \r\n"
				+ "AND cancel='F' 		\r\n"
				+ "AND enter_check='F'";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cwc.getUserEmail());
			pstmt.setString(2, cwc.getWstarttimeS());

			pstmt.executeUpdate();
			con.commit();
			
		}catch (SQLException e) {
			System.out.println("DB 에러: "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 에러: "+e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러"+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}	
	}

	public static void main(String[] args) {
		WaitingCcEntDao dao = new WaitingCcEntDao();

	}

}
