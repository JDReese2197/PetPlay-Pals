package com.techelevator.application.jdbcdao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.application.dao.UserDAO;

@Component 
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	

}
