package ymw.vo;

public class SchList {
	private String resnum;
	private String res_name;
	private String res_address;
	private int wating;
	private int reservation;
	private String mcategory;
	private double sco;
	private int cnt;
	private String res_img;
	
	public SchList() {
		// TODO Auto-generated constructor stub
	}

	
	
	public SchList(String resnum, String res_name, String res_address, int wating, int reservation, String mcategory,
			double sco, int cnt, String res_img) {
		this.resnum = resnum;
		this.res_name = res_name;
		this.res_address = res_address;
		this.wating = wating;
		this.reservation = reservation;
		this.mcategory = mcategory;
		this.sco = sco;
		this.cnt = cnt;
		this.res_img = res_img;
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

	public String getRes_address() {
		return res_address;
	}

	public void setRes_address(String res_address) {
		this.res_address = res_address;
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

	public String getMcategory() {
		return mcategory;
	}

	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}

	public double getSco() {
		return sco;
	}

	public void setSco(double sco) {
		this.sco = sco;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRes_img() {
		return res_img;
	}
	public void setRes_img(String res_img) {
		this.res_img = res_img;
	}
	
	
	
}
