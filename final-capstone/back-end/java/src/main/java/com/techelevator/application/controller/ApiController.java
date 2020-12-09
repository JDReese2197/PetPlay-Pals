/************************************************************************************************
 * Put your Application API Controllers here
 ************************************************************************************************/
package com.techelevator.application.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.application.jdbcdao.JDBCPetDAO;
import com.techelevator.application.jdbcdao.JDBCUserProfileDAO;
import com.techelevator.application.model.Pet;
import com.techelevator.application.model.UserProfile;

@RestController
@CrossOrigin
public class ApiController {
	
	private JDBCPetDAO petDAO;
	private JDBCUserProfileDAO userProfileDAO;
	
	public ApiController(JDBCPetDAO petDAO, JDBCUserProfileDAO userProfileDAO) {
		this.petDAO = petDAO;
		this.userProfileDAO = userProfileDAO;
	}
	
	@RequestMapping(path = "/register/profile", method=RequestMethod.POST)
	public UserProfile registerProfile(@RequestBody UserProfile userProfile) {
		return userProfileDAO.createUserProfile(userProfile);
	}
	
	@RequestMapping(path = "/update/profile", method=RequestMethod.PUT)
	public void updateUserProfile(@RequestBody UserProfile userProfile) {
		userProfileDAO.updateUserProfile(userProfile);
	}
	
	@RequestMapping(path = "/register/pet", method=RequestMethod.POST)
	public Pet registerPet(@RequestBody Pet petProfile) {
		return petDAO.registerPet(petProfile); 
	}
	
	@RequestMapping(path = "/update/profile", method=RequestMethod.GET)
	public UserProfile getProfileByUserId(@RequestParam(value="user_id") int id) {
		return userProfileDAO.getProfileByUserId(id);
	}

}
