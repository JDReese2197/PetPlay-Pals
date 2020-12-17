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
  START WITH 100
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_profile_id
  START WITH 100
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE SEQUENCE seq_pet_id
  START WITH 100
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
 CREATE SEQUENCE seq_playdate_id
   START WITH 100
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


INSERT INTO users (user_id, username, password_hash, role) VALUES (1, 'user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (2, 'admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username, password_hash, role) VALUES (3, 'brian','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (4, 'ashley','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (5, 'mel','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (6, 'james','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (7, 'bose' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (8, 'jake' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (9, 'gabbo' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (10, 'john' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (11, 'bri' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (12, 'doug' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (13, 'amanda' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) VALUES (14, 'jess' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');

INSERT INTO user_profile VALUES (1, 1, 'Kelly', 'Brucker', '123 Address St', '', 'Cleveland', '12345', 'Ohio', 'kelly@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (2, 2, 'Frank', 'Fella', '123 Address St', '', 'Cleveland', '67890', 'Ohio', 'frank@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (3, 3, 'Brian', 'K', '123 Brian St', '', 'Philadelphia', '12345', 'Pennsylvania', 'brian@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (4, 4, 'Ashley', 'D', '123 Ashley St', '', 'Cleveland', '12345', 'Ohio', 'ashley@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (5, 5, 'Mel', 'F', '123 Mel St', '', 'Cleveland', '12345', 'Ohio', 'mel@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (6, 6, 'James', 'Reese', '123 James St', '', 'Strongsville', '12345', 'Ohio', 'james@email.com', '123-456-7890');
INSERT INTO user_profile VALUES (7, 7, 'Jake', 'Bosak', '15919 Pearl Rd', 'Small store behind Starbucks', 'Strongsville', '44136', 'Ohio', 'j.bose@bose.com', '123-456-7890');
INSERT INTO user_profile VALUES (8, 8, 'Jake', 'McCaffrey', '15919 Pearl Rd', 'Wherever Bose is', 'Lakewood', '44107', 'Ohio', 'jake2@gmail.com', '123-456-7890');
INSERT INTO user_profile VALUES (9, 9, 'Gabby', 'Fellows', '86753 E Broadway St', '', 'Cleveland', '44143', 'Ohio', 'gerdiesgirl@gabbo.com', '123-456-7890');
INSERT INTO user_profile VALUES (10, 10, 'John', 'Mullen', '14700 Snow Rd', '', 'Cleveland', '44036', 'Ohio', 'skaterman@pros.net', '123-456-7890');
INSERT INTO user_profile VALUES (11, 11, 'Bri', 'Williams', '1234 Street St', '', 'Cleveland', '44133', 'Ohio', 'bri.williams@boss.com', '123-456-7890');
INSERT INTO user_profile VALUES (12, 12, 'Doug', 'Kautzman', '9999 Doug Palace Place', '', 'Lakewood', '44107', 'Ohio', 'spacebbq@dougsdomain.doug', '123-456-7890');
INSERT INTO user_profile VALUES (13, 13, 'Amanda', 'Wolf', '5437 Medina Way', '', 'Medina', '44256', 'Ohio', 'amanda$wolf@medinacountryclub.net', '123-456-7890');
INSERT INTO user_profile VALUES (14, 14, 'Jess', 'Gibson', '1234 Street St', '', 'Cleveland', '44136', 'Ohio', 'catmom@email.something', '123-456-7890');

INSERT INTO pet_profile VALUES (1, 1, 'Dog', 'Rudy', 'Boxer', 'Medium', 'Male', 'Loves the snow', 2, 'loving', 'https://imgur.com/loDyfuW.jpg');
INSERT INTO pet_profile VALUES (2, 2, 'Dog', 'Buddy', 'Beagle', 'Medium', 'Male', 'Lazy but loving dog', 3, 'loving', 'https://imgur.com/diIqn2R.jpg');
INSERT INTO pet_profile VALUES (3, 3, 'Dog', 'Finn', 'Mutt', 'Medium', 'Male', 'Loves playing with big dogs', 4, 'loving', 'https://imgur.com/zNdTVQM.jpg');
INSERT INTO pet_profile VALUES (4, 4, 'Dog', 'Oslo', 'Greyhound', 'Large', 'Male', 'Lazy but loving dog', 3, 'loving', 'https://imgur.com/Sto0DWi.jpg');
INSERT INTO pet_profile VALUES (5, 5, 'Dog', 'Precious', 'Beagle', 'Small', 'Female', 'Shy and nice with all dogs', 3, 'loving', 'https://imgur.com/uP2FREV.jpg');
INSERT INTO pet_profile VALUES (6, 6, 'Dog', 'Holly', 'Pitbull', 'Medium', 'Female', 'Lover of all creatures', 3, 'loving', 'https://imgur.com/FRBUT0s.jpg');
INSERT INTO pet_profile VALUES (7, 7, 'Cat','Loki','Tabi','Small','Male','A playful kitten with a knack for getting into trouble', 1, 'Energetic, Playful', 'https://i.imgur.com/CeDgNpo.jpg');
INSERT INTO pet_profile VALUES (8, 7, 'Cat','Toki','Tabi','Medium','Male','A calm old man who likes to sleep in the sun', 8, 'Calm, Laidback', 'https://i.imgur.com/z6TF7wb.jpg');
INSERT INTO pet_profile VALUES (9, 8, 'Reptile','Mordecai','Corn Snake','Small','Male','Noodle shape, long body, noodle', 3, 'Shy, Timid', 'https://i.imgur.com/nMjg1tI.jpg');
INSERT INTO pet_profile VALUES (10, 9, 'Cat','Gerdie','Shorthair','Small','Female','Dainty, sweet, old lady', 8, 'Friendly, Sweet', 'https://i.imgur.com/h8D6l4g.jpg');
INSERT INTO pet_profile VALUES (11, 9 ,'Cat','Simon','Shorthair','Small','Male','Asshole, loves trash', 2, 'Curious, Adventurous', 'https://i.imgur.com/CaP27tL.jpg');
INSERT INTO pet_profile VALUES (12, 9, 'Cat','Linus','Longhair','Small','Male','Dopey, lovey, silly', 1, 'Loving, Affectionate', 'https://i.imgur.com/7auvokY.jpg');
INSERT INTO pet_profile VALUES (13, 10, 'Cat','Penny','Norwegian Forest Cat','Medium','Female','Big gray cat', 8, 'Friendly, Sweet', 'https://i.imgur.com/3mpEkG1.jpg');
INSERT INTO pet_profile VALUES (14, 11, 'Cat','Bell','Domestic Shorthaired Cat','Medium','Male','Gray with white paws and underbelly', 4, 'Confident, Strong-Willed', 'https://i.imgur.com/KmFxbYL.jpg');
INSERT INTO pet_profile VALUES (15, 12, 'Dog','Padme','Victorian Bulldog','Large','Female','She is a chunky love potato', 6, 'Loving, Affectionate', 'https://i.imgur.com/nBfzCM7.png');
INSERT INTO pet_profile VALUES (16, 13, 'Dog','Prim','Morkie','Small','Female','Tiny dog who loves food and cuddles', 9, 'Friendly, Sweet', 'https://i.imgur.com/QeEQsgY.jpg');
INSERT INTO pet_profile VALUES (17, 14, 'Cat','Scooter','Domestic Shorthair','Medium','Male','Still acts like a playful kitten', 8, 'Energetic, Playful', 'https://i.imgur.com/qKpdIXF.jpg');
INSERT INTO pet_profile VALUES (18, 14, 'Cat','Princess','Domestic Shorthair','Medium','Female','Loving feral cats', 6, 'Loving, Affectionate', 'https://i.imgur.com/OsCSQCT.jpg');
INSERT INTO pet_profile VALUES (19, 5, 'Cat','Cake','Snowshoe','Small','Female','She is dumb, she smells, but also, she screams', 4, 'Shy, Timid', 'https://i.imgur.com/DJRO2NB.jpg');
INSERT INTO pet_profile VALUES (20, 6, 'Reptile','Echo','Bearded Dragon','Medium','Male','Medium sized beardy with a strong appetite for anything that moves. Loves sitting out in the sun', 2, 'Calm, Laidback', 'https://i.imgur.com/N1gSUsZ.png');


INSERT INTO playdate VALUES (1, 4, NULL, '2020-12-18', '07:00:00', '09:00:00', 'Fairview Park, Cuyahoga County, OH', 'Looking for friendly dog to play with for 2 hours', 41.4414366, -81.8643039, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (3, 5, NULL, '2020-12-18', '08:00:00', '10:00:00', 'Madison Park, Lakewood, OH', 'Looking for friendly dog to play with for 2 hours', 41.4750027, -81.7807527, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (2, 2, 1, '2020-12-15', '11:00:00', '12:00:00', 'Lakewood Park, Lakewood, OH', 'Have an hour to play with another dog', 41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (4, 6, NULL, '2020-12-20', '06:00:00', '07:00:00', 'Fairview Park, Lakewood, OH', 'Early morning playdate! :)', 41.4414366, -81.8643039, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (5, 19, NULL, '2020-12-20', '10:00:00', '12:00:00', 'Lakewood Park, Lakewood, OH', 'Looking for another cat to do a fun cat Christmas photoshoot!:)', 41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (6, 11, NULL, '2020-12-22', '11:00:00', '12:00:00', 'Madison Park, Lakewood, OH', 'NE1 wanna go to park n eat trash wit me?', 41.4750027, -81.7807527, 'Update this with a message you want to send to your matched playmate.');   
INSERT INTO playdate VALUES (7, 15, NULL, '2020-12-19', '06:00:00', '08:00:00', 'Lakewood Park, Lakewood, OH', 'Looking for another chonky pupper to go on a morning walk!', 41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (8, 16, 1, '2020-12-19', '07:00:00', '09:00:00', 'Springfield Lake Park, Akron, OH', 'Seeking a pampered pup for a morning walk.', 41.03461710000001, -81.4457415, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate VALUES (9, 20, 9, '2020-12-19', '07:00:00', '09:00:00', 'Springfield Lake Park, Akron, OH', 'Want another scaly boi to eat some crickets and sun bathe with. No bathing suit required', 41.03461710000001, -81.4457415, 'Update this with a message you want to send to your matched playmate.');
        
COMMIT TRANSACTION;