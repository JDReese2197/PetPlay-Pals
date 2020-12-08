package com.techelevator.application.jdbcdao;

import java.util.ArrayList;
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
		String query = "INSERT INTO user_profile "
					+ "(profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
	@Override
	public List<UserProfile> listOfAllProfiles() {
		List<UserProfile> profiles = new ArrayList<>();
		String query = "SELECT * FROM user_profile";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		
		while(rowSet.next()) {
			UserProfile profile = mapRowToUserProfile(rowSet);
			profiles.add(profile);
		}
		return profiles;
	}
	
	@Override
	public UserProfile getProfileByEmail(String email) {
		String query = "SELECT * FROM user_profile WHERE email IN ('?')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query, email);
		if(rowSet.next()) {
			return mapRowToUserProfile(rowSet);
		}
		return null;
	}
	
	@Override
	public UserProfile getProfileByUserId(int id) {
		String query = "SELECT * FROM user_profile WHERE user_id = ?";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query, id);
		return mapRowToUserProfile(rowSet);
	}
	
// Private methods used within this class
	private int getNextProfileId() {
		String query = "SELECT nextval('seq_profile_id')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		if (rowSet.next()) {
			return rowSet.getInt(1);
		}
		
		return 1;
	}
	
	private UserProfile mapRowToUserProfile(SqlRowSet rs) {
		UserProfile profile = new UserProfile();
		
		profile.setAddress1(rs.getString("address_1"));
		profile.setAddress2(rs.getString("address_2"));
		profile.setCity(rs.getString("city"));
		profile.setEmail(rs.getString("email"));
		profile.setFirstName(rs.getString("first_name"));
		profile.setLastName(rs.getString("last_name"));
		profile.setPhone(rs.getString("phone_number"));
		profile.setProfileId(rs.getInt("profile_id"));
		profile.setState(rs.getString("state"));
		profile.setUserId(rs.getInt("user_id"));
		profile.setZip(rs.getString("zip_code"));
		
		return profile;
	}
}
