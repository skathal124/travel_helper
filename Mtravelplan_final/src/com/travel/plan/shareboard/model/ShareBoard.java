package com.travel.plan.shareboard.model;

//com.travel.plan.shareboard.model.ShareBoard
import java.io.Serializable;

public class ShareBoard implements Serializable {
	
	private int sbseq; 
	private String id;
	private int tseq;
	private String sbname;
	private String sbcity;
	private int totallike;
	
	private String skeyword;
	private String s_category;
	
//	private int recordCountPerPage=10;
//	private int pageNumber=0;
//	
//	private int start=1;
//	private int end=10;
	
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public ShareBoard(int sbseq, String id, int tseq, String sbname, String sbcity, int totallike, String s_category,
			String skeyword) {
		super();
		this.sbseq = sbseq;
		this.id = id;
		this.tseq = tseq;
		this.sbname = sbname;
		this.sbcity = sbcity;
		this.totallike = totallike;
		this.skeyword = skeyword;

	}
	public ShareBoard() {
		super();
	}
	public ShareBoard(int sbseq, String id, int tseq, String sbname, String sbcity, int totallike) {
		super();
		this.sbseq = sbseq;
		this.id = id;
		this.tseq = tseq;
		this.sbname = sbname;
		this.sbcity = sbcity;
		this.totallike = totallike;
	}
	
	
	@Override
	public String toString() {
		return "ShareBoard [sbseq=" + sbseq + ", id=" + id + ", tseq=" + tseq + ", sbname=" + sbname + ", sbcity="
				+ sbcity + ", totallike=" + totallike + "]";
	}
	

	public int getSbseq() {
		return sbseq;
	}
	public void setSbseq(int sbseq) {
		this.sbseq = sbseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getSbname() {
		return sbname;
	}
	public void setSbname(String sbname) {
		this.sbname = sbname;
	}
	public String getSbcity() {
		return sbcity;
	}
	public void setSbcity(String sbcity) {
		this.sbcity = sbcity;
	}
	public int getTotallike() {
		return totallike;
	}
	public void setTotallike(int totallike) {
		this.totallike = totallike;
	}

	public String getSkeyword() {
		return skeyword;
	}
	public void setSkeyword(String skeyword) {
		this.skeyword = skeyword;
	}

	
	
	
}
