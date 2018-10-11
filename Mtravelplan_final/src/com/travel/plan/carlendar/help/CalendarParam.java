package com.travel.plan.carlendar.help;

import java.io.Serializable;

public class CalendarParam implements Serializable {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;    //201509161530
	private String regdate;
	
	private int year;
	private int month;
	private int day;
	
	private int hour;
	private int min;
	
	public CalendarParam() {
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "CalendarParam [seq=" + seq + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", wdate=" + wdate + ", regdate="
				+ regdate + ", year=" + year + ", month=" + month + ", day="
				+ day + "]";
	}
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	
}
