package net.wtf.comm.db;


import java.util.Date;

public class CommentsBean {
	
	
	 private int  wtf_num ;  //댓글 넘버     
	 private String wtf_mem_num; 
	 private String wtf_mem_nik; 
	 private String wtf_content;  
	 private Date wtf_date;         
	 private int wtf_re_ref;   
	 private int wtf_re_seq;
	 private int wtf_fa_num; //게시글 넘버
	
	 
	 public int getWtf_num() {
		return wtf_num;
	}
	public void setWtf_num(int wtf_num) {
		this.wtf_num = wtf_num;
	}
	public String getWtf_mem_num() {
		return wtf_mem_num;
	}
	public void setWtf_mem_num(String wtf_mem_num) {
		this.wtf_mem_num = wtf_mem_num;
	}
	public String getWtf_mem_nik() {
		return wtf_mem_nik;
	}
	public void setWtf_mem_nik(String wtf_mem_nik) {
		this.wtf_mem_nik = wtf_mem_nik;
	}
	public String getWtf_content() {
		return wtf_content;
	}
	public void setWtf_content(String wtf_content) {
		this.wtf_content = wtf_content;
	}
	public Date getWtf_date() {
		return wtf_date;
	}
	public int getWtf_fa_num() {
		return wtf_fa_num;
	}
	public void setWtf_fa_num(int wtf_fa_num) {
		this.wtf_fa_num = wtf_fa_num;
	}
	public void setWtf_date(Date wtf_date) {
		this.wtf_date = wtf_date;
	}
	public int getWtf_re_ref() {
		return wtf_re_ref;
	}
	public void setWtf_re_ref(int wtf_re_ref) {
		this.wtf_re_ref = wtf_re_ref;
	}
	public int getWtf_re_seq() {
		return wtf_re_seq;
	}
	public void setWtf_re_seq(int wtf_re_seq) {
		this.wtf_re_seq = wtf_re_seq;
	}
}