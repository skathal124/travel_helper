package com.travel.plan.triplike.model;

import java.io.Serializable;

//com.travel.plan.triplike.model.TripLike
public class TripLike implements Serializable {
	
	private int lseq;
	private int tseq;
	private String id;
	public TripLike() {
		super();
	}
	public TripLike(int lseq, int tseq, String id) {
		super();
		this.lseq = lseq;
		this.tseq = tseq;
		this.id = id;
	}
	@Override
	public String toString() {
		return "TripLike [lseq=" + lseq + ", tseq=" + tseq + ", id=" + id + "]";
	}
	public int getLseq() {
		return lseq;
	}
	public void setLseq(int lseq) {
		this.lseq = lseq;
	}
	public int getTseq() {
		return tseq;
	}
	public void setTseq(int tseq) {
		this.tseq = tseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
