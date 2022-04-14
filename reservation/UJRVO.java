package com.tjoeun.vo;

public class UJRVO {
	
	private int rnum;
	private String rinfo;
	private int rp;
	private String ruid;
	private String rtime;
	private int total;


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
