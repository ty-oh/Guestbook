package org.joonzis.mybatis;

import java.sql.Date;

public class GuestbookVo {
	private int idx;
	private String writer;
	private String email;
	private String pw;
	private String filename;
	private String title;
	private String content;
	private Date reg_date;
	
	public GuestbookVo() {}
	public GuestbookVo(int idx, String writer, String email, String pw, String filename, String title, String content,
			Date reg_date) {
		this.idx = idx;
		this.writer = writer;
		this.email = email;
		this.pw = pw;
		this.filename = filename;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}