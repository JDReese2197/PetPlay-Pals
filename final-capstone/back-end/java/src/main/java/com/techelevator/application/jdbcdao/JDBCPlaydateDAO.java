package com.techelevator.application.jdbcdao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.PlaydateDAO;
import com.techelevator.application.model.Playdate;

@Component
public class JDBCPlaydateDAO implements PlaydateDAO {
	
	private JdbcTemplate jdbcTemplate;
	public JDBCPlaydateDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// Method to create (POST) the initial playdate posting
	@Override
	public Playdate createPosterPlaydate(Playdate posterPlaydate) {
		String query = "INSERT INTO playdate "
				+ "(playdate_id, pet_poster, the_date, start_time, end_time, the_location, details, pet_booker, latitude, longitude) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int nextPlaydateId = getNextPlaydateId();
		jdbcTemplate.update(query, nextPlaydateId, posterPlaydate.getPetPosterId(), posterPlaydate.getTheDate(), posterPlaydate.getStartTime(), 
				posterPlaydate.getEndTime(), posterPlaydate.getLocation(), posterPlaydate.getDetails(), null, posterPlaydate.getLat(), posterPlaydate.getLng());
		
		posterPlaydate.setPlaydateId(nextPlaydateId);
		
		return posterPlaydate;
	}
	
	//Method to update (PUT) playdate with a matched pet (ie. Booker has selected a playdate)
	@Override
	public void joinPlaydate(Playdate bookerPlaydate) {
		String query = "UPDATE playdate "
				+ "SET pet_booker = ?, user_chat = ?"
				+ "WHERE playdate_id = ?";
		jdbcTemplate.update(query, bookerPlaydate.getPetBookerId(), "Update this with a message you want to send to your matched playmate. (500 chars max)",bookerPlaydate.getPlaydateId());
	}
	
	//Method to decline (PUT) playdate with a matched pet by removing pet_booker (id) (ie. Booker has selected a playdate, but Poster can remove it)
	@Override
	public void declinePlaydate(Playdate bookerPlaydate) {
		String query = "UPDATE playdate "
				+ "SET pet_booker = NULL "
				+ "WHERE playdate_id = ?";
		jdbcTemplate.update(query, bookerPlaydate.getPlaydateId());
	}
	
	@Override
	public void updateChat(Playdate playdate) {
		String query = "UPDATE playdate "
				+ "SET user_chat = ? "
				+ "WHERE playdate_id = ?";
		jdbcTemplate.update(query, playdate.getUserMessage(), playdate.getPlaydateId());
	}
	
	@Override
	public void deletePlaydate(int playdateId) {
		String query = "DELETE FROM playdate WHERE playdate_id = ?";
				jdbcTemplate.update(query, playdateId);
	}
	
	//Method to display (GET) a single playdate listing by playdate_id
	@Override
	public Playdate getPlaydateByPlaydateId(int playdateId) {
		String query = "SELECT * FROM playdate WHERE playdate_id = ?";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query, playdateId);
		if(rowSet.next()) {
			return mapRowToPlaydate(rowSet);
		} else {
			return null;	
		}
	}
		
	// Method to display (GET) listings by checking if current pet id is equal to pet_poster or pet_booker so it's displayed on their profile
	@Override
	public List<Playdate> displayAcceptedInvite(int petId) {
		List<Playdate> displayedPlaydates = new ArrayList<>();
		String query = "SELECT * FROM playdate WHERE (pet_poster = ? OR pet_booker = ?) AND pet_booker IS NOT NULL";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query, petId, petId);
		
		while(rowSet.next()) {
			Playdate displayListing = mapRowToPlaydate(rowSet);
			displayedPlaydates.add(displayListing);
		}
		return displayedPlaydates;
	}
	
	// Method to display (GET) listings to display it on the main posting display page when pet_booker is empty
	@Override
	public List<Playdate> displayPostings() {
		List<Playdate> displayedPlaydates = new ArrayList<>();
		String query = "SELECT * FROM playdate WHERE pet_booker IS NULL";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		
		while(rowSet.next()) {
			Playdate displayListing = mapRowToPlaydate(rowSet);
			displayedPlaydates.add(displayListing);
		}
		return displayedPlaydates;
	}
	
	
	private int getNextPlaydateId() {
		String query = "SELECT nextval('seq_playdate_id')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		if (rowSet.next()) {
			return rowSet.getInt(1);
		}
		
		return 1;
	}
	
	private Playdate mapRowToPlaydate(SqlRowSet rs) {
		Playdate profile = new Playdate();
		
		profile.setPlaydateId(rs.getInt("playdate_id"));
		profile.setPetPosterId(rs.getInt("pet_poster"));
		profile.setPetBookerId(rs.getInt("pet_booker"));
		profile.setTheDate(rs.getDate("the_date"));
		profile.setStartTime(rs.getTime("start_time"));
		profile.setEndTime(rs.getTime("end_time"));
		profile.setLocation(rs.getString("the_location"));
		profile.setDetails(rs.getString("details"));
		profile.setLat(rs.getDouble("latitude"));
		profile.setLng(rs.getDouble("longitude"));
		profile.setUserMessage(rs.getString("user_chat"));
		
		return profile;
	}
	
	
}
