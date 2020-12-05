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
		// sql code goes here 
		return allPets;
	}
	
	@Override
	public List<Pet> getPetsByPersonality() {
		List<Pet> petsByPersonality = new ArrayList<>();
		// sql code goes here 
		return petsByPersonality;
	}
	
	@Override
	public List<Pet> getPetsByType() {
		List<Pet> petsByType = new ArrayList<>();
		// sql code goes here 
		return petsByType;
	}
	
	@Override
	public List<Pet> getPetsByUsername() {
		List<Pet> petsByUsername = new ArrayList<>();
		// sql code goes here 
		return petsByUsername;
	}
	
	@Override 
	public void registerPet(Pet newPet) {
		String query = "INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, age, personaility_type) VALUES (?,?,?,?,?,?)";
		int nextPetId = getNextPetId();
		jdbcTemplate.update(query, nextPetId, newPet.getProfileId(), newPet.getPetType(), newPet.getPetName(), newPet.getAge(), newPet.getPersonalityType());
		// add in method to get current user profile id
		newPet.setPetId(nextPetId);   
	} 
	
	@Override
	public void updatePet(Pet petToUpdate) {
		
	}
	
	@Override
	public void deletePet(Pet petToDelete) {
		
	}
	
	private int getNextPetId() {
		String query = "SELECT nextval('seq_pet_id')";
		SqlRowSet rowSet = jdbcTemplate.queryForRowSet(query);
		if(rowSet.next()) {
			return rowSet.getInt(1);
		}
		return 0;
	}
}
