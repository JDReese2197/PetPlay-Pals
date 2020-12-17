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
        VALUES (12,9,'Cat','Linus','Longhair','Small','Male','Dopey, lovey, silly', 1, 'Loving, Affectionate', 'https://i.imgur.com/7auvokY.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (13,10,'Cat','Penny','Norwegian Forest Cat','Medium','Female','Big gray cat', 8, 'Friendly, Sweet', 'https://i.imgur.com/3mpEkG1.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (14,11,'Cat','Bell','Domestic Shorthaired Cat','Medium','Male','Gray with white paws and underbelly', 4, 'Confident, Strong-Willed', 'https://i.imgur.com/KmFxbYL.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (15,12,'Dog','Padme','Victorian Bulldog','Large','Female','She is a chunky love potato', 6, 'Loving, Affectionate', 'https://i.imgur.com/nBfzCM7.png');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (16,13,'Dog','Prim','Morkie','Small','Female','Tiny dog who loves food and cuddles', 9, 'Friendly, Sweet', 'https://i.imgur.com/QeEQsgY.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (17,14,'Cat','Scooter','Domestic Shorthair','Medium','Male','Still acts like a playful kitten', 8, 'Energetic, Playful', 'https://i.imgur.com/qKpdIXF.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (18,14,'Cat','Princess','Domestic Shorthair','Medium','Female','Loving feral cats', 6, 'Loving, Affectionate', 'https://i.imgur.com/OsCSQCT.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (19,5,'Cat','Cake','Snowshoe','Small','Female','She is dumb, she smells, but also, she screams', 4, 'Shy, Timid', 'https://i.imgur.com/DJRO2NB.jpg');
INSERT INTO pet_profile (pet_id, profile_id, pet_type, pet_name, breed, size, gender, description, age, personality_type, image_url)
        VALUES (20,6,'Reptile','Echo','Bearded Dragon','Medium','Male','Medium sized beardy with a strong appetite for anything that moves. Loves sitting out in the sun', 2, 'Calm, Laidback', 'https://i.imgur.com/N1gSUsZ.png');

SELECT * FROM pet_profile;

ROLLBACK;
COMMIT;

START TRANSACTION;

INSERT INTO playdate (playdate_id, pet_poster, pet_booker, the_date, start_time, end_time, the_location, details, latitude, longitude, user_chat)
        VALUES (5, 19, NULL, '2020-12-20', '10:00:00', '12:00:00', 'Lakewood Park, Lakewood, OH', 'Looking for another cat to do a fun cat Christmas photoshoot!:)', 
        41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');
INSERT INTO playdate (playdate_id, pet_poster, pet_booker, the_date, start_time, end_time, the_location, details, latitude, longitude, user_chat)
        VALUES (6, 11, NULL, '2020-12-22', '11:00:00', '12:00:00', 'Madison Park, Lakewood, OH', 'NE1 wanna go to park n eat trash wit me?', 
        41.4750027, -81.7807527, 'Update this with a message you want to send to your matched playmate.');   
INSERT INTO playdate (playdate_id, pet_poster, pet_booker, the_date, start_time, end_time, the_location, details, latitude, longitude, user_chat)
        VALUES (7, 15, NULL, '2020-12-19', '06:00:00', '08:00:00', 'Lakewood Park, Lakewood, OH', 'Looking for another chonky pupper to go on a morning walk!', 
        41.4948088, -81.7971556, 'Update this with a message you want to send to your matched playmate.');

ROLLBACK;
COMMIT;