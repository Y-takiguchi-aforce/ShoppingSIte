package jp.co.aforce.beans;


//未実装
public class BuyHisBean implements java.io.Serializable {
	private String order_id;
	private String p_id;
	private String product_name;
	private int price;
	private int psc;
	private int total;
	private String member_id;
	private String last_name;
	private String first_name;
	private String address;
	private String phone;
	private String email;
	private String pay;
	private String method;
	
	//get
	
	public String getOid() {
		return order_id;
	}
	
	public String getPid() {
		return p_id;
	}
	
	public String getPname() {
		return product_name;
	}
	
	public int getPrice() {
		return price;
	}
	
	public int getPsc() {
		return psc;
	}
	
	public int getTotal() {
		return total;
	}
	
	public String getMemId() {
		return member_id;
	}
	
	public String getLname() {
		return last_name;
	}
	
	public String getFname() {
		return first_name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPay() {
		return pay;
	}
	
	public String getMethod() {
		return method;
	}
	
	//set
	
	public void setOid(String order_id) {
		this.order_id = order_id;
	}
	
	public void setPid(String p_id) {
		this.p_id = p_id;
	}
	public void setPname(String product_name) {
		this.product_name = product_name;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public void setPsc(int psc) {
		this.psc = psc;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	
	public void setMemId(String member_id) {
		this.member_id = member_id;
	}
	
	public void setLname(String last_name) {
		this.last_name = last_name;
	}
	
	public void setFname(String first_name) {
		this.first_name = first_name;
	}
	
	public void setAddredd(String address) {
		this.address = address;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setPay(String pay) {
		this.pay = pay;
	}
	
	public void setMethod(String method) {
		this.method = method;
	}
}
