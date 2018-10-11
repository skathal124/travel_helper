package com.travel.plan.tripboard.model;

public class TripPollSub {

	private int pollsubseq;
	private int tpseq;
	private int tseq;
	private String answer;
	private int acount;
	
	public TripPollSub() {
		super();
	}
	
	

	@Override
	public String toString() {
		return "TripPollSub [pollsubseq=" + pollsubseq + ", tpseq=" + tpseq + ", tseq=" + tseq + ", answer=" + answer
				+ ", acount=" + acount + "]";
	}



	public TripPollSub(int tpseq, int tseq, String answer, int acount) {
		super();
		this.tpseq = tpseq;
		this.tseq = tseq;
		this.answer = answer;
		this.acount = acount;
	}



	public TripPollSub(int pollsubseq, int tpseq, int tseq, String answer, int acount) {
		super();
		this.pollsubseq = pollsubseq;
		this.tpseq = tpseq;
		this.tseq = tseq;
		this.answer = answer;
		this.acount = acount;
	}



	public int getPollsubseq() {
		return pollsubseq;
	}

	public void setPollsubseq(int pollsubseq) {
		this.pollsubseq = pollsubseq;
	}

	public int getTpseq() {
		return tpseq;
	}

	public void setTpseq(int tpseq) {
		this.tpseq = tpseq;
	}

	public int getTseq() {
		return tseq;
	}

	public void setTseq(int tseq) {
		this.tseq = tseq;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}
	
	

}
