package com.travel.plan.tripboard.model;

import java.io.Serializable;

public class TripAlbum implements Serializable {

	private int seq;
	private int tseq;
	private String id;
	private String title;
	private String filename;
	private int downcount;
	private String regdate;

	public TripAlbum() {
		super();
	}

	public TripAlbum(int seq, int tseq, String id, String title, String filename, int downcount, String regdate) {
		super();
		this.seq = seq;
		this.tseq = tseq;
		this.id = id;
		this.title = title;
		this.filename = filename;
		this.downcount = downcount;
		this.regdate = regdate;
	}

	public TripAlbum(String id, String title, String filename) {
		super();
		this.id = id;
		this.title = title;
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "TripAlbum [seq=" + seq + ", tseq=" + tseq + ", id=" + id + ", title=" + title + ", content="
				+ ", filename=" + filename + ", readcount=" + ", downcount=" + downcount + ", regdate=" + regdate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int gettseq() {
		return tseq;
	}

	public void settseq(int tseq) {
		this.tseq = tseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
