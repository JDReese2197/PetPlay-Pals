package com.techelevator.application.jdbcdao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.UserProfileDAO;

@Component 
public class JDBCUserProfileDAO implements UserProfileDAO {

	private JdbcTemplate jdbcTemplate;
	

}
