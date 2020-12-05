package com.techelevator.application.dao;

import java.util.List;

import com.techelevator.application.model.Pet;

public interface PetDAO {
	
	public List<Pet> getAllPets();
	
	public List<Pet> getPetsByPersonality(String personalitySearch);
	
	public List<Pet> getPetsByType(String petTypeSearch);
	
	public List<Pet> getPetsByUsername(String userNameSearch);
	
	public void registerPet(Pet newPet);
	
	public void updatePet(Pet petToUpdate);
	
	public void deletePet(Pet petToDelete);

}
