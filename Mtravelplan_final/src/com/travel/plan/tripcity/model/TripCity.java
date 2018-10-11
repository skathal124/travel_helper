package com.travel.plan.tripcity.model;


//com.travel.plan.tripcity.model
import java.io.Serializable;
import java.util.Date;

public class TripCity implements Serializable {
	
	private int tcseq;
	private int tseq;
	private String cityname;
	private String citysdate;
	private String cityedate;
	private String citylat;
	private String citylng;
	
	private int tdplannum;
	public int getTdplannum() {
		return tdplannum;
	}
	public void setTdplannum(int tdplannum) {
		this.tdplannum = tdplannum;
	}
	@Override
	public String toString() {
		return "TripCity [tcseq=" + tcseq + ", tseq=" + tseq + ", cityname=" + cityname + ", citysdate=" + citysdate
				+ ", cityedate=" + cityedate + ", citylat=" + citylat + ", citylng=" + citylng + ", tdplannum="
				+ tdplannum + "]";
	}
	public TripCity() {
		super();
	}

	public TripCity(int tcseq, int tseq, String cityname, String citysdate, String cityedate, String citylat,
			String citylng) {
		super();
		this.tcseq = tcseq;
		this.tseq = tseq;
		this.cityname = cityname;
		this.citysdate = citysdate;
		this.cityedate = cityedate;
		this.citylat = citylat;
		this.citylng = citylng;
	}

	public int getTcseq() {
		return tcseq;
	}

	public void setTcseq(int tcseq) {
		this.tcseq = tcseq;
	}

	public int getTseq() {
		return tseq;
	}

	public void setTseq(int tseq) {
		this.tseq = tseq;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public String getCitysdate() {
		return citysdate;
	}

	public void setCitysdate(String citysdate) {
		this.citysdate = citysdate;
	}

	public String getCityedate() {
		return cityedate;
	}

	public void setCityedate(String cityedate) {
		this.cityedate = cityedate;
	}

	public String getCitylat() {
		return citylat;
	}

	public void setCitylat(String citylat) {
		this.citylat = citylat;
	}

	public String getCitylng() {
		return citylng;
	}

	public void setCitylng(String citylng) {
		this.citylng = citylng;
	}
	
}
