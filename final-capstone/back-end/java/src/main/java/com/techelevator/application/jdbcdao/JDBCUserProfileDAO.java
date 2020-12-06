package com.techelevator.application.jdbcdao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.UserProfileDAO;
import com.techelevator.application.model.UserProfile;

@Component 
public class JDBCUserProfileDAO implements UserProfileDAO {

	private JdbcTemplate jdbcTemplate;
	public JDBCUserProfileDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//Create user profile
	@Override
	public UserProfile createUserProfile(UserProfile newUserProfile) {
		String query = "INSERT INTO user_profile VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int nextProfileId = getNextProfileId();
		jdbcTemplate.update(query, nextProfileId, newUserProfile.getUserId(), newUserProfile.getFirstName(), newUserProfile.getLastName(),
							newUserProfile.getAddress1(), newUserProfile.getAddress2(), newUserProfile.getCity(),newUserProfile.getZip(),
							newUserProfile.getState(), newUserProfile.getEmail(), newUserProfile.getPhone());
		newUserProfile.setProfileId(nextProfileId);
		return newUserProfile;
	}
	
	//Retrieve user profile -- get user profile by name
//	@Override
//	public UserProfile getUserProfileByUsername(String username) {
//		
//	}
		
	//Update user profile
	@Override
	public void updateUserProfile(UserProfile updatedUserProfile) {
		String query = "UPDATE user_profile SET first_name = ?, last_name = ?, address_1 = ?, address_2 = ?, city = ?,"
				+ " zip_code = ?, state = ?, email = ?, phone_number = ? WHERE profile_id = ?";
		jdbcTemplate.update(query, updatedUserProfile.getFirstName(), updatedUserProfile.getLastName(),
				updatedUserProfile.getAddress1(), updatedUserProfile.getAddress2(), updatedUserProfile.getCity(),updatedUserProfile.getZip(),
				updatedUserProfile.getState(), updatedUserProfile.getEmail(), updatedUserProfile.getPhone(), updatedUserProfile.getProfileId());
	}
		
//	//Delete user profile
//	@Override
//	public void deleteUserProfile(UserProfile aUserProfile) {
//		
//	}
//		
//	//Get list of users
//	@Override
//	public List<UserProfile> listOfAllProfiles() {
//		
//	}
	
// Private methods used within this class
	private int getNextProfileId() {
		String query = "SELECT nextval('seq_profile_id')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		if (rowSet.next()) {
			return rowSet.getInt(1);
		}
		
		return 0;
	}
}
