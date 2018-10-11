package com.travel.plan.trip.model;


//com.travel.plan.trip.model.Trip
import java.io.Serializable;

public class Trip implements Serializable {
	
	private int tseq;
	private String tname;
	private String sdate;
	private String edate;
	private String id;
	private String filename;
	
	public Trip() {
		super();
	}

	public Trip(int tseq, String tname, String sdate, String edate, String id, String filename) {
		super();
		this.tseq = tseq;
		this.tname = tname;
		this.sdate = sdate;
		this.edate = edate;
		this.id = id;
		this.filename = filename;
	}

	public Trip(String tname, String sdate, String edate, String id, String filename) {
		super();
		this.tname = tname;
		this.sdate = sdate;
		this.edate = edate;
		this.id = id;
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "Trip [tseq=" + tseq + ", tname=" + tname + ", sdate=" + sdate + ", edate=" + edate + ", id=" + id + "]";
	}

	public int getTseq() {
		return tseq;
	}

	public void setTseq(int tseq) {
		this.tseq = tseq;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
	
}
