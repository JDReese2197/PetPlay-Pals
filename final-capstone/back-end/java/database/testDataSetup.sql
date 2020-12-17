START TRANSACTION;

INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (7, 'bose' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (8, 'jake' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (9, 'gabbo' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (10, 'john' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (11, 'bri' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (12, 'doug' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (13, 'amanda' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (14, 'jess' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');

SELECT * FROM users;

ROLLBACK;
COMMIT;

START TRANSACTION;

INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (7, 7, 'Jake', 'Bosak', '15919 Pearl Rd', 'Small store behind Starbucks', 'Strongsville', '44136', 'Ohio', 'j.bose@bose.com', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (8, 8, 'Jake', 'McCaffrey', '15919 Pearl Rd', 'Wherever Bose is', 'Lakewood', '44107', 'Ohio', 'jake2@gmail.com', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (9, 9, 'Gabby', 'Fellows', '86753 E Broadway St', '', 'Cleveland', '44143', 'Ohio', 'gerdiesgirl@gabbo.com', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (10, 10, 'John', 'Mullen', '14700 Snow Rd', '', 'Cleveland', '44036', 'Ohio', 'skaterman@pros.net', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (11, 11, 'Bri', 'Williams', '1234 Street St', '', 'Cleveland', '44133', 'Ohio', 'bri.williams@boss.com', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (12, 12, 'Doug', 'Kautzman', '9999 Doug Palace Place', '', 'Lakewood', '44107', 'Ohio', 'spacebbq@dougsdomain.doug', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (13, 13, 'Amanda', 'Wolf', '5437 Medina Way', '', 'Medina', '44256', 'Ohio', 'amanda$wolf@medinacountryclub.net', '123-456-7890');
INSERT INTO user_profile (profile_id, user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (14, 14, 'Jess', 'Gibson', '1234 Street St', '', 'Cleveland', '44136', 'Ohio', 'catmom@email.something', '123-456-7890');

SELECT * FROM user_profile;

ROLLBACK;
COMMIT;

START TRANSACTION;

INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (7,7,'Cat','Loki','Tabi','Small','Male','A playful kitten with a knack for getting into trouble', 1, 'Energetic, Playful', 'https://i.imgur.com/CeDgNpo.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (8,7,'Cat','Toki','Tabi','Medium','Male','A calm old man who likes to sleep in the sun', 8, 'Calm, Laidback', 'https://i.imgur.com/z6TF7wb.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (9,8,'Reptile','Mordecai','Corn Snake','Small','Male','Noodle shape, long body, noodle', 3, 'Shy, Timid', 'https://i.imgur.com/nMjg1tI.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (10,9,'Cat','Gerdie','Shorthair','Small','Female','Dainty, sweet, old lady', 8, 'Friendly, Sweet', 'https://i.imgur.com/h8D6l4g.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (11,9,'Cat','Simon','Shorthair','Small','Male','Asshole, loves trash', 2, 'Curious, Adventurous', 'https://i.imgur.com/CaP27tL.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (12,9,'Cat','Linus','Longhair','Small','Male','Dopey, lovey, silly', 1, 'Curious, Adventurous', 'https://i.imgur.com/CaP27tL.jpg');
        