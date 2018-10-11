package com.travel.plan.tripdaily.model;

import java.io.Serializable;
//com.travel.plan.tripdaily.model.TripDaily
public class TripDaily implements Serializable{

	private int tdnum;
	private String tdlat;
	private String tdlng;
	private String tdplace;
	private String tdwork;
	private String tddate;
	// 추가
	private int tdmoney;		// 돈
	private int tdseq;
	private int tseq;
	private int tcseq;
	private String tdstime;		// 시작시간
	private String tdetime;		// 끝시간
	public TripDaily() {
		super();
	}
	public TripDaily(int tdnum, String tdlat, String tdlng, String tdplace, String tdwork, String tddate, int tdmoney,
			int tdseq, int tseq, int tcseq, String tdstime, String tdetime) {
		super();
		this.tdnum = tdnum;
		this.tdlat = tdlat;
		this.tdlng = tdlng;
		this.tdplace = tdplace;
		this.tdwork = tdwork;
		this.tddate = tddate;
		this.tdmoney = tdmoney;
		this.tdseq = tdseq;
		this.tseq = tseq;
		this.tcseq = tcseq;
		this.tdstime = tdstime;
		this.tdetime = tdetime;
	}
	@Override
	public String toString() {
		return "TripDaily [tdnum=" + tdnum + ", tdlat=" + tdlat + ", tdlng=" + tdlng + ", tdplace=" + tdplace
				+ ", tdwork=" + tdwork + ", tddate=" + tddate + ", tdmoney=" + tdmoney + ", tdseq=" + tdseq + ", tseq="
				+ tseq + ", tcseq=" + tcseq + ", tdstime=" + tdstime + ", tdetime=" + tdetime + "]";
	}
	public int getTdnum() {
		return tdnum;
	}
	public void setTdnum(int tdnum) {
		this.tdnum = tdnum;
	}
	public String getTdlat() {
		return tdlat;
	}
	public void setTdlat(String tdlat) {
		this.tdlat = tdlat;
	}
	public String getTdlng() {
		return tdlng;
	}
	public void setTdlng(String tdlng) {
		this.tdlng = tdlng;
	}
	public String getTdplace() {
		return tdplace;
	}
	public void setTdplace(String tdplace) {
		this.tdplace = tdplace;
	}
	public String getTdwork() {
		return tdwork;
	}
	public void setTdwork(String tdwork) {
		this.tdwork = tdwork;
	}
	public String getTddate() {
		return tddate;
	}
	public void setTddate(String tddate) {
		this.tddate = tddate;
	}
	public int getTdmoney() {
		return tdmoney;
	}
	public void setTdmoney(int tdmoney) {
		this.tdmoney = tdmoney;
	}
	public int getTdseq() {
		return tdseq;
	}
	public void setTdseq(int tdseq) {
		this.tdseq = tdseq;
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
	public String getTdstime() {
		return tdstime;
	}
	public void setTdstime(String tdstime) {
		this.tdstime = tdstime;
	}
	public String getTdetime() {
		return tdetime;
	}
	public void setTdetime(String tdetime) {
		this.tdetime = tdetime;
	}
	
}
/*
{"marknum":1,"markerX":"37.50075507977441","markerY":"127.03690767288208","spacename":""
*/