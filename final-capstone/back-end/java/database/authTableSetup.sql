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
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_profile_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_pet_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
 CREATE SEQUENCE seq_playdate_id
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
        details varchar(500),
        CONSTRAINT PK_playdate_posting PRIMARY KEY (playdate_id),
	CONSTRAINT FK_playdate_posting_poster FOREIGN KEY (pet_poster) REFERENCES pet_profile(pet_id),
	CONSTRAINT FK_playdate_posting_booker FOREIGN KEY (pet_booker) REFERENCES pet_profile(pet_id)
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO user_profile VALUES (1, 1, 'Brian', 'Kilburn', '123 Address St', '', 'Philadelphia', '12345', 'Pennsylvania', 'brian@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (2, 2, 'Ashley', 'Davis', '123 Address St', '', 'Cleveland', '67890', 'Ohio', 'ashley@email.com', '123-456-7890');

INSERT INTO pet_profile VALUES (1, 1, 'Dog', 'Finn', 'Mutt', 'Small', 'Male', 'Loves the water and playing with big dogs', 4, 'loving', NULL);
INSERT INTO pet_profile VALUES (2, 2, 'Dog', 'Oslo', 'Grey Hound', 'Large', 'Male', 'Lazy but loving dog', 3, 'loving', NULL);

INSERT INTO playdate VALUES (1, 2, NULL, '2020-12-13', '12:00:00', '14:00:00', 'Lakewood Park, Lake Avenue, Lakewood, OH', 'Looking for a male dog to play with my Greyhound');
INSERT INTO playdate VALUES (2, 1, 2, '2020-12-13', '12:00:00', '14:00:00', 'Lakewood Park, Lake Avenue, Lakewood, OH', 'SECOND LINE');

SELECT * FROM playdate WHERE (pet_poster = 1 OR pet_booker = 1) AND pet_booker IS NOT NULL;

COMMIT TRANSACTION;


