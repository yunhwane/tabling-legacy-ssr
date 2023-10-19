package hjw;

import java.util.Date;

public class Restaurant {
	private String resnum;
	private String res_name;
	private String res_email;
	private String res_addresss;
	private String res_phonenum;
	private String res_img;
	private String business_hours;
	private String day_off;
	private String break_time;
	private String convenient;
	private String introduce;
	private int deposit;
	private Date enroll_date;
	private String enroll_dateS;
	private int wating;
	private int reservation;

	public Restaurant() {
		// TODO Auto-generated constructor stub
	}

	public String getResnum() {
		return resnum;
	}

	public void setResnum(String resnum) {
		this.resnum = resnum;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_email() {
		return res_email;
	}

	public void setRes_email(String res_email) {
		this.res_email = res_email;
	}

	public String getRes_addresss() {
		return res_addresss;
	}

	public void setRes_addresss(String res_addresss) {
		this.res_addresss = res_addresss;
	}

	public String getRes_phonenum() {
		return res_phonenum;
	}

	public void setRes_phonenum(String res_phonenum) {
		this.res_phonenum = res_phonenum;
	}

	public String getRes_img() {
		return res_img;
	}

	public void setRes_img(String res_img) {
		this.res_img = res_img;
	}

	public String getBusiness_hours() {
		return business_hours;
	}

	public void setBusiness_hours(String business_hours) {
		this.business_hours = business_hours;
	}

	public String getDay_off() {
		return day_off;
	}

	public void setDay_off(String day_off) {
		this.day_off = day_off;
	}

	public String getBreak_time() {
		return break_time;
	}

	public void setBreak_time(String break_time) {
		this.break_time = break_time;
	}

	public String getConvenient() {
		return convenient;
	}

	public void setConvenient(String convenient) {
		this.convenient = convenient;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getEnroll_dateS() {
		return enroll_dateS;
	}

	public void setEnroll_dateS(String enroll_date) {
		this.enroll_dateS = enroll_date;
	}

	public int getWating() {
		return wating;
	}

	public void setWating(int wating) {
		this.wating = wating;
	}

	public int getReservation() {
		return reservation;
	}

	public void setReservation(int reservation) {
		this.reservation = reservation;
	}

	public Restaurant(String resnum, String res_name) {
		this.resnum = resnum;
		this.res_name = res_name;
	}

	public Restaurant(String resnum, String res_name, String res_email, String res_addresss, String res_phonenum,
			String res_img, String business_hours, String day_off, String break_time, String convenient,
			String introduce, int deposit, String enroll_dateS, int wating, int reservation) {
		this.resnum = resnum;
		this.res_name = res_name;
		this.res_email = res_email;
		this.res_addresss = res_addresss;
		this.res_phonenum = res_phonenum;
		this.res_img = res_img;
		this.business_hours = business_hours;
		this.day_off = day_off;
		this.break_time = break_time;
		this.convenient = convenient;
		this.introduce = introduce;
		this.deposit = deposit;
		this.enroll_dateS = enroll_dateS;
		this.wating = wating;
		this.reservation = reservation;
	}

}
