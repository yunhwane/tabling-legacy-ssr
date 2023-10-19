package jyh.model;

public class reviewDTO {
	private int rnum;
	private String email;
	private String resName;
	private String resnum;
	private int starScore;
	private String reviewDate;
	private String content;
	private String reviewImg;
	/**
	 * @param rnum
	 * @param email
	 * @param resnum
	 * @param starScore
	 * @param reviewDate
	 * @param content
	 * @param reviewImg
	 */
	
	public reviewDTO(int rnum,String resName,String resnum,String reviewDate,int starScore, String content,
			String reviewImg) {
		this.rnum = rnum;
		this.resName = resName;
		this.resnum = resnum;
		this.reviewDate = reviewDate;
		this.starScore = starScore;
		this.content = content;
		this.reviewImg = reviewImg;
	}
	
	/**
	 * 
	 */
	public reviewDTO() {
		super();
	}

	/**
	 * @param resName
	 * @param starScore
	 * @param reviewDate
	 * @param content
	 * @param reviewImg
	 */
	
	public int getRnum() {
		return rnum;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getEmail() {
		return email;
	}
	public String getResnum() {
		return resnum;
	}
	public int getStarScore() {
		return starScore;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public String getContent() {
		return content;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	
	
}
