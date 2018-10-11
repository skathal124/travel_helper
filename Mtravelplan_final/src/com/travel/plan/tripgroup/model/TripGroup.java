package com.travel.plan.tripgroup.model;

import java.io.Serializable;

// com.travel.plan.tripgroup.model.TripGroup
public class TripGroup implements Serializable {
	
	private int tgseq;
	private int tseq;
	private String id;
	private int groupin;
	public TripGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TripGroup(int tgseq, int tseq, String id, int groupin) {
		super();
		this.tgseq = tgseq;
		this.tseq = tseq;
		this.id = id;
		this.groupin = groupin;
	}
	@Override
	public String toString() {
		return "TripGroup [tgseq=" + tgseq + ", tseq=" + tseq + ", id=" + id + ", groupin=" + groupin + "]";
	}
	public int getTgseq() {
		return tgseq;
	}
	public void setTgseq(int tgseq) {
		this.tgseq = tgseq;
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
	public int getGroupin() {
		return groupin;
	}
	public void setGroupin(int groupin) {
		this.groupin = groupin;
	}
}
