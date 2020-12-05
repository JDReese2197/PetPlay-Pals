package com.techelevator.application.dao;

import java.util.List;

import com.techelevator.application.model.Pet;

public interface PetDAO {
	
	public List<Pet> getAllPets();
	
	public List<Pet> getPetsByPersonality();
	
	public List<Pet> getPetsByType();
	
	public List<Pet> getPetsByUsername();
	
	public void registerPet(Pet newPet);
	
	public void updatePet(Pet petToUpdate);
	
	public void deletePet(Pet petToDelete);

}
