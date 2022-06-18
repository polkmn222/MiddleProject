package com.tjoeun.vo;

public class UJRVO {
	
	private int rnum;	// 예약 번호
	private String rinfo; // 예약 날짜
	private int rp;		// 예약 인원
	private String ruid; // 예약 아이디
	private String rtime; // 예약 시간
	private int total;	// 총 인원수


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	@Override
	public String toString() {
		return rnum + " " + rinfo + " " + ruid + " " + rtime+ " "+ rp;
	}
	
	
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getRinfo() {
		return rinfo;
	}
	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}
	public int getRp() {
		return rp;
	}
	public void setRp(int rp) {
		this.rp = rp;
	}
	public String getRuid() {
		return ruid;
	}
	public void setRuid(String ruid) {
		this.ruid = ruid;
	}
	

}
