package com.techelevator.application.dao;

import java.util.List;

import com.techelevator.application.model.Pet;

public interface PetDAO {
	
	public List<Pet> getAllPets();
	
	public List<Pet> getPetsByPersonality(String personalitySearch);
	
	public List<Pet> getPetsByType(String petTypeSearch);
	
	public List<Pet> getPetsByUsername(String userNameSearch);
	
	public List<Pet> getPetByProfileId(int profileId);
	
	public Pet getAPetByProfileId(int profileId);
	
	public Pet getPetByPetId(int petId);
	
	public Pet registerPet(Pet newPet);
	
	public void updatePet(Pet petToUpdate);
	
	public void deletePet(Pet petToDelete);

}
