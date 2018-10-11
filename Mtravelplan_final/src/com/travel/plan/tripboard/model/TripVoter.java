package com.travel.plan.tripboard.model;

import java.util.Date;

public class TripVoter {

	private int voterseq;
	private int tpseq;
	private int pollsubseq;
	private int tseq;
	private String id;
	private Date regdate;
	
	public TripVoter() {
		super();
	}
	
	

	@Override
	public String toString() {
		return "TripVoter [voterseq=" + voterseq + ", tpseq=" + tpseq + ", pollsubseq=" + pollsubseq + ", tseq=" + tseq
				+ ", id=" + id + ", regdate=" + regdate + "]";
	}

	

	public TripVoter(int tpseq, int pollsubseq, String id) {
		super();
		this.tpseq = tpseq;
		this.pollsubseq = pollsubseq;
		this.id = id;
	}



	public TripVoter(int tpseq, int pollsubseq, int tseq, String id) {
		super();
		this.tpseq = tpseq;
		this.pollsubseq = pollsubseq;
		this.tseq = tseq;
		this.id = id;
	}



	public TripVoter(int voterseq, int tpseq, int pollsubseq, int tseq, String id) {
		super();
		this.voterseq = voterseq;
		this.tpseq = tpseq;
		this.pollsubseq = pollsubseq;
		this.tseq = tseq;
		this.id = id;
	}



	public TripVoter(int voterseq, int tpseq, int pollsubseq, int tseq, String id, Date regdate) {
		super();
		this.voterseq = voterseq;
		this.tpseq = tpseq;
		this.pollsubseq = pollsubseq;
		this.tseq = tseq;
		this.id = id;
		this.regdate = regdate;
	}



	public int getVoterseq() {
		return voterseq;
	}

	public void setVoterseq(int voterseq) {
		this.voterseq = voterseq;
	}

	public int getTpseq() {
		return tpseq;
	}

	public void setTpseq(int tpseq) {
		this.tpseq = tpseq;
	}

	public int getPollsubseq() {
		return pollsubseq;
	}

	public void setPollsubseq(int pollsubseq) {
		this.pollsubseq = pollsubseq;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
