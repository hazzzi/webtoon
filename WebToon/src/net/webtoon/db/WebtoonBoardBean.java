package net.webtoon.db;

import java.sql.Date;

public class WebtoonBoardBean {
	private int wbb_web_num;
	private int wbb_bdnum;
	private String wbb_mem_num;
	private String wbb_mem_nik;
	private String wbb_comment;
	private int wbb_sumlike;
	private Date wbb_date;
	
	public int getWbb_web_num() {
		return wbb_web_num;
	}
	public void setWbb_web_num(int wbb_web_num) {
		this.wbb_web_num = wbb_web_num;
	}
	public int getWbb_bdnum() {
		return wbb_bdnum;
	}
	public void setWbb_bdnum(int wbb_bdnum) {
		this.wbb_bdnum = wbb_bdnum;
	}
	public String getWbb_mem_num() {
		return wbb_mem_num;
	}
	public void setWbb_mem_num(String wbb_mem_num) {
		this.wbb_mem_num = wbb_mem_num;
	}
	public String getWbb_mem_nik() {
		return wbb_mem_nik;
	}
	public void setWbb_mem_nik(String wbb_mem_nik) {
		this.wbb_mem_nik = wbb_mem_nik;
	}
	public String getWbb_comment() {
		return wbb_comment;
	}
	public void setWbb_comment(String wbb_comment) {
		this.wbb_comment = wbb_comment;
	}
	public int getWbb_sumlike() {
		return wbb_sumlike;
	}
	public void setWbb_sumlike(int wbb_sumlike) {
		this.wbb_sumlike = wbb_sumlike;
	}
	public Date getWbb_date() {
		return wbb_date;
	}
	public void setWbb_date(Date wbb_date) {
		this.wbb_date = wbb_date;
	}
	
}
