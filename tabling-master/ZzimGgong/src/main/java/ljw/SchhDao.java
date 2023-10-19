package ljw;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import ljw.vo.SchList;



public class SchhDao {
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	

	
	public List<SchList> SLMain(String selectBox){
		  
		  String arr = "별점높은순";
		  if(selectBox.equals("별점높은순")) arr="order by sco desc";
		  else if(selectBox.equals("리뷰많은순")) arr = "order by cnt desc";
		  System.out.println(selectBox);
		  List<SchList> schMList = new ArrayList<SchList>();
	      String sql="SELECT rownum, r.resnum, res_img, res_name, NVL(rev.sco, 0) AS sco, "
	      		+ "mCategory, "
	      		+ "res_addresss, NVL(rev.cnt,0) AS cnt\r\n"
	      		+ "FROM RESTAURANT r, menu m, (	SELECT RESNUM, avg(STAR_SCO) sco, "
	      		+ "count(review_content) cnt \r\n"
	      		+ "FROM jjim_review GROUP BY RESNUM   ) rev\r\n"
	      		+ "WHERE r.RESNUM = m.RESNUM AND r.resnum=rev.resnum(+)\r\n"
	      		+ "AND rownum <=6";
	      sql += arr;
	      try {
	         con=DB.con();
	         pstmt = con.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         
	         while(rs.next()) {
					// select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
					// 맞게 rs.get타입("컬럼명") 지정하여야 한다.
	        	 double result2 = Math.round(rs.getDouble(5) * 10) / 10.0;
	        	 schMList.add(new SchList(
	        			 rs.getInt(1),
	        			 rs.getString(2),
	        			 rs.getString(3),
	        			 rs.getString(4),
	        			 result2,
	        			 rs.getString(6),
	        			 rs.getString(7),
	        			 rs.getInt(8)
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
	      
	      return schMList;
	   }
	

	

}
