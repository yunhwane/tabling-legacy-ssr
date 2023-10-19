package hjw;

import java.util.Date;

public class WaitingStore {
	private int rownum;
	private String userEmail;
	private String nickname;
	private Date wstarttime;
	private String wstarttimeS;
	private int waitingPerson;
	private int waitingNum;
	private String resnum;
	
	public WaitingStore() {
		// TODO Auto-generated constructor stub
	}
	
	//신청인정보 출력
	public WaitingStore(int rownum, String userEmail, String nickname, Date wstarttime, int waitingPerson,
			int waitingNum) {
		this.rownum = rownum;
		this.userEmail = userEmail;
		this.nickname = nickname;
		this.wstarttime = wstarttime;
		this.waitingPerson = waitingPerson;
		this.waitingNum = waitingNum;
	}
	//신청인 정보 출력
	public WaitingStore(String resnum) {
		this.resnum = resnum;
	}
	
	//입장취소/입장완료
	public WaitingStore(String userEmail, String wstarttimeS, String resnum) {
		this.userEmail = userEmail;
		this.resnum = resnum;
		this.wstarttimeS = wstarttimeS;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getWaitingPerson() {
		return waitingPerson;
	}

	public void setWaitingPerson(int waitingPerson) {
		this.waitingPerson = waitingPerson;
	}

	public int getWaitingNum() {
		return waitingNum;
	}

	public void setWaitingNum(int waitingNum) {
		this.waitingNum = waitingNum;
	}

	public String getResnum() {
		return resnum;
	}

	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	
	
	
	
	
}
