package ymw.vo;

public class Review {
	private String review_code;
	private String user_email;
	private String restaurant_num;
	private double star_sco;
	private String review_date;
	private String review_content;
	private String review_img;
	private String nickname;
	
	public Review(String review_code, String user_email, String restaurant_num, double star_sco, String review_date,
			String review_content, String review_img, String nickname) {
		this.review_code = review_code;
		this.user_email = user_email;
		this.restaurant_num = restaurant_num;
		this.star_sco = star_sco;
		this.review_date = review_date;
		this.review_content = review_content;
		this.review_img = review_img;
		this.nickname = nickname;
	}
	public Review() {
		// TODO Auto-generated constructor stub
	}
	public Review(String review_code, String user_email, String restaurant_num, double star_sco, String review_date,
			String review_content, String review_img) {
		this.review_code = review_code;
		this.user_email = user_email;
		this.restaurant_num = restaurant_num;
		this.star_sco = star_sco;
		this.review_date = review_date;
		this.review_content = review_content;
		this.review_img = review_img;
	}
	
	public Review(String restaurant_num) {
		this.restaurant_num = restaurant_num;
	}
	public String getReview_code() {
		return review_code;
	}
	public void setReview_code(String review_code) {
		this.review_code = review_code;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getRestaurant_num() {
		return restaurant_num;
	}
	public void setRestaurant_num(String restaurant_num) {
		this.restaurant_num = restaurant_num;
	}
	public double getStar_sco() {
		return star_sco;
	}
	public void setStar_sco(double star_sco) {
		this.star_sco = star_sco;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}
