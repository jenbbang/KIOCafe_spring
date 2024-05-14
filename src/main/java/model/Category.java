package model;

public class Category {
	private int cnum;
	private String cname;
	private int cmenu;
	private String ctext;
	private int cprice;
	private int cqty;
	private String cpicture;
	private String cid;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCmenu() {
		return cmenu;
	}
	public void setCmenu(int cmenu) {
		this.cmenu = cmenu;
	}
	public String getCtext() {
		return ctext;
	}
	public void setCtext(String ctext) {
		this.ctext = ctext;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public int getCqty() {
		return cqty;
	}
	public void setCqty(int cqty) {
		this.cqty = cqty;
	}
	public String getCpicture() {
		return cpicture;
	}
	public void setCpicture(String cpicture) {
		this.cpicture = cpicture;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "Category [cnum=" + cnum + ", cname=" + cname + ", cmenu=" + cmenu + ", ctext=" + ctext + ", cprice="
				+ cprice + ", cqty=" + cqty + ", cpicture=" + cpicture + ", cid=" + cid + "]";
	}

	
	
	
}
