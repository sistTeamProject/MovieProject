package com.sist.vo;
/*
 * MNO               NUMBER        
CNO               NUMBER        
TITLE             VARCHAR2(500) 
GRADE             VARCHAR2(50)  
RESERVE           VARCHAR2(50)  
GENRE             VARCHAR2(100) 
TIME              VARCHAR2(10)  
REGDATE           VARCHAR2(100) 
DIRECTOR          VARCHAR2(100) 
ACTOR             VARCHAR2(300) 
SHOWUSER          NUMBER        
STORY             CLOB          
NATION            VARCHAR2(100) 
KEY               VARCHAR2(100) 
ENGTITLE          VARCHAR2(200) 
POSTER            VARCHAR2(400) 
CODE     NOT NULL VARCHAR2(20)
 */
public class MovieVO {
	private int mno,cno,showUser;
	private String title,grade,reserve,genre,time,regdate,director,actor,story,nation,key,engtitle,poster,code;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getShowUser() {
		return showUser;
	}
	public void setShowUser(int showUser) {
		this.showUser = showUser;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getReserve() {
		return reserve;
	}
	public void setReserve(String reserve) {
		this.reserve = reserve;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getEngtitle() {
		return engtitle;
	}
	public void setEngtitle(String engtitle) {
		this.engtitle = engtitle;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}





