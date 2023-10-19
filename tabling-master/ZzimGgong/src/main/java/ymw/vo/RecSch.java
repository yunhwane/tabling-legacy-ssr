package ymw.vo;

public class RecSch {
	private String search_word;
	private String search_date;
	public RecSch() {
		// TODO Auto-generated constructor stub
	}
	public RecSch(String search_word, String search_date) {
		this.search_word = search_word;
		this.search_date = search_date;
	}
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getSearch_date() {
		return search_date;
	}
	public void setSearch_date(String search_date) {
		this.search_date = search_date;
	}
	
}
