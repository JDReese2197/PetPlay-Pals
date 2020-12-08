package com.techelevator.dao;

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
		UserProfile result = userProfileDao.getProfileByEmail(testUser.getEmail());
		Assert.assertEquals("User Profile was not inserted", testUser.getEmail(), result.getEmail());
	}
	
	@Test
	public void updateUserProfile() {
		userProfileDao.createUserProfile(testUser);
		
		testUser.setAddress1("19990 New Address");
		testUser.setFirstName("John");
		testUser.setLastName("Doe");
		
		userProfileDao.updateUserProfile(testUser);
		UserProfile result = userProfileDao.getProfileByEmail(testUser.getEmail());
		
		Assert.assertEquals("Profile did not properly update", testUser, result);
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
