package com.travel.plan.tripboard.model;

import java.io.Serializable;
import java.util.Date;
//com.travel.plan.tripboard.model.TripBoard
public class TripBoard implements Serializable {
	
	private int tbseq;
	private int tseq;
	private int replycount;
	private String id;
	private String title;
	private String content;
	private String filename;
	private Date wdate;
	private int readcount;

	public TripBoard() {
		super();
		// TODO Auto-generated constructor stub
	}


	public TripBoard(int tbseq, int tseq, int replycount, String id, String title, String content, String filename, Date wdate,
			int readcount) {
		super();
		this.tbseq = tbseq;
		this.tseq = tseq;
		this.replycount = replycount;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.wdate = wdate;
		this.readcount = readcount;

	}


	public TripBoard(String id, String title, String content, String filename) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}


	public TripBoard(int tbseq, int tseq, String id, String title, String content, String filename, Date wdate) {
		super();
		this.tbseq = tbseq;
		this.tseq = tseq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.wdate = wdate;
	}


	@Override
	public String toString() {
		return "TripBoard [tbseq=" + tbseq + ", tseq=" + tseq + ", id=" + id + ", title=" + title + ", content="
				+ content + ", filename=" + filename + ", wdate=" + wdate + ", readcount=" + readcount+ "]";
	}


	public int getTbseq() {
		return tbseq;
	}


	public void setTbseq(int tbseq) {
		this.tbseq = tbseq;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public Date getWdate() {
		return wdate;
	}


	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public int getReplycount() {
		return replycount;
	}


	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}


	
	

}
