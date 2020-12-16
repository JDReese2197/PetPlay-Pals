package com.techelevator.application.model;

import java.sql.Date;
import java.sql.Time;

public class Playdate {
	
	private int playdateId;
	private int petPosterId;
	private int petBookerId;
	private String theDate;
	private String startTime;
	private String endTime;
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
	public String getTheDate() {
		return theDate;
	}
	public void setTheDate(String theDate) {
		this.theDate = theDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
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
