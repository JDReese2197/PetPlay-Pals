package com.techelevator.application.model;

public class Pet {
	
	private int petId;
	private String petName;
	private String petType;
	private int age;
	private String personalityType;
	
	public int getPetId() {
		return petId;
	}
	public void setPetId(int petId) {
		this.petId = petId;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPersonalityType() {
		return personalityType;
	}
	public void setPersonalityType(String personalityType) {
		this.personalityType = personalityType;
	}

}
