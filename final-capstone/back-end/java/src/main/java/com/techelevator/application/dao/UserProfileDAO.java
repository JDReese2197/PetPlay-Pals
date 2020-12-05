package com.techelevator.application.dao;

import java.util.List;

import com.techelevator.application.model.UserProfile;

public interface UserProfileDAO {
	
	//Create user profile
	public UserProfile createUserProfile(UserProfile newUserProfile);
	
	//Retrieve user profile -- get user profile by name
	public UserProfile getUserProfileByUsername(String username);
	
	//Update user profile
	public UserProfile updateUserProfile(UserProfile updatedUserProfile);
	
	//Delete user profile
	public void deleteUserProfile(UserProfile aUserProfile);
	
	//Get list of users
	public List<UserProfile> listOfAllProfiles();
	
	
}
