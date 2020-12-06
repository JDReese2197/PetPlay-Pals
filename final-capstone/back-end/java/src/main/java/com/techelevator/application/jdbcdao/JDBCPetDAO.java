package com.techelevator.application.jdbcdao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.PetDAO;
import com.techelevator.application.model.Pet;

@Component 
public class JDBCPetDAO implements PetDAO {

	private JdbcTemplate jdbcTemplate;
	
	public JDBCPetDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Pet> getAllPets() {
		List<Pet> allPets = new ArrayList<>(); 
		String sqlAllPets = "SELECT pet_type, pet_name, age, personality_type FROM pet_profile";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sqlAllPets);
		while(rowSet.next()) {
			Pet petResults = mapRowToPet(rowSet);
			allPets.add(petResults);
		}
		return allPets;
	}
	
	@Override
	public List<Pet> getPetsByPersonality(String personalitySearch) {
		List<Pet> petsByPersonality = new ArrayList<>();
		String sqlPetsByPersonality = "SELECT pet_type, pet_name, age, personality_type FROM pet_profile WHERE personality_type=?";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sqlPetsByPersonality, personalitySearch);
		while(rowSet.next()) {
			Pet petResults = mapRowToPet(rowSet);
			petsByPersonality.add(petResults);
		}
		
		return petsByPersonality;
	}
	
	@Override
	public List<Pet> getPetsByType(String petTypeSearch) {
		List<Pet> petsByType = new ArrayList<>();
		String sqlPetsByType = "SELECT * FROM pet_profile WHERE pet_type=?";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sqlPetsByType, petTypeSearch);
		while(rowSet.next()) {
			Pet petResults = mapRowToPet(rowSet);
			petsByType.add(petResults);
		}
		return petsByType;
	}
	
	@Override
	public List<Pet> getPetsByUsername(String userNameSearch) {
		List<Pet> petsByUsername = new ArrayList<>();
		String sqlPetsByUsername = "SELECT * FROM pet_profile p"
				+ "JOIN user_profile up ON up.profile_id = p.profile_id"
				+ "JOIN users u ON u.user_id = up.user_id"
				+ "WHERE u.username = ?";
		
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sqlPetsByUsername, userNameSearch);
		while(rowSet.next()) {
			Pet petResults = mapRowToPet(rowSet);
			petsByUsername.add(petResults);
		}
		return petsByUsername;
	}
	
	@Override 
	public void registerPet(Pet newPet) { // profile_id - SELECT user_id FROM users WHERE 
		String sqlCreatePet = "INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, age, personaility_type) VALUES (?,?,?,?,?,?)";
		int nextPetId = getNextPetId();
		jdbcTemplate.update(sqlCreatePet, nextPetId, newPet.getProfileId(), newPet.getPetType(), newPet.getPetName(), newPet.getAge(), newPet.getPersonalityType());
		// add in method to get current user profile id
		newPet.setPetId(nextPetId);   
	} 
	
	@Override
	public void updatePet(Pet petToUpdate) {
		String sqlUpdatePet = "UPDATE pet_profile SET pet_id = ?, profile_id = ?, pet_type = ?, pet_name = ?, age = ?, personality_type = ?";
		jdbcTemplate.update(sqlUpdatePet, petToUpdate);
	}
	
	@Override
	public void deletePet(Pet petToDelete) {
		String sqlDeletePet = "DELETE FROM pet_profile WHERE profile_id = ? AND pet_id = ?";
		jdbcTemplate.update(sqlDeletePet, petToDelete); // Is update correct here?
	}
	
	private int getNextPetId() {
		String query = "SELECT nextval('seq_pet_id')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		if(rowSet.next()) {
			return rowSet.getInt(1);
		}
		return 0;
	}
	
	private Pet mapRowToPet(SqlRowSet rowSet) {
		Pet pet = new Pet();
		pet.setPetId(rowSet.getInt("pet_id"));
		pet.setProfileId(rowSet.getInt("profile_id"));
		pet.setPetType(rowSet.getString("pet_type"));
		pet.setPetName(rowSet.getString("pet_name"));
		pet.setAge(rowSet.getInt("age"));
		pet.setPersonalityType(rowSet.getString("personality_type"));
		return pet;
	}
}
