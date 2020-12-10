package com.techelevator.application.jdbcdao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.PlaydateDAO;
import com.techelevator.application.model.Playdate;
import com.techelevator.application.model.UserProfile;

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
				+ "(playdate_id, pet_poster, the_date, start_time, end_time, the_location, details) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		int playdateId = getNextPlaydateId();
		jdbcTemplate.update(query, playdateId, posterPlaydate.getPetPosterId(), posterPlaydate.getTheDate(), posterPlaydate.getStartTime(), posterPlaydate.getEndTime(), posterPlaydate.getLocation(), posterPlaydate.getDetails());
		posterPlaydate.setPlaydateId(playdateId);
		
		return posterPlaydate;
	}
	
	//Method to update (PUT) playdate with a matched pet (ie. Booker has selected a playdate)
	@Override
	public Playdate createBookerPlaydate(Playdate bookerPlaydate) {
		String query = "UPDATE playdate "
				+ "SET pet_booker = ? "
				+ "WHERE playdate_id = ?";
		jdbcTemplate.update(query, bookerPlaydate.getPetBookerId(), bookerPlaydate.getPlaydateId());
		
		return bookerPlaydate;
	}
	
	// Method to display (GET) listings by Poster's id
	@Override
	public UserProfile getPostingBy(int id) {
		String query = "SELECT * FROM user_profile WHERE user_id = ?";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query, id);
		if(rowSet.next()) {
			return mapRowToUserProfile(rowSet);
		} else {
			return null;
		}
	}
	
	//Methods we need:
	// 
	
	
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
		
		return profile;
	}
	
	
}
