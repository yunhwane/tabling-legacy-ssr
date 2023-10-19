package hds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class reservation_Dao {
	// 필드 선언
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 즉시예약 신청
	public void res_insert(String user_email, String resNum, int reserve_apply_person, String reserve_start_time, String reserve_request ) {
		String sql="INSERT INTO RESERVATION values(?,?,?,to_date(?,'YYYY-MM-DD HH24:MI'),?,0)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			pstmt.setInt(3, reserve_apply_person);
			pstmt.setString(4, reserve_start_time);
			pstmt.setString(5, reserve_request);
			

			con.commit();
			int insertSuccess = pstmt.executeUpdate();
			 if (insertSuccess>0) {
				System.out.println("예약 신청 완료!");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		
	}

	// 즉시예약 승인
	public void res_approval(String user_email, String resNum,String reserve_start_time) {
		String sql="UPDATE reservation\r\n"
				+ "SET RESERVE_STATE = 1\r\n"
				+ "WHERE USER_EMAIL = ?\r\n"
				+ "AND RESNUM = ?\r\n"
				+ "AND RESERVE_START_TIME = TO_DATE(?,'YYYY-MM-DD HH24:MI:SS')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			pstmt.setString(3, reserve_start_time);	
	
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
	}

	// 가게 현재 내 예약
	public List<Reservation> showResList(String user_email, String resNum){
		List<Reservation> alist = new ArrayList<Reservation>();
		String sql = "SELECT j.NICKNAME, j.PHONE_NUMBER, r.RESERVE_APPLY_PERSON, r.RESERVE_START_TIME, r.RESERVE_STATE, r.USER_EMAIL \r\n"
				+ "FROM RESERVATION r, jjim_user j\r\n"
				+ "WHERE r.USER_EMAIL = j.USER_EMAIL\r\n"
				+ "AND j.USER_EMAIL LIKE '%'||?||'%'\r\n"
				+ "AND r.RESNUM LIKE '%'||?||'%'";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new Reservation(rs.getString("NICKNAME"),
						rs.getString("PHONE_NUMBER"),
						rs.getInt("RESERVE_APPLY_PERSON"),
						rs.getString("RESERVE_START_TIME"),
						rs.getInt("RESERVE_STATE"),
						rs.getString("USER_EMAIL"))
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		return alist;
		
	}

	// 예약 신청 내역 확인하기
	public List<Reservation> showApproval(String user_email, String reserve_start_time, String RESNUM){
		List<Reservation> alist = new ArrayList<Reservation>();
		String sql = "SELECT *\r\n"
				+ "FROM reservation\r\n"
				+ "WHERE user_email = ?\r\n"
				+ "AND reserve_start_time = TO_DATE(?,'YYYY-MM-DD HH24:MI:SS')\r\n"
				+ "AND RESNUM = ?\r\n";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, reserve_start_time);
			pstmt.setString(3, RESNUM);
	
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new Reservation(rs.getString("user_email"),
						rs.getString("resNum"),
						rs.getInt("reserve_apply_person"),
						rs.getString("reserve_start_time"),
						rs.getString("reserve_request"),
						rs.getInt("reserve_state"))
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		return alist;
		
	}

	// 고객 현재 내 예약
	public List<Reservation> showCurrentRes(String user_email, String resNum){
		List<Reservation> alist = new ArrayList<Reservation>();
		String sql = "SELECT r2.RES_NAME, r2.RES_PHONENUM, r.*\r\n"
				+ "FROM RESERVATION r, RESTAURANT r2\r\n"
				+ "WHERE r.RESNUM = r2.RESNUM \r\n"
				+ "AND USER_EMAIL LIKE '%'||?||'%'\r\n"
				+ "AND r2.RESNUM LIKE '%'||?||'%'";
		try {
			con = DB.con();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				alist.add(new Reservation(rs.getString("RES_NAME"),
						rs.getString("RES_PHONENUM"),
						rs.getString("user_email"),
						rs.getString("resNum"),
						rs.getInt("reserve_apply_person"),
						rs.getString("reserve_start_time"),
						rs.getString("reserve_request"),
						rs.getInt("reserve_state"))
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		return alist;
		
	}

	// 즉시예약 거절
	public void res_deny(String user_email, String resNum,String reserve_start_time) {
		String sql="UPDATE reservation\r\n"
				+ "SET RESERVE_STATE = 2\r\n"
				+ "WHERE USER_EMAIL = ?\r\n"
				+ "AND RESNUM = ?\r\n"
				+ "AND RESERVE_START_TIME = TO_DATE(?,'YYYY-MM-DD HH24:MI:SS')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			pstmt.setString(2, resNum);
			pstmt.setString(3, reserve_start_time);	
	
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		}catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 : "+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
	}	

}
