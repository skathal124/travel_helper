package com.travel.plan.tripboard.model;
//com.travel.plan.tripboard.model.TripBoardReply
import java.io.Serializable;

public class TripBoardReply implements Serializable {
	
	private int tbrseq;
	private String id;
	private int tbseq;
	private String content;
	
	public TripBoardReply() {
		super();
	}

	public TripBoardReply(int tbrseq, String id, int tbseq, String content) {
		super();
		this.id = id;
		this.tbrseq = tbrseq;
		this.tbseq = tbseq;
		this.content = content;
	}

	@Override
	public String toString() {
		return "TripBoardReply [tbrseq=" + tbrseq + ", tbseq=" + tbseq + ", content=" + content + "]";
	}

	public int getTbrseq() {
		return tbrseq;
	}

	public void setTbrseq(int tbrseq) {
		this.tbrseq = tbrseq;
	}

	public int getTbseq() {
		return tbseq;
	}

	public void setTbseq(int tbseq) {
		this.tbseq = tbseq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	

}
