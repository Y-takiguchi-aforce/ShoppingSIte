package jp.co.aforce.beans;

//カート情報
public class ItemBean implements java.io.Serializable {
	private ProductInfoBean product;
	private String order_id;
	private String p_id;
	private String image;
	private String p_name;
	private int price;
	private int psc;
	private int shoukei;
	private String total; //BHB未実装のため
	
	public ProductInfoBean getProduct() {
		return product;
	}
	
	public String getOid() {
		return order_id;
	}
	
	public String getPid() {
		return p_id;
	}
	
	public String getImage(){
		return image;
	}
	
	public String getPname() {
		return p_name;
	}
	
	public int getPrice() {
		return price;
	}
	
	public int getPsc() {
		return psc;
	}
	
	public int getShoukei() {
		return shoukei;
	}
	
	public String getTotal() {
		return total;
	}
	
	public void setProduct(ProductInfoBean product) {
		this.product = product;
	}
	
	public void setOid(String order_id) {
		this.order_id = order_id;
	}
	
	public void setPid(String p_id) {
		this.p_id = p_id;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public void setPname(String p_name) {
		this.p_name = p_name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setPsc(int psc) {
		this.psc = psc;
	}
	
	public void setShoukei(int shoukei) {
		this.shoukei = shoukei;
	}
	
	public void setTotal(String total) {
		this.total = total;
	}
}
