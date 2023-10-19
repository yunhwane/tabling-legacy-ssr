package ymw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import ymw.vo.PopSch;
import ymw.vo.RecSch;
import ymw.vo.SchList;



public class Sch {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	
	
	public List<PopSch> pop(){
		  List<PopSch> schList = new ArrayList<PopSch>();
	      String sql="SELECT SEARCH_WORD  FROM (\r\n"
	      		+ "SELECT SEARCH_WORD , count(SEARCH_WORD) cnt \r\n"
	      		+ "FROM (SELECT * FROM JJIM_SCH WHERE (sysdate-SEARCH_DATE) <31 )\r\n"
	      		+ "GROUP BY SEARCH_WORD \r\n"
	      		+ "ORDER BY cnt DESC)\r\n"
	      		+ "WHERE ROWNUM<=10";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
					// select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
					// 맞게 rs.get타입("컬럼명") 지정하여야 한다.
	        	 schList.add(new PopSch(rs.getString(1))
							 );
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
	
	public List<SchList> SL(String sch, String appKind, String arrKind){
		  int waiting = 1;
		  int reservation = 1;
		  String arr = "별점높은순";
		  if(appKind.equals("원격줄서기")) reservation = 0;
		  else if(appKind.equals("즉시예약")) waiting = 0;
		  
		  if(arrKind.equals("별점높은순")) arr="order by sco desc";
		  else if(arrKind.equals("신규매장순")) arr = "order by ENROLL_DATE desc";
		  else if(arrKind.equals("리뷰많은순")) arr = "order by cnt desc";
		  
		  
		  List<SchList> schList = new ArrayList<SchList>();
	      String sql="SELECT r.RESNUM, r.RES_NAME,r.RES_ADDRESSS,r.wating, r.reservation, m.mCategory,"
	      		+ "NVL(rev.cnt,0) cnt, NVL(rev.sco, 0) sco,r.ENROLL_DATE, res_img\r\n"
	      		+ "FROM restaurant r, menu m, (SELECT RESNUM, avg(STAR_SCO) sco, count(STAR_SCO) cnt "
	      		+ "FROM jjim_review GROUP BY RESNUM) rev\r\n"
	      		+ "WHERE r.RESNUM = m.RESNUM AND r.RESNUM = rev.resnum(+) AND \r\n"
	      		+ "(r.RES_NAME like '%'||?||'%' OR m.MCATEGORY LIKE '%'||?||'%') AND \r\n"
	      		+ "(WATING=? or RESERVATION=?)\r\n";
	      sql += arr;
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, sch);
	         pstmt.setString(2, sch);
	         pstmt.setInt(3, waiting);
	         pstmt.setInt(4, reservation);
	         rs=pstmt.executeQuery();
	         System.out.println(arr);
	         while(rs.next()) {
					// select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
					// 맞게 rs.get타입("컬럼명") 지정하여야 한다.
	        	 double result2 = Math.round(rs.getDouble(8) * 10) / 10.0;
	        	 schList.add(new SchList(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getInt(4),
	        			 rs.getInt(5),
	        			 rs.getString(6),
	        			 result2,
	        			 rs.getInt(7),
	        			 rs.getString(10)
	        			 )
							 );
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
	
	public LinkedHashSet<String> recSch(String email){
		LinkedHashSet<String> schList = new LinkedHashSet<>();
	      String sql="SELECT SEARCH_WORD, to_char(SEARCH_DATE,'MM.DD')"
	      		+ "FROM JJIM_SCH WHERE USER_EMAIL = ?"
	      		+ "ORDER BY SEARCH_DATE desc";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, email);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList.add(rs.getString(1));
				}
	         
	      }catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return schList;
	      
	   }
	
	public void SchInsert(String email,String sch) {
		String sql = "insert into JJIM_SCH values(?,?,sysdate)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, sch);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println(e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
}
