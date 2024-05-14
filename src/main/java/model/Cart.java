package model;

public class Cart {
	private int dnum;
	private String dname;
	private int dprice;
	private int dqty;
	private int dtotal;
	private String dpicture;
	private String did;
	private String dpay;
	
	public String getDpay() {
		return dpay;
	}
	public void setDpay(String dpay) {
		this.dpay = dpay;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}
	public int getDqty() {
		return dqty;
	}
	public void setDqty(int dqty) {
		this.dqty = dqty;
	}
	public int getDtotal() {
		return this.dprice*this.dqty;
	}
	
	public void setDtotal(int dtotal) {
		this.dtotal = dtotal;
	}
	
	public String getDpicture() {
		return dpicture;
	}
	public void setDpicture(String dpicture) {
		this.dpicture = dpicture;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	/*
	salePrice와 totalPrice의 변수 값을 초기화 해주는 메서드를 생성해줍니다. 
	이 두 변수의 값을 변경을 원할 경우 오직 이 메서드를 통해서만 가능하도록 하기 위해, 
	dtotal의 Setter 메서드 추가해주지 않았습니다.
	*/
	
	/*
	public void initTotal() {
		this.dtotal=this.dprice*this.dqty;
	}
	*/
	
	@Override
	public String toString() {
		return "Cart [dnum=" + dnum + ", dname=" + dname + ", dprice=" + dprice + ", dqty=" + dqty + ", dtotal="
				+ dtotal + ", dpicture=" + dpicture + ", did=" + did + ", dpay=" + dpay + "]";
	}
	 
	
	
}
