package ymw.vo;

public class StoReview {
	private String resnum;
	private String res_name;
	private double sco;
	private int cnt;
	
	public StoReview() {
		// TODO Auto-generated constructor stub
	}

	public StoReview(String resnum, String res_name, double sco, int cnt) {
		this.resnum = resnum;
		this.res_name = res_name;
		this.sco = sco;
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
	
	
}
