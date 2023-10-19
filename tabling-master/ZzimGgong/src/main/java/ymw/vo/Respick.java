package ymw.vo;

public class Respick {
	private String resnum;
	private String mood;
	private String purpose;
	private String food_type;
	private String table_type;
	
	public Respick() {
		// TODO Auto-generated constructor stub
	}

	public Respick(String resnum, String mood, String purpose, String food_type, String table_type) {
		this.resnum = resnum;
		this.mood = mood;
		this.purpose = purpose;
		this.food_type = food_type;
		this.table_type = table_type;
	}

	public String getResnum() {
		return resnum;
	}

	public void setResnum(String resnum) {
		this.resnum = resnum;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public String getTable_type() {
		return table_type;
	}

	public void setTable_type(String table_type) {
		this.table_type = table_type;
	}
	
	
}
