package net.footer.db;

import java.sql.Timestamp;

public class footerBean {
	private int ni_num;
	private String ni_mem_num;
	private String ni_mem_nik;
	private String ni_category;
	private String ni_subject;
	private String ni_content;
	private Timestamp ni_date;
	public int getNi_num() {
		return ni_num;
	}
	public void setNi_num(int ni_num) {
		this.ni_num = ni_num;
	}
	public String getNi_mem_num() {
		return ni_mem_num;
	}
	public void setNi_mem_num(String nimnem_num) {
		this.ni_mem_num = ni_mem_num;
	}
	public String getNi_mem_nik() {
		return ni_mem_nik;
	}
	public void setNi_mem_nik(String ni_mem_nik) {
		this.ni_mem_nik = ni_mem_nik;
	}
	public String getNi_category() {
		return ni_category;
	}
	public void setNi_category(String ni_category) {
		this.ni_category = ni_category;
	}
	public String getNi_subject() {
		return ni_subject;
	}
	public void setNi_subject(String ni_subject) {
		this.ni_subject = ni_subject;
	}
	public String getNi_content() {
		return ni_content;
	}
	public void setNi_content(String ni_content) {
		this.ni_content = ni_content;
	}
	public Timestamp getNi_date() {
		return ni_date;
	}
	public void setNi_date(Timestamp ni_date) {
		this.ni_date = ni_date;
	}
	
}
