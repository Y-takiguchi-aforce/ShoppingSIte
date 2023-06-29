package jp.co.aforce.beans;

//会員情報
public class MemberInfoBean implements java.io.Serializable {

	private String member_id;
	private String password;
	private String last_name;
	private String first_name;
	private String birth_year;
	private String birth_month;
	private String birth_day;
	private String address;
	private String phone;
	private String email;
	private String pay;
	private String method;
	
	//getメソッド
	public String getMemId() {
		return member_id;
	}
	
	public String getPw() {
		return password;
	}
	
	public String getLname() {
		return last_name;
	}
	
	public String getFname() {
		return first_name;
	}
	
	public String getByear() {
		return birth_year;
	}
	
	public String getBmonth() {
		return birth_month;
	}
	
	public String getBday() {
		return birth_day;
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
	
	//setメソッド
	public void setMemId(String member_id) {
		this.member_id = member_id;
	}
	
	public void setPw(String password) {
		this.password = password;
	}
	
	public void setLname(String last_name) {
		this.last_name = last_name;
	}
	
	public void setFname(String first_name) {
		this.first_name = first_name;
	}
	
	public void setByear(String birth_year) {
		this.birth_year = birth_year;
	}
	
	public void setBmonth(String birth_month) {
		this.birth_month = birth_month;
	}
	
	public void setBday(String birth_day) {
		this.birth_day = birth_day;
	}
	
	public void setAddress(String address) {
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