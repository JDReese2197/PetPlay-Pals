package com.techelevator.application.dao;

import java.util.List;

import com.techelevator.application.model.Playdate;

public interface PlaydateDAO {

	Playdate createPosterPlaydate(Playdate posterPlaydate);

	void joinPlaydate(Playdate bookerPlaydate);

	void declinePlaydate(Playdate bookerPlaydate);

	List<Playdate> displayAcceptedInvite(int petId);

	List<Playdate> displayPostings();
	
	

}
