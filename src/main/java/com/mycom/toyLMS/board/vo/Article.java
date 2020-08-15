package com.mycom.toyLMS.board.vo;

import java.sql.Timestamp;

public class Article {

	public Article() {}

	private int bno;
	private String id;
	private String title;
	private String content;
	private Timestamp indate;
	private int hit;
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "Article [bno=" + bno + ", id=" + id + ", title=" + title + ", content=" + content + ", indate=" + indate
				+ "]";
	}

	
	
}
