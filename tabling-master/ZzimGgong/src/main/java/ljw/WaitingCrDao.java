package ljw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ljw.vo.WaitingCurrent;

public class WaitingCrDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
		
	// 주문현황
	
	// 1. 가게, 신청정보 출력
	public WaitingCurrent curntSitu(String userEmail){
		WaitingCurrent cwlist = new WaitingCurrent();
		String sql = "SELECT res_name, res_phonenum, res_addresss, wstarttime, waiting_num, waiting_person, cancel, enter_check\r\n"
				+ "FROM waiting w, RESTAURANT r  \r\n"
				+ "WHERE w.resnum = r.resnum\r\n"
				+ "AND user_email=?\r\n"
				+ "AND cancel='F'\r\n"
				+ "AND enter_check='F'";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userEmail);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				cwlist=new WaitingCurrent(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getDate(4),
							rs.getInt(5),
							rs.getInt(6),
							rs.getString(7),
							rs.getString(8)	
						);
			}
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
		return cwlist;
	}

	//2. 실시간 입장순서
	
	public int currentNum(String userEmail){
		String sql="SELECT TO_NUMBER(rn.rrn) AS rrownum\r\n"
				+ "FROM waiting w, (\r\n"
				+ "SELECT TO_CHAR(rownum,'9999' ) rrn , user_email\r\n"
				+ "FROM WAITING\r\n"
				+ "WHERE to_char(SYSDATE,'YYYY/MM/DD') = TO_char(wstarttime,'YYYY/MM/DD')\r\n"
				+ "AND resnum=(\r\n"
				+ "			SELECT RESNUM \r\n"
				+ "			FROM WAITING\r\n"
				+ "			WHERE user_email=?\r\n"
				+ "			AND cancel='F' 		\r\n"
				+ "			AND enter_check='F'\r\n"
				+ "			)\r\n"
				+ "AND cancel='F' 		\r\n"
				+ "AND enter_check='F'\r\n"
				+ "ORDER BY wstarttime) rn\r\n"
				+ "WHERE w.user_email = rn.user_email\r\n"
				+ "AND w.user_email=?";
		int cnt = 0;
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userEmail);

			rs = pstmt.executeQuery();// countResnum
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println(cnt);
			
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
		return cnt;
	}



	
	
	public static void main(String[] args) {
		WaitingCrDao dao = new WaitingCrDao();
		


	}
}
