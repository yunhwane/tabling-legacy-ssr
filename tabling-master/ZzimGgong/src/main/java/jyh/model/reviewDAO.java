package jyh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import ymw.dao.DB;

public class reviewDAO {
	private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    //전체 게시물 수 가져오기.
    
    public int selectCount(String email) {
    	int totalCount = 0;
    	
    	String query = "select count(*) from jjim_review where user_email = ?";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			totalCount = rs.getInt(1);
		}
    	} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return totalCount;   	
    }
    //페이지 처리한 메서드 
    public ArrayList<reviewDTO> reviewView(String email,int page) {
    	ArrayList<reviewDTO> list = new ArrayList<reviewDTO>();
    	int startNum = (page-1)*3+1;
    	int endNum = page*3;
    	//page-1*3
    	//int pages = (page-1)*3;
    	String query = "select *\n"
    			+ "from (select ROWNUM rm, a.*\n"
    			+ "from(\n"
    			+ "    select b.RES_NAME,a.resNum,a.review_date,a.star_sco,a.review_content,a.review_img from JJIM_REVIEW a,RESTAURANT b\n"
    			+ "    where a.resNum = b.RESNUM and user_email = ? order by a.review_date DESC\n"
    			+ "    ) a)\n"
    			+ "where rm between ? and ?";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
		pstmt.setString(1,email);
		pstmt.setInt(2, startNum);
		pstmt.setInt(3, endNum);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			list.add(new reviewDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6),rs.getString(7)));
		}
    	} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;   	
    }
    
}
