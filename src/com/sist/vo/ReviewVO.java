package com.sist.vo;

import java.util.*;

/*
  			<REVIEW DATA TABLE>
		 이름       널?       유형             
		-------- -------- -------------- 
		REVIEWCD NOT NULL NUMBER         
		RATING   NOT NULL NUMBER(3,1)    
		REGDATE           DATE           
		CONTENTS NOT NULL VARCHAR2(3000) 
		SPOIL    NOT NULL CHAR(1)        
		P_PROD            VARCHAR2(20)   
		P_PERF            VARCHAR2(20)   
		P_STORY           VARCHAR2(20)   
		P_VISUAL          VARCHAR2(20)   
		P_OST             VARCHAR2(20)   
		SATIS             VARCHAR2(20)   
		LIKES             VARCHAR2(20)   
		DISLIKE           VARCHAR2(20)       
		MNO               NUMBER    
		    
		ID                NUMBER  
		
		TITLE             VARCHAR2(500)
		
 */

public class ReviewVO {
	
	private int reviewCD, mno;
	private double rating;
	private Date regdate;
	private String contents, spoil, id,
				   likes, dislike, satis,
				   p_prod, p_perf, p_story,
				   p_visual, p_ost, title;
	
	public int getReviewCD() {
		return reviewCD;
	}
	public void setReviewCD(int reviewCD) {
		this.reviewCD = reviewCD;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getSpoil() {
		return spoil;
	}
	public void setSpoil(String spoil) {
		this.spoil = spoil;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	public String getDislike() {
		return dislike;
	}
	public void setDislike(String dislike) {
		this.dislike = dislike;
	}
	public String getSatis() {
		return satis;
	}
	public void setSatis(String satis) {
		this.satis = satis;
	}
	public String getP_prod() {
		return p_prod;
	}
	public void setP_prod(String p_prod) {
		this.p_prod = p_prod;
	}
	public String getP_perf() {
		return p_perf;
	}
	public void setP_perf(String p_perf) {
		this.p_perf = p_perf;
	}
	public String getP_story() {
		return p_story;
	}
	public void setP_story(String p_story) {
		this.p_story = p_story;
	}
	public String getP_visual() {
		return p_visual;
	}
	public void setP_visual(String p_visual) {
		this.p_visual = p_visual;
	}
	public String getP_ost() {
		return p_ost;
	}
	public void setP_ost(String p_ost) {
		this.p_ost = p_ost;
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
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
}