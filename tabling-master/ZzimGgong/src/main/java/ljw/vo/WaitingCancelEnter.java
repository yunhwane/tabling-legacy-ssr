package ljw.vo;

import java.util.Date;

public class WaitingCancelEnter {
	

	private String resnum;
	private String userEmail;
	private Date wstarttime;
	private String wstarttimeS;
	private int waitingNum;
	private int waitingPerson;
	private String cancle;
	private String enterCheck;
	
	
	public WaitingCancelEnter() {
		
	}
	//취소하기(손님)
	public WaitingCancelEnter(String userEmail, String wstarttimeS) {
		this.userEmail = userEmail;
		this.wstarttimeS = wstarttimeS;
	}
	


	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getWstarttime() {
		return wstarttime;
	}
	public void setWstarttime(Date wstarttime) {
		this.wstarttime = wstarttime;
	}
	public String getWstarttimeS() {
		return wstarttimeS;
	}
	public void setWstarttimeS(String wstarttimeS) {
		this.wstarttimeS = wstarttimeS;
	}
	public int getWaitingNum() {
		return waitingNum;
	}
	public void setWaitingNum(int waitingNum) {
		this.waitingNum = waitingNum;
	}
	public int getWaitingPerson() {
		return waitingPerson;
	}
	public void setWaitingPerson(int waitingPerson) {
		this.waitingPerson = waitingPerson;
	}
	public String getCancle() {
		return cancle;
	}
	public void setCancle(String cancle) {
		this.cancle = cancle;
	}
	public String getEnterCheck() {
		return enterCheck;
	}
	public void setEnterCheck(String enterCheck) {
		this.enterCheck = enterCheck;
	}
	

	
}
