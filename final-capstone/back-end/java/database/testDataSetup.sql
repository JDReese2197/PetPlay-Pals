START TRANSACTION;

INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (7, 'bose' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (8, 'jake' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (user_id, username, password_hash, role) 
        VALUES (9, 'gabbo' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) 
        VALUES (10, 'john' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) 
        VALUES (11, 'bri' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) 
        VALUES (12, 'doug' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) 
        VALUES (13, 'amanda' ,'$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'ROLE_USER');
INSERT INTO users (username, password_hash, role) 
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
INSERT INTO user_profile (user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (10, 'John', 'Mullen', '14700 Snow Rd', '', 'Cleveland', '44036', 'Ohio', 'skaterman@pros.net', '123-456-7890');
INSERT INTO user_profile (user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (11, 'Bri', 'Williams', '1234 Street St', '', 'Cleveland', '44133', 'Ohio', 'bri.williams@boss.com', '123-456-7890');
INSERT INTO user_profile (user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (12, 'Doug', 'Kautzman', '9999 Doug Palace Place', '', 'Lakewood', '44107', 'Ohio', 'spacebbq@dougsdomain.doug', '123-456-7890');
INSERT INTO user_profile (user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (13, 'Amanda', 'Wolf', '5437 Medina Way', '', 'Medina', '44256', 'Ohio', 'amanda$wolf@medinacountryclub.net', '123-456-7890');
INSERT INTO user_profile (user_id, first_name, last_name, address_1, address_2, city, zip_code, state, email, phone_number)
        VALUES (14, 'Jess', 'Gibson', '1234 Street St', '', 'Cleveland', '44136', 'Ohio', 'catmom@email.something', '123-456-7890');

SELECT * FROM user_profile;

ROLLBACK;
COMMIT;