package jyh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ymw.dao.DB;



public class memberDAO {
	private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    //일반회원등록 Dao
    public boolean SignUp(memberDTO ins) {
    	String query = "insert into jjim_user values(?,?,1,?,?,?,0,0)";
    	boolean sus = false;
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getPw());
    		pstmt.setString(3,ins.getNickName());
    		pstmt.setString(4,ins.getPhoneNum());
    		pstmt.setString(5,ins.getAddress());
    		suIdx = pstmt.executeUpdate();
    		if(suIdx>0) {
    			sus = true;
    		}else {
    			sus = false;
    		}
    		con.commit();
            pstmt.close();
            con.close();
    	}catch (SQLException e) {
            try {
                con.rollback();
            }catch (SQLException e1) {
                System.out.println("rollback 에러:" + e.getMessage());
            }
            
        } catch (Exception e) {
        	suIdx = -2;
            System.out.println(e.getMessage());
        }
    	return sus;
    }
    //세션 설정 
    public memberDTO sessionNick(String email) {
		memberDTO userInfo = null;
		try {
			String query = "select user_email,NICKNAME,no_show from jjim_user where user_email = ?";
			con = DB.con();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1,email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userInfo = new memberDTO(rs.getString(1),rs.getString(2),rs.getInt(3));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return userInfo;
	}
    // 로그인 성공 ? 실패 체크 
    public int loginCheck(String email, String userPass) {
		try {
			String query = "select user_pw from jjim_user where user_email = ?";
			con = DB.con();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPass)) {
					return 1;
				} else {
					return 0;
				}		
			}
		return -1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return -2;

	}
    //계정 체크 
    public String IdCheck(String useremail) {
    	String result = "";
    	String email = "";
    	int authNum=0;
    	String query = "select user_email,idauth from jjim_user where user_email = ?";
    	try {
    	con = DB.con();
    	pstmt = con.prepareStatement(query);
        pstmt.setString(1, useremail);
        rs = pstmt.executeQuery();
        while(rs.next()) {
        	email = rs.getString(1);
        	authNum = rs.getInt(2);
        } 
        if(email.equals(useremail)&& authNum==1) {
			result = "kakao_auth";
	    }else if(email.equals(useremail)&& authNum==2) {
			result = "naver_auth";
	    }else if(email.equals(useremail)&& authNum==0) {
			result = "zzim_auth"; 
	    }else {
	    	result="no_auth";
	    }
        
             
    }catch (SQLException e) {
        e.printStackTrace();   
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        DB.close(rs, pstmt, con);
        }
    	return result;
    }
    //계정 삭제 
    public int deleteAccount(String email) {
		int num = 0;
		String query = "delete from JJIM_USER where user_email = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
		    num = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return num;
	}
  //비밀번호변경
	public int passUpdate(String newpass, String email) {
		int num = 0;
		String query = "update jjim_user set user_pw = ? where user_email = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newpass);
			pstmt.setString(2, email);
			num = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return num;
	}
	public int upDateUser(String nickname,String pnum,String address,String email) {
		int num = 0;
		String query = "update jjim_user set nickname = ?, phone_number = ?,user_address=?\n"
				+ "where user_email = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,nickname);
			pstmt.setString(2,pnum);
			pstmt.setString(3,address);
			pstmt.setString(4,email);
			num = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DB.close(rs, pstmt, con);
		}
		return num;
	}
    public int kakaoSignUp(memberDTO ins) {
    	String query = "insert into jjim_user values(?,NULL,1,?,NULL,NULL,0,1)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);	
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getNickName());
    		suIdx = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
    	}catch (SQLException e) {
    		suIdx = -1;
            try {
                con.rollback();
            }catch (SQLException e1) {
                System.out.println("rollback 에러:" + e.getMessage());
            }
            
        } catch (Exception e) {
        	suIdx = -2;
            System.out.println(e.getMessage());
        }
    	return suIdx;
    }
    public int naverSignUp(memberDTO ins) {
    	String query = "insert into jjim_user values(?,NULL,1,?,NULL,NULL,0,2)";
    	int suIdx = 0;
    	try {
    		con = DB.con();
    		con.setAutoCommit(false);
    		pstmt = con.prepareStatement(query);	
    		pstmt.setString(1,ins.getEmail());
    		pstmt.setString(2,ins.getNickName());
    		suIdx = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
    	}catch (SQLException e) {
    		suIdx = -1;
            try {
                con.rollback();
            }catch (SQLException e1) {
                System.out.println("rollback 에러:" + e.getMessage());
            }
            
        } catch (Exception e) {
        	suIdx = -2;
            System.out.println(e.getMessage());
        }
    	return suIdx;
    }
    public int kakaoTokenInsert(String userEmail,String id) {
		int a = 0;
		try {
			String query = "insert into access_Token values(?,null,?)";
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userEmail);
			pstmt.setString(2,id);
			rs = pstmt.executeQuery();
			a = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
		} catch (SQLException e) {
			a = -1;
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			a = -2;
		} finally {
			DB.close(rs, pstmt, con);
		}
		return a;
	}
    public int naverTokenInsert(String userEmail,String id) {
		int a = 0;
		try {
			String query = "insert into access_Token values(?,?,null)";
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,userEmail);
			pstmt.setString(2,id);
			rs = pstmt.executeQuery();
			a = pstmt.executeUpdate();
    		con.commit();
            pstmt.close();
            con.close();
		} catch (SQLException e) {
			a = -1;
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			a = -2;
		} finally {
			DB.close(rs, pstmt, con);
		}
		return a;
	}
    public memberDTO selectUser(String email) {  	
    	String query = "select * from jjim_user where user_email = ?";
    	memberDTO userInfo = null;
    	try {
			con = DB.con();
			pstmt = con.prepareStatement(query);  
			pstmt.setString(1,email);
	        rs = pstmt.executeQuery();
	        while(rs.next()) {
	        	userInfo = new memberDTO(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),
	        			rs.getInt(7),rs.getInt(8));
	        }
    		
		} catch (SQLException e) {
		
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			DB.close(rs, pstmt, con);
		}
		return userInfo;
	}
      
    
}
