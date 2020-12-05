--
-- This SQL will create the tables needed for the Final Capstone 
-- Authentication and logon starter code
-- 
-- It will also create two users with passwords:  username: user 
--                                                password: password
--
--                                                username: admin 
--                                                password: password
--                                               
--
--	Be sure you have created a database called: 'final_capstone'
--
-- To create a database:  1. Open a WINDOWS command prompt (NOT GitBash)
--                        2. Enter the command: createdb -U postgres final_capstone
--                        3. Enter the password: postgres1
--
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS user_info cascade;
DROP TABLE IF EXISTS pet_info cascade;

DROP SEQUENCE IF EXISTS seq_user_info_id;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_pet_id;

DROP TABLE IF EXISTS seq_user_info_id cascade;
DROP TABLE IF EXISTS pk_user_info cascade;
DROP TABLE IF EXISTS seq_user_id cascade;
DROP TABLE IF EXISTS seq_pet_id cascade;
DROP TABLE IF EXISTS pk_pet_id cascade;
DROP TABLE IF EXISTS pk_user cascade;


CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_user_info_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_pet_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE user_info (
	user_info_id int DEFAULT nextval('seq_user_info_id'::regclass) NOT NULL,
	user_id int,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address_1 varchar(50) NOT NULL,
	address_2 varchar(50),
	city varchar(50) NOT NULL,
	state varchar(50) NOT NULL,
	CONSTRAINT PK_user_info PRIMARY KEY (user_info_id),
	CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE pet_info (
	pet_id int DEFAULT nextval('seq_pet_id'::regclass) NOT NULL,
	user_info_id int,
	pet_type  varchar(50) NOT NULL,
	pet_name varchar(50) NOT NULL,
	age int NOT NULL,
	personality_type varchar(50) NOT NULL,
	CONSTRAINT PK_pet_id PRIMARY KEY (pet_id),
	CONSTRAINT FK_user_info_id FOREIGN KEY (user_info_id) REFERENCES user_info(user_info_id)
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');



COMMIT TRANSACTION;


