package net.board.db;


import java.sql.Date;

public class BoardBean {
	private int fb_num;
	private int fb_mem_num;
	private String fb_mem_nik;
	private String fb_category;
	private String fb_subject;
	private String fb_content;
	private String fb_img;
	private int fb_sumlike;
	private int fb_readcount;
	private Date fb_date;
	
	public int getFb_num() {
		return fb_num;
	}
	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}
	public int getFb_mem_num() {
		return fb_mem_num;
	}
	public void setFb_mem_num(int fb_mem_num) {
		this.fb_mem_num = fb_mem_num;
	}
	public String getFb_mem_nik() {
		return fb_mem_nik;
	}
	public void setFb_mem_nik(String fb_mem_nik) {
		this.fb_mem_nik = fb_mem_nik;
	}
	public String getFb_category() {
		return fb_category;
	}
	public void setFb_category(String fb_category) {
		this.fb_category = fb_category;
	}
	public String getFb_subject() {
		return fb_subject;
	}
	public void setFb_subject(String fb_subject) {
		this.fb_subject = fb_subject;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getFb_img() {
		return fb_img;
	}
	public void setFb_img(String fb_img) {
		this.fb_img = fb_img;
	}
	public int getFb_sumlike() {
		return fb_sumlike;
	}
	public void setFb_sumlike(int fb_sumlike) {
		this.fb_sumlike = fb_sumlike;
	}
	public int getFb_readcount() {
		return fb_readcount;
	}
	public void setFb_readcount(int fb_readcount) {
		this.fb_readcount = fb_readcount;
	}
	public Date getFb_date() {
		return fb_date;
	}
	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}
}
