package com.travel.plan.basketdaily.model;

import java.io.Serializable;
//com.travel.plan.basketdaily.model.BasketDaily
public class BasketDaily implements Serializable{

	private int btdnum;
	private String btdlat;
	private String btdlng;
	private String btdplace;
	private String btdwork;
	private String btddate;
	// 추가
	private int btdmoney;		// 돈
	private int btdseq;
	private int tseq;
	private int tcseq;
	private String btdstime;		// 시작시간
	private String btdetime;		// 끝시간
	// 경로 바구니용 추가
	private int planseq;
	public BasketDaily() {
		super();
	}
	public BasketDaily(int btdnum, String btdlat, String btdlng, String btdplace, String btdwork, String btddate,
			int btdmoney, int btdseq, int tseq, int tcseq, String btdstime, String btdetime, int planseq) {
		super();
		this.btdnum = btdnum;
		this.btdlat = btdlat;
		this.btdlng = btdlng;
		this.btdplace = btdplace;
		this.btdwork = btdwork;
		this.btddate = btddate;
		this.btdmoney = btdmoney;
		this.btdseq = btdseq;
		this.tseq = tseq;
		this.tcseq = tcseq;
		this.btdstime = btdstime;
		this.btdetime = btdetime;
		this.planseq = planseq;
	}
	@Override
	public String toString() {
		return "BasketDaily [btdnum=" + btdnum + ", btdlat=" + btdlat + ", btdlng=" + btdlng + ", btdplace=" + btdplace
				+ ", btdwork=" + btdwork + ", btddate=" + btddate + ", btdmoney=" + btdmoney + ", btdseq=" + btdseq
				+ ", tseq=" + tseq + ", tcseq=" + tcseq + ", btdstime=" + btdstime + ", btdetime=" + btdetime
				+ ", planseq=" + planseq + "]";
	}
	public int getBtdnum() {
		return btdnum;
	}
	public void setBtdnum(int btdnum) {
		this.btdnum = btdnum;
	}
	public String getBtdlat() {
		return btdlat;
	}
	public void setBtdlat(String btdlat) {
		this.btdlat = btdlat;
	}
	public String getBtdlng() {
		return btdlng;
	}
	public void setBtdlng(String btdlng) {
		this.btdlng = btdlng;
	}
	public String getBtdplace() {
		return btdplace;
	}
	public void setBtdplace(String btdplace) {
		this.btdplace = btdplace;
	}
	public String getBtdwork() {
		return btdwork;
	}
	public void setBtdwork(String btdwork) {
		this.btdwork = btdwork;
	}
	public String getBtddate() {
		return btddate;
	}
	public void setBtddate(String btddate) {
		this.btddate = btddate;
	}
	public int getBtdmoney() {
		return btdmoney;
	}
	public void setBtdmoney(int btdmoney) {
		this.btdmoney = btdmoney;
	}
	public int getBtdseq() {
		return btdseq;
	}
	public void setBtdseq(int btdseq) {
		this.btdseq = btdseq;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public int getTcseq() {
		return tcseq;
	}
	public void setTcseq(int tcseq) {
		this.tcseq = tcseq;
	}
	public String getBtdstime() {
		return btdstime;
	}
	public void setBtdstime(String btdstime) {
		this.btdstime = btdstime;
	}
	public String getBtdetime() {
		return btdetime;
	}
	public void setBtdetime(String btdetime) {
		this.btdetime = btdetime;
	}
	public int getPlanseq() {
		return planseq;
	}
	public void setPlanseq(int planseq) {
		this.planseq = planseq;
	}
	
}
