package com.travel.plan.carlendar.help;

import java.io.Serializable;
import java.util.Calendar;

public class JiNaCal implements Serializable{
	private int year=-100;
	private int month=-100;
	private int day=-100;
	private int lastDay;
	private int dayOfweek;
	
	private int hour=0;
	private int min=0;
	
	Calendar cal=Calendar.getInstance();
	
	public JiNaCal() {
		
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
		this.month=month;
	}

	public void calculate(){
		if(month==0){
			this.year--;
			this.month=12;
		}else if(month==13){
			this.year++;
			this.month=1;
		}else if(month<0){
			year=cal.get(Calendar.YEAR);
			month=cal.get(Calendar.MONTH)+1;
			if(day<0){
				day=cal.get(Calendar.DATE);
			}
		}
		cal.set(this.year, this.month-1,1);
		dayOfweek=cal.get(Calendar.DAY_OF_WEEK);
		lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	public int getLastDay() {
		return lastDay;
	}

	public int getDayOfweek() {
		return dayOfweek;
	}

	@Override
	public String toString() {
		return "JiNaCal [year=" + year + ", month=" + month + ", lastDay="
				+ lastDay + ", dayOfweek=" + dayOfweek + ", cal=" + cal + "]";
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
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
