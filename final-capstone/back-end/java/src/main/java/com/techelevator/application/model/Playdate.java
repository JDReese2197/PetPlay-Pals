package com.techelevator.application.model;

import java.sql.Date;
import java.sql.Time;

public class Playdate {
	
	private int playdateId;
	private int petPosterId;
	private int petBookerId;
	private Date theDate;
	private Time startTime;
	private Time endTime;
	private String location;
	private String details;
	private double lat;
	private double lng;
	private String userMessage;
	
	public int getPlaydateId() {
		return playdateId;
	}
	public void setPlaydateId(int playdateId) {
		this.playdateId = playdateId;
	}
	public int getPetPosterId() {
		return petPosterId;
	}
	public void setPetPosterId(int postPosterId) {
		this.petPosterId = postPosterId;
	}
	public int getPetBookerId() {
		return petBookerId;
	}
	public void setPetBookerId(int petBookerId) {
		this.petBookerId = petBookerId;
	}
	public Date getTheDate() {
		return theDate;
	}
	public void setTheDate(Date theDate) {
		this.theDate = theDate;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	public double getLat() {
		return this.lat;
	}
	public double getLng() {
		return this.lng;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getUserMessage() {
		return userMessage;
	}
	public void setUserMessage(String userMessage) {
		this.userMessage = userMessage;
	}
	
}
