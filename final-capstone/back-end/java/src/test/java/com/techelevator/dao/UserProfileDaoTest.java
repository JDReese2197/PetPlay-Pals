package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.techelevator.application.jdbcdao.JDBCUserProfileDAO;
import com.techelevator.application.model.UserProfile;

public class UserProfileDaoTest extends DAOIntegrationTest{

	JDBCUserProfileDAO userProfileDao;
	
	UserProfile testUser = new UserProfile();
	
	@Before
	public void setup() {
        DataSource dataSource = this.getDataSource();
        userProfileDao = new JDBCUserProfileDAO(dataSource);
        
        //	Setup a test user with dummy data to control data used for testing
        setupTestUser();
	}
	
	@Test
	public void createUserProfile() {
		userProfileDao.createUserProfile(testUser);
		
		List<UserProfile> results = new ArrayList<>();
		results = userProfileDao.listOfAllProfiles();
		
		for(UserProfile profile : results) {
			if(profile.getEmail().toLowerCase().equals(testUser.getEmail().toLowerCase())) {
				Assert.assertTrue(true);
				return;
			}
		}
		Assert.assertTrue("testUser was not found in list of current profiles", false);
	}
	
	@Test
	public void updateUserProfile() {
		userProfileDao.createUserProfile(testUser);
		
		testUser.setAddress1("19990 New Address");
		testUser.setFirstName("John");
		testUser.setLastName("Doe");
		testUser.setEmail("thisismynewemail@email.com");
		
		userProfileDao.updateUserProfile(testUser);
		
		List<UserProfile> results = new ArrayList<>();
		results = userProfileDao.listOfAllProfiles();
		
		for(UserProfile profile : results) {
			if(profile.getEmail().toLowerCase().equals(testUser.getEmail().toLowerCase())
				&& profile.getFirstName().toLowerCase().equals(testUser.getFirstName().toLowerCase())
				&& profile.getLastName().toLowerCase().equals(testUser.getLastName().toLowerCase())
				&& profile.getAddress1().toLowerCase().equals(testUser.getAddress1().toLowerCase())) {
				
				Assert.assertTrue(true);
				return;
			}
		}
		
		Assert.assertTrue("UserProfile info was not updated", false);
	}
	
	@Test
	public void listAll() {
		userProfileDao.createUserProfile(testUser);
		
		List<UserProfile> results = new ArrayList<>();
		results = userProfileDao.listOfAllProfiles();
		
		System.out.println(results);
		
		Assert.assertTrue("Result list is null", results != null);
		Assert.assertTrue("Results list is empty", !results.isEmpty());
	}
	
	//	Method which populates the testUser object with dummy data
	private void setupTestUser() {
		testUser.setAddress1("65432 Easter Ave");
		testUser.setAddress2("APT dumbo");
		testUser.setCity("TestCity");
		testUser.setEmail("UserEmail@Test.net");
		testUser.setFirstName("Fake");
		testUser.setLastName("User");
		testUser.setPhone("4408675309");
		testUser.setState("TestState");
		testUser.setUserId(1);
		testUser.setZip("44130");
	}
}
