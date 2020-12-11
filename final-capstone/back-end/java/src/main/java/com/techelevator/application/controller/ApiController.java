/************************************************************************************************
 * Put your Application API Controllers here
 ************************************************************************************************/
package com.techelevator.application.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.application.jdbcdao.JDBCPetDAO;
import com.techelevator.application.jdbcdao.JDBCPlaydateDAO;
import com.techelevator.application.jdbcdao.JDBCUserProfileDAO;
import com.techelevator.application.model.Pet;
import com.techelevator.application.model.Playdate;
import com.techelevator.application.model.UserProfile;

@RestController
@CrossOrigin
public class ApiController {
	
	private JDBCPetDAO petDAO;
	private JDBCUserProfileDAO userProfileDAO;
	private JDBCPlaydateDAO playdateDAO;
	
	public ApiController(JDBCPetDAO petDAO, JDBCUserProfileDAO userProfileDAO, JDBCPlaydateDAO playdateDAO) {
		this.petDAO = petDAO;
		this.userProfileDAO = userProfileDAO;
		this.playdateDAO = playdateDAO;
	}
	
	//POST to create a user profile (registration page)
	@RequestMapping(path = "/register/profile", method=RequestMethod.POST)
	public UserProfile registerProfile(@RequestBody UserProfile userProfile) {
		return userProfileDAO.createUserProfile(userProfile);
	}
	
	// PUT to update any information on a user profile page
	@RequestMapping(path = "/update/profile", method=RequestMethod.PUT)
	public void updateUserProfile(@RequestBody UserProfile userProfile) {
		userProfileDAO.updateUserProfile(userProfile);
	}
	
	// POST to add a pet to pet table, includes user profile id
	@RequestMapping(path = "/register/pet", method=RequestMethod.POST)
	public Pet registerPet(@RequestBody Pet petProfile) {
		return petDAO.registerPet(petProfile); 
	}
	
	// GET a pet from by pet ID
	@RequestMapping(path = "/find-playdate", method=RequestMethod.GET)
	public Pet getPetbyPetId(@RequestParam(value="petId") int petId) {
		return petDAO.getPetByPetId(petId);
	}
	
	// GET all pets by profile ID
	@RequestMapping(path = "/create/playdate", method=RequestMethod.GET)
	public List<Pet> getPetByProfileId(@RequestParam(value="profileId")int profileId) {
		return petDAO.getPetByProfileId(profileId);
	}
	
	// GET Profile by user id (NOT Profile Id) to display on the user profile page
	@RequestMapping(path = "/profile/{id}", method = RequestMethod.GET)
	public UserProfile getProfileByUserId(@PathVariable(value="id") int id) {
		return userProfileDAO.getProfileByUserId(id); 
	}
	
	// POST to create a playdate listing
	@RequestMapping(path = "/create/playdate", method=RequestMethod.POST)
	public Playdate createPosterPlaydate(@RequestBody Playdate posterPlaydate) {
		return playdateDAO.createPosterPlaydate(posterPlaydate);
	}
	
	// PUT for a booker to join a playdate
	@RequestMapping(path = "/playdate/join", method=RequestMethod.PUT)
	public void joinPlaydate(@RequestBody Playdate bookerPlaydate) {
		playdateDAO.joinPlaydate(bookerPlaydate);
	}
	
	// PUT for a poster to decline a playdate
	@RequestMapping(path = "/playdate/decline", method=RequestMethod.PUT)
	public void declinePlaydate(@RequestBody Playdate removeBooker) {
		playdateDAO.declinePlaydate(removeBooker);
	}
	
	// GET the displays for a poster and booker profile
	@RequestMapping(path = "/display/invites{id}", method = RequestMethod.GET)
	public List<Playdate> displayAcceptedInvite(@PathVariable(value="id") int id) {
		return playdateDAO.displayAcceptedInvite(id);
	}
	
	// GET the displays for the listings where booker_id is NULL
	@RequestMapping(path = "/display/postings", method = RequestMethod.GET)
	public List<Playdate> displayPostings() {
		return playdateDAO.displayPostings();
	}
	

}
