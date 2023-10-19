package ymw.vo;

public class Menu {
	private String resnum;
	private String mcategory;
	private String menuname;
	private String price;
	private String food_image;
	public Menu() {
		// TODO Auto-generated constructor stub
	}
	public Menu(String resnum, String mcategory, String menuname, String price, String food_image) {
		this.resnum = resnum;
		this.mcategory = mcategory;
		this.menuname = menuname;
		this.price = price;
		this.food_image = food_image;
	}
	public String getResnum() {
		return resnum;
	}
	public void setResnum(String resnum) {
		this.resnum = resnum;
	}
	public String getMcategory() {
		return mcategory;
	}
	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getFood_image() {
		return food_image;
	}
	public void setFood_image(String food_image) {
		this.food_image = food_image;
	}
	
}
