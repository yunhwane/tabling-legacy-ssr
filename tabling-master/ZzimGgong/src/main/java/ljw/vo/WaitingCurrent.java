package ljw.vo;

import java.util.Date;

public class WaitingCurrent {
	// 주문현황
	private String resName;
	private String resPhoneNum;
	private String resAddress;
	private Date wstarttime;
	private String wstarttimeS;
	private int waitingNum;
	private int waitingPerson;
	private String cancle;
	private String enterCheck;
	private int rownum;
	private String userEmail;
	
	
	public WaitingCurrent() {
		
	}
	
	// 가게,신청정보 출력
	public WaitingCurrent(String resName, String resPhoneNum, String resAddress, Date wstarttime, int waitingNum, int waitingPerson, String cancle, String enterCheck ) {
		this.resName = resName;
		this.resPhoneNum = resPhoneNum;
		this.resAddress = resAddress;
		this.wstarttime = wstarttime;
		this.waitingNum = waitingNum;
		this.waitingPerson = waitingPerson;
		this.cancle = cancle;
		this.enterCheck = enterCheck;	
	}
	public WaitingCurrent(String userEmail) {
		this.userEmail = userEmail;
	}
	
	//실시간 입장순서
	public WaitingCurrent(int rownum, String userEmail) {
		this.rownum = rownum;
		this.userEmail = userEmail;
	}	
	public WaitingCurrent(int rownum) {
		this.rownum = rownum;
	}
	

	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResPhoneNum() {
		return resPhoneNum;
	}
	public void setResPhoneNum(String resPhoneNum) {
		this.resPhoneNum = resPhoneNum;
	}
	public String getResAddress() {
		return resAddress;
	}
	public void setResAddress(String resAddress) {
		this.resAddress = resAddress;
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
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	

}
