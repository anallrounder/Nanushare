package com.share.nanu.VO;

import lombok.ToString;

@ToString
public class StatsVO {

	private long day;
	private long week;
	private long month;
	private long year;

	public StatsVO() {
		super();
	}

	public StatsVO(long day, long week, long month, long year) {
		super();
		this.day = day;
		this.week = week;
		this.month = month;
		this.year = year;
	}

	public long getDay() {
		return day;
	}

	public void setDay(long day) {
		this.day = day;
	}

	public long getWeek() {
		return week;
	}

	public void setWeek(long week) {
		this.week = week;
	}

	public long getMonth() {
		return month;
	}

	public void setMonth(long month) {
		this.month = month;
	}

	public long getYear() {
		return year;
	}

	public void setYear(long year) {
		this.year = year;
	}

}
