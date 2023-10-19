package ljw.vo;
import java.util.Date;

public class Waiting {
	
		private String resnum;
		private String userEmail;
		private Date wstarttime;
		private String wstarttimeS;
		private int waitingNum;
		private int waitingPerson;
		private String cancle;
		private String enterCheck;
		private int countResnum; //대기예상시간 등


		public Waiting() {}

		// 신청전대기인원
		public Waiting(String resnum, int countResnum) {
			this.resnum = resnum;
			this.countResnum = countResnum;
		}
		// 신청전대기인원-쉬운버전
		public Waiting(int countResnum) {
			this.countResnum = countResnum;
		}
		
		
		// 신청하기
		public Waiting(String resnum, String userEmail, int waitingPerson, String cancle,
				String enterCheck) {
			this.resnum = resnum;
			this.userEmail = userEmail;
			this.waitingPerson = waitingPerson;
			this.cancle = cancle;
			this.enterCheck = enterCheck;
		}
		// 대기번호
		public Waiting(String resnum, String userEmail) {
			this.resnum = resnum;
			this.userEmail = userEmail;
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
		public int getCountResnum() {
			return countResnum;
		}
		public void setCountResnum(int countResnum) {
			this.countResnum = countResnum;
		}
		public String getWstarttimeS() {
			return wstarttimeS;
		}
		public void setWstarttimeS(String wstarttimeS) {
			this.wstarttimeS = wstarttimeS;
		}
		
	}
