package jp.co.aforce.beans;

//商品情報
public class ProductInfoBean implements java.io.Serializable {
	
	private String p_id;
	private String p_name;
	private String image;
	private int price;
	private int stock;
	private String category_1;
	private String category_2;
	
	//getメソッド
	public String getPid() {
		return p_id;
	}
	
	public String getPname() {
		return p_name;
	}
	
	public String getImage() {
		return image;
	}
	public int getPrice() {
		return price;
	}
	
	public int getStock() {
		return stock;
	}
	
	public String getCategory1() {
		return category_1;
	}
	
	public String getCategory2() {
		return category_2;
	}
	
	//setメソッド
	
	public void setPid(String p_id) {
		this.p_id = p_id;
	}
	
	public void setPname(String p_name) {
		this.p_name = p_name;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public void setCategory1(String category_1) {
		this.category_1 = category_1;
	}
	
	public void setCategory2(String category_2) {
		this.category_2 = category_2;
	}

}
