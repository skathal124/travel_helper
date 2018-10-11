package com.travel.plan.tripboard.help;

import java.io.Serializable;

public class TripParam implements Serializable{
	private int seq;
	private int tseq;
	
	private String id;
	private String title;
	private String content;
	private String wdate;
	private String tname;
	private String sdate;
	private String edate;
	
	
	
	
	
 //0,1
	
	//private int readcount;
	//------------searching
	private String s_category;
	private String s_keyword;
	//------------paging 
	private int recordCountPerPage=8;
	private int pageNumber=0;
	
	private int start=1;
	private int end=10;

	public TripParam() {
		
	}

	

	public TripParam(int seq, String id, String title, String content, String wdate, String tname, String sdate,
			String edate, int tseq, String s_category, String s_keyword, int recordCountPerPage, int pageNumber,
			int start, int end) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.tname = tname;
		this.sdate = sdate;
		this.edate = edate;
		this.tseq = tseq;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}



	public TripParam(String id, String title, String content, String s_category,
			String s_keyword, int recordCountPerPage, int pageNumber,
			int start, int end) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	

	@Override
	public String toString() {
		return "TripBoardParam [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", tname=" + tname + ", sdate=" + sdate + ", edate=" + edate + ", tseq=" + tseq
				+ ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}



	public int getSeq() {
		return seq;
	}



	public void setSeq(int seq) {
		this.seq = seq;
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



	public String getWdate() {
		return wdate;
	}



	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



	public String getTname() {
		return tname;
	}



	public void setTname(String tname) {
		this.tname = tname;
	}



	public String getSdate() {
		return sdate;
	}



	public void setSdate(String sdate) {
		this.sdate = sdate;
	}



	public String getEdate() {
		return edate;
	}



	public void setEdate(String edate) {
		this.edate = edate;
	}



	public int getTseq() {
		return tseq;
	}



	public void setTseq(int tseq) {
		this.tseq = tseq;
	}



	public String getS_category() {
		return s_category;
	}



	public void setS_category(String s_category) {
		this.s_category = s_category;
	}



	public String getS_keyword() {
		return s_keyword;
	}



	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}



	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}



	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}



	public int getPageNumber() {
		return pageNumber;
	}



	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}



	public int getStart() {
		return start;
	}



	public void setStart(int start) {
		this.start = start;
	}



	public int getEnd() {
		return end;
	}



	public void setEnd(int end) {
		this.end = end;
	}

	

	
		
}
