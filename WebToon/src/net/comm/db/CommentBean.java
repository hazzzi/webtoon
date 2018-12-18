package net.comm.db;

import java.util.Date;

public class CommentBean {
    private int  fbcom_fb_num;       
    private String fbcom_mem_num; 
    private String fbcom_mem_nik; 
    private String fbcom_content;  
    private Date fbcom_date;         
    private int fbcom_re_ref;   
    private int fbcom_re_seq;
    private int fbcom_bdnum; 
    
    private int fbcom_count;
   
   //댓글 갯수
    public int getFbcom_count() {
      return fbcom_count;
   }
   public void setFbcom_count(int fbcom_count) {
      this.fbcom_count = fbcom_count;
   }
   //댓글 갯수
   
   public int getFbcom_bdnum() {
      return fbcom_bdnum;
   }
   public void setFbcom_bdnum(int fbcom_bdnum) {
      this.fbcom_bdnum = fbcom_bdnum;
   }
   public int getFbcom_fb_num() {
      return fbcom_fb_num;
   }
   public void setFbcom_fb_num(int fbcom_fb_num) {
      this.fbcom_fb_num = fbcom_fb_num;
   }
   public String getFbcom_mem_num() {
      return fbcom_mem_num;
   }
   public void setFbcom_mem_num(String fbcom_mem_num) {
      this.fbcom_mem_num = fbcom_mem_num;
   }
   public String getFbcom_mem_nik() {
      return fbcom_mem_nik;
   }
   public void setFbcom_mem_nik(String fbcom_mem_nik) {
      this.fbcom_mem_nik = fbcom_mem_nik;
   }
   public String getFbcom_content() {
      return fbcom_content;
   }
   public void setFbcom_content(String fbcom_content) {
      this.fbcom_content = fbcom_content;
   }
   public Date getFbcom_date() {
      return fbcom_date;
   }
   public void setFbcom_date(Date fbcom_date) {
      this.fbcom_date = fbcom_date;
   }
   public int getFbcom_re_ref() {
      return fbcom_re_ref;
   }
   public void setFbcom_re_ref(int fbcom_re_ref) {
      this.fbcom_re_ref = fbcom_re_ref;
   }
   public int getFbcom_re_seq() {
      return fbcom_re_seq;
   }
   public void setFbcom_re_seq(int fbcom_re_seq) {
      this.fbcom_re_seq = fbcom_re_seq;
   }
   
}