package com.techelevator.application.dao;

import com.techelevator.application.model.Playdate;

public interface PlaydateDAO {

	Playdate createPosterPlaydate(Playdate posterPlaydate);

	Playdate createBookerPlaydate(Playdate bookerPlaydate);

}
