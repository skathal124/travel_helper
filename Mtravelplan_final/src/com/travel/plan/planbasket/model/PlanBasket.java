package com.travel.plan.planbasket.model;

import java.io.Serializable;

// com.travel.plan.planbasket.model.PlanBasket
public class PlanBasket implements Serializable  {

	private int planseq;
	private String basketname;
	private String someday;
	private String id;
	public PlanBasket() {
		super();
	}
	public PlanBasket(int planseq, String basketname, String someday, String id) {
		super();
		this.planseq = planseq;
		this.basketname = basketname;
		this.someday = someday;
		this.id = id;
	}
	@Override
	public String toString() {
		return "PlanBasket [planseq=" + planseq + ", basketname=" + basketname + ", someday=" + someday + ", id=" + id
				+ "]";
	}
	public int getPlanseq() {
		return planseq;
	}
	public void setPlanseq(int planseq) {
		this.planseq = planseq;
	}
	public String getBasketname() {
		return basketname;
	}
	public void setBasketname(String basketname) {
		this.basketname = basketname;
	}
	public String getSomeday() {
		return someday;
	}
	public void setSomeday(String someday) {
		this.someday = someday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
