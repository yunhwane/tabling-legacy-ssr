package hjw;

public class Menu {
	private String resnum;
	private String mcategory;
	private String menuname;
	private String price;
	private String food_img;
	public Menu() {
		// TODO Auto-generated constructor stub
	}
	public Menu(String resnum, String mcategory, String menuname, String price, String food_img) {
		this.resnum = resnum;
		this.mcategory = mcategory;
		this.menuname = menuname;
		this.price = price;
		this.food_img = food_img;
	}
	public Menu(String mcategory, String menuname, String price, String food_img) {
		this.mcategory = mcategory;
		this.menuname = menuname;
		this.price = price;
		this.food_img = food_img;
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
	public String getFood_img() {
		return food_img;
	}
	public void setFood_img(String food_img) {
		this.food_img = food_img;
	}
	
}
