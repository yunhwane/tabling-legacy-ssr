package ljw.vo;

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
	
	private int rownum;
	
	public SchList() {
		// TODO Auto-generated constructor stub
	}

	
	
	//메인화면에 가게 출력
	public SchList(int rownum, String resnum, String res_img, String res_name, double sco, 
			String mcategory, String res_address, int cnt) {
		this.rownum = rownum;
		this.resnum = resnum;
		this.res_img = res_img;
		this.res_name = res_name;
		this.sco = sco;
		this.mcategory = mcategory;
		this.res_address = res_address;
		this.cnt = cnt;
		
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
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	
	
}
