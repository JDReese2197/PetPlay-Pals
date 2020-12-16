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
DROP TABLE IF EXISTS user_profile cascade;
DROP TABLE IF EXISTS pet_info cascade;
DROP TABLE IF EXISTS pet_profile cascade;
DROP TABLE IF EXISTS playdate_posting cascade;
DROP TABLE IF EXISTS playdate cascade;

DROP SEQUENCE IF EXISTS seq_profile_id;
DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_pet_id;
DROP SEQUENCE IF EXISTS playdate_id;
DROP SEQUENCE IF EXISTS seq_playdate_id;

CREATE SEQUENCE seq_user_id
  START WITH 10
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_profile_id
  START WITH 10
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_pet_id
  START WITH 10
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
 CREATE SEQUENCE seq_playdate_id
   START WITH 10
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

CREATE TABLE user_profile (
	profile_id int DEFAULT nextval('seq_profile_id'::regclass) NOT NULL,
	user_id int NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address_1 varchar(50) NOT NULL,
	address_2 varchar(50),
	city varchar(50) NOT NULL,
	zip_code varchar(10) NOT NULL,
	state varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone_number varchar(50),
	CONSTRAINT PK_user_profile PRIMARY KEY (profile_id),
	CONSTRAINT FK_user_profile FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE pet_profile (
	pet_id int DEFAULT nextval('seq_pet_id'::regclass) NOT NULL,
	profile_id int NOT NULL,
	pet_type  varchar(50) NOT NULL,
	pet_name varchar(50) NOT NULL,
	breed varchar(50),
	size varchar(50) NOT NULL,
	gender varchar(10) NOT NULL,
	description varchar(250) NOT NULL,
	age int NOT NULL,
	personality_type varchar(250) NOT NULL,
	image_url varchar(250),
	CONSTRAINT PK_pet_profile PRIMARY KEY (pet_id),
	CONSTRAINT FK_pet_profile FOREIGN KEY (profile_id) REFERENCES user_profile(profile_id)
);

CREATE TABLE playdate (
        playdate_id int DEFAULT nextval('seq_pet_id'::regclass) NOT NULL,
        pet_poster int NOT NULL,
        pet_booker int,
        the_date DATE NOT NULL,
        start_time TIME NOT NULL,
        end_time TIME NOT NULL,
        the_location varchar(500) NOT NULL,
        details VARCHAR(500),
        latitude FLOAT NOT NULL,
        longitude FLOAT NOT NULL,
        user_chat VARCHAR(500),
        CONSTRAINT PK_playdate_posting PRIMARY KEY (playdate_id),
	CONSTRAINT FK_playdate_posting_poster FOREIGN KEY (pet_poster) REFERENCES pet_profile(pet_id),
	CONSTRAINT FK_playdate_posting_booker FOREIGN KEY (pet_booker) REFERENCES pet_profile(pet_id)
);


INSERT INTO users (user_id, username,password_hash,role) VALUES (1, 'user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username,password_hash,role) VALUES (2, 'admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username,password_hash,role) VALUES (3, 'brian','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username,password_hash,role) VALUES (4, 'ashley','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username,password_hash,role) VALUES (5, 'mel','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username,password_hash,role) VALUES (6, 'james','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');

INSERT INTO user_profile VALUES (1, 1, 'Kelly', 'Brucker', '123 Address St', '', 'Cleveland', '12345', 'Ohio', 'kelly@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (2, 2, 'Frank', 'Fella', '123 Address St', '', 'Cleveland', '67890', 'Ohio', 'frank@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (3, 3, 'brian', 'k', '123 brian St', '', 'Philadelphia', '12345', 'Pennsylvania', 'brian@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (4, 4, 'ashley', 'd', '123 ashley St', '', 'Cleveland', '12345', 'Ohio', 'ashley@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (5, 5, 'mel', 'f', '123 mel St', '', 'Cleveland', '12345', 'Ohio', 'mel@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (6, 6, 'james', 'reese', '123 james St', '', 'Strongsville', '12345', 'Ohio', 'james@email.com', '123-456-7890');

INSERT INTO pet_profile VALUES (1, 1, 'Dog', 'Rudy', 'Bulldog', 'Medium', 'Male', 'Loves the water', 2, 'loving', 'https://imgur.com/loDyfuW.jpg');
INSERT INTO pet_profile VALUES (2, 2, 'Dog', 'Buddy', 'Beagle', 'Medium', 'Male', 'Lazy but loving dog', 3, 'loving', 'https://imgur.com/diIqn2R.jpg');
INSERT INTO pet_profile VALUES (3, 3, 'Dog', 'Finn', 'Mutt', 'Medium', 'Male', 'Loves playing with big dogs', 4, 'loving', 'https://imgur.com/zNdTVQM.jpg');
INSERT INTO pet_profile VALUES (4, 4, 'Dog', 'Oslo', 'Greyhound', 'Large', 'Male', 'Lazy but loving dog', 3, 'loving', 'https://imgur.com/Sto0DWi.jpg');
INSERT INTO pet_profile VALUES (5, 5, 'Dog', 'Precious', 'Beagle', 'Small', 'Female', 'Shy and nice with all dogs', 3, 'loving', 'https://imgur.com/uP2FREV.jpg');
INSERT INTO pet_profile VALUES (6, 6, 'Dog', 'Holly', 'Pitbull', 'Medium', 'Female', 'Lover of all creatures', 3, 'loving', 'https://imgur.com/FRBUT0s.jpg');

INSERT INTO playdate VALUES (1, 4, NULL, '2020-12-18', '07:00:00', '09:00:00', 'Fairview Park, Cuyahoga County, OH', 'Looking for friendly dog to play with for 2 hours', 41.4414366, -81.8643039, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (3, 5, NULL, '2020-12-18', '08:00:00', '10:00:00', 'Madison Park, Lakewood, OH', 'Looking for friendly dog to play with for 2 hours', 41.4750027, -81.7807527, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (2, 2, 1, '2020-12-15', '11:00:00', '12:00:00', 'Lakewood Park, Lakewood, OH', 'Have an hour to play with another dog', 41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (4, 6, NULL, '2020-12-20', '06:00:00', '07:00:00', 'Fairview Park, Lakewood, OH', 'Early morning playdate! :)', 41.4414366, -81.8643039, 'Update this with a message you want to send to your matched playmate.');

COMMIT TRANSACTION;


