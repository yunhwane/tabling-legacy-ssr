package hjw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


// hjw/ZzimDao.;
public class ZzimDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String resNumber;
	public  Restaurant login(Restaurant res){
		  	Restaurant resNum =null;
		  	String sql = "SELECT * FROM RESTAURANT WHERE resnum=?";
		  	System.out.println(res.getResnum());
		  	try {
			     con = DB.con();
			     pstmt = con.prepareStatement(sql);
			     pstmt.setString(1, res.getResnum()); //
			     rs = pstmt.executeQuery();
			     if(rs.next()) {
			    	 resNum = new Restaurant(
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
		        			 rs.getInt(12),
		        			 rs.getString(13),
		        			 rs.getInt(14),
		        			 rs.getInt(15)
			    	 );
			    	 System.out.println("로그인성공");
			     }
			 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
			  }catch (SQLException e) {
			     System.out.println("DB에러:"+e.getMessage());
			  }catch(Exception e) {
			     System.out.println("일반 에러:"+e.getMessage());
			  }finally {
			         DB.close(rs, pstmt, con);
			  } 
			      return resNum;
	}
	
	public  ResPick getPickInfo(ResPick pick){
	  	ResPick resNum =null;
	  	String sql = "SELECT * FROM RESPICK WHERE resnum=?";
	  	try {
		     con = DB.con();
		     pstmt = con.prepareStatement(sql);
		     pstmt.setString(1, pick.getResnum()); //
		     rs = pstmt.executeQuery();
		     if(rs.next()) {
		    	 resNum = new ResPick(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getString(4),
	        			 rs.getString(5)
		    	 );
		     }
		 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
		  }catch (SQLException e) {
		     System.out.println("DB에러:"+e.getMessage());
		  }catch(Exception e) {
		     System.out.println("일반 에러:"+e.getMessage());
		  }finally {
		         DB.close(rs, pstmt, con);
		  } 
		      return resNum;
	}
	public Menu getMenuInfo(Menu menu){
		Menu resNum =null;
	  	String sql = "SELECT * FROM MENU WHERE resnum=?";
	  	try {
		     con = DB.con();
		     pstmt = con.prepareStatement(sql);
		     pstmt.setString(1, menu.getResnum()); //
		     rs = pstmt.executeQuery();
		     if(rs.next()) {
		    	 resNum = new Menu(
	        			 rs.getString(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getString(4),
	        			 rs.getString(5)
		    	 );
		     }
		 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
		  }catch (SQLException e) {
		     System.out.println("DB에러:"+e.getMessage());
		  }catch(Exception e) {
		     System.out.println("일반 에러:"+e.getMessage());
		  }finally {
		         DB.close(rs, pstmt, con);
		  } 
		      return resNum;
	}
	public int updateRestaurant(Restaurant res){
	  	String sql = "UPDATE RESTAURANT\r\n"
	  			+ "SET RES_NAME =?, RES_EMAIL =?,RES_ADDRESSS =?,RES_PHONENUM =?, \r\n"
	  			+ "BUSINESS_HOURS =?, DAY_OFF =?, BREAK_TIME =?, CONVENIENT =?, INTRODUCE =?, DEPOSIT =?,"
	  			+ "WATING =?, RESERVATION =?\r\n"
	  			+ "WHERE RESNUM =?";
	  	int resSuccess = 0;
	  	try {
			con=DB.con();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,res.getRes_name());
			pstmt.setString(2,res.getRes_email());
			pstmt.setString(3,res.getRes_addresss());
			pstmt.setString(4,res.getRes_phonenum());
			pstmt.setString(5,res.getBusiness_hours());
			pstmt.setString(6,res.getDay_off());
			pstmt.setString(7,res.getBreak_time());
			pstmt.setString(8,res.getConvenient());
			pstmt.setString(9,res.getIntroduce());
			pstmt.setInt(10,res.getDeposit());
			pstmt.setInt(11,res.getWating());
			pstmt.setInt(12,res.getReservation());
			pstmt.setString(13,res.getResnum());
			resSuccess=pstmt.executeUpdate();
			 if (resSuccess>0) {
				System.out.println("가게정보가 변경되었습니다.");
			}
			con.commit();
		 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
		  }catch (SQLException e) {
		     System.out.println("DB에러:"+e.getMessage());
		  }catch(Exception e) {
		     System.out.println("일반 에러:"+e.getMessage());
		  }finally {
		         DB.close(rs, pstmt, con);
		  } 
	  	return resSuccess;
	}
	public int updateResPick(ResPick pick){
	  	String sql = "UPDATE RESPICK \r\n"
	  			+ "SET MOOD =?, PURPOSE =?, FOOD_TYPE =?, TABLE_TYPE =?\r\n"
	  			+ "WHERE RESNUM =?";
	  	int pickSuccess = 0;
	  	try {
			con=DB.con();
			con.setAutoCommit(false);
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,pick.getMood());
			pstmt.setString(2,pick.getPurpose());
			pstmt.setString(3,pick.getFood_type());
			pstmt.setString(4,pick.getTable_type());
			pstmt.setString(5,pick.getResnum());
			pickSuccess=pstmt.executeUpdate();
			 if (pickSuccess>0) {
				System.out.println("매장픽이 변경되었습니다.");
			}
			con.commit();
		 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
		  }catch (SQLException e) {
		     System.out.println("DB에러:"+e.getMessage());
		  }catch(Exception e) {
		     System.out.println("일반 에러:"+e.getMessage());
		  }finally {
		         DB.close(rs, pstmt, con);
		  } 
	  	return pickSuccess;
	}
}
