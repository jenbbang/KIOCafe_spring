package model;

import java.util.Date;

public class Order {
	private int dnum;
	private String dname;
	private int dqty;
	private int dprice;
	private int dtotal;
	private String orderdate;
	private int delvery;
	private String did;
	private String daddress;
	private int dpaym;
	
	/**
	 * @return the dnum
	 */
	public int getDnum() {
		return dnum;
	}

	/**
	 * @param dnum the dnum to set
	 */
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}

	/**
	 * @return the dname
	 */
	public String getDname() {
		return dname;
	}

	/**
	 * @param dname the dname to set
	 */
	public void setDname(String dname) {
		this.dname = dname;
	}

	/**
	 * @return the dqty
	 */
	public int getDqty() {
		return dqty;
	}

	/**
	 * @param dqty the dqty to set
	 */
	public void setDqty(int dqty) {
		this.dqty = dqty;
	}

	/**
	 * @return the dprice
	 */
	public int getDprice() {
		return dprice;
	}

	/**
	 * @param dprice the dprice to set
	 */
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}

	/**
	 * @return the dtotal
	 */
	public int getDtotal() {
		return dtotal;
	}

	/**
	 * @param dtotal the dtotal to set
	 */
	public void setDtotal(int dtotal) {
		this.dtotal = dtotal;
	}

	/**
	 * @return the orderdate
	 */
	public String getOrderdate() {
		return orderdate;
	}

	/**
	 * @param orderdate the orderdate to set
	 */
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	/**
	 * @return the delvery
	 */
	public int getDelvery() {
		return delvery;
	}

	/**
	 * @param delvery the delvery to set
	 */
	public void setDelvery(int delvery) {
		this.delvery = delvery;
	}

	/**
	 * @return the did
	 */
	public String getDid() {
		return did;
	}

	/**
	 * @param did the did to set
	 */
	public void setDid(String did) {
		this.did = did;
	}

	/**
	 * @return the daddress
	 */
	public String getDaddress() {
		return daddress;
	}

	/**
	 * @param daddress the daddress to set
	 */
	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}

	/**
	 * @return the dpaym
	 */
	public int getDpaym() {
		return dpaym;
	}

	/**
	 * @param dpaym the dpaym to set
	 */
	public void setDpaym(int dpaym) {
		this.dpaym = dpaym;
	}

	@Override
	public String toString() {
		return "Order [dnum=" + dnum + ", dname=" + dname + ", dqty=" + dqty + ", dprice=" + dprice + ", dtotal="
				+ dtotal + ", orderdate=" + orderdate + ", delvery=" + delvery + ", did=" + did + ", daddress="
				+ daddress + ", dpaym=" + dpaym + "]";
	}
	
	
}
