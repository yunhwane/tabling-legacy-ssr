package ymw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ymw.vo.Menu;
import ymw.vo.Respick;
import ymw.vo.Restaurant;
import ymw.vo.Review;
import ymw.vo.StoReview;

public class StoreInfo {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public Restaurant detailStore(String resnum){
		  Restaurant schList = new Restaurant();
	      String sql="SELECT * FROM RESTAURANT WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new Restaurant(
	        			 rs.getString(1),
	        			 rs.getString(2),
			        	 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7),
						 rs.getString(8),
						 rs.getString(9),
						 rs.getString(10),
						 rs.getString(11),
						 rs.getString(12),
						 rs.getString(13),
						 rs.getInt(14),
						 rs.getInt(15))
							 ;
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
	
	public StoReview StoreReview(String resnum){
		StoReview schList = new StoReview();
	      String sql="SELECT r.RESNUM, r.RES_NAME, NVL(rev.sco, 0)sco, NVL(rev.cnt,0) cnt\r\n"
	      		+ "FROM restaurant r, menu m, (SELECT RESNUM, avg(STAR_SCO) sco, count(STAR_SCO) cnt FROM jjim_review GROUP BY RESNUM) rev\r\n"
	      		+ "WHERE r.RESNUM = m.RESNUM AND r.RESNUM = rev.resnum(+) AND r.resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 double result2 = Math.round(rs.getDouble(3) * 10) / 10.0;
	        	 schList = new StoReview(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 result2,
						 rs.getInt(4))
							 ;
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
	
	public Review detailReview(String resnum){
		Review schList = new Review();
	      String sql="SELECT * FROM RESTAURANT WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 double result2 = Math.round(rs.getDouble(3) * 10) / 10.0;
	        	 schList = new Review(
	        			 rs.getString(1),
	        			 rs.getString(2),
			        	 rs.getString(3),
			        	 result2,
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7))
							 ;
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

	public Menu StoreMenu(String resnum){
		Menu schList = new Menu();
	      String sql="SELECT * FROM menu WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new Menu(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getString(4),
	        			 rs.getString(5))
							 ;
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

	public List<Review> userReview(String resnum){
		List<Review> schList = new ArrayList<Review>();
	      String sql="SELECT jr.*, NICKNAME FROM JJIM_USER ju, JJIM_REVIEW jr WHERE ju.USER_EMAIL = jr.USER_EMAIL AND resnum = ?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList.add(new Review(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getDouble(4),
	        			 rs.getString(5),
	        			 rs.getString(6),
	        			 rs.getString(7),
	        			 rs.getString(8)))
							 ;
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

	public Respick StoreRespick(String resnum){
		Respick schList = new Respick();
	      String sql="SELECT * FROM RESPICK r WHERE resnum=?";
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, resnum);
	         rs=pstmt.executeQuery();
	         while(rs.next()) {
	        	 schList = new Respick(
			        	 rs.getString(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5))
							 ;
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
}
