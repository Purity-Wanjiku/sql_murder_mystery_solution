-- PART ONE
-- 1. Read the report for the specific crime scene
SELECT * FROM crime_scene_report where type = 'murder' and date = '20180115' and city = 'SQL City';

-- 2. Get the testimonies for the witnesses on interview
select * from interview;

-- 3. Get the person_id of the witnesses first
-- - First  witness
select * from person where name like '%Annabel%' and address_street_name = 'Franklin Ave';

-- - Second witness
select * from person where address_street_name = 'Northwestern Dr' order by address_number desc limit 1;

-- 4. Get their witness from extracted person_id
-- - First witness confession - Annabel Miller with id 16371
select * from interview where person_id = 16371;

-- - Second  witness confession - Morty Schapiro with id 14887
select * from interview where person_id = 14887;

-- 5. Decrypt the murder suspect from witness confession from witness 1 - Annabel Miller
select * from interview where person_id = 16371;
-- Get all columns in get_fit_now_check_in table
select * from get_fit_now_check_in;

-- Get all columns in get_fit_now_check_in table that match the date January the 9th
select * from get_fit_now_check_in where check_in_date = '20180109';

-- 6. Decrypt the murder suspect from witness confession from witness 2 - Morty Schapiro
select * from interview where person_id = 14887;
-- Get all columns from get_fit_now_check_in table with membership_id starting with "48Z" that match the clue of the first witness
select * from get_fit_now_check_in where check_in_date = '20180109' and membership_id like '%48Z%';

-- 7. Follow first clue by the extracted membership id and gold membership status
-- Get all columns from get_fit_now_member table
select * from get_fit_now_member limit 5;
-- Get all columns with membership_status gold that match the id from membership_id 48Z7A
select * from get_fit_now_member where membership_status = 'gold' and id = '48Z7A';
-- Get all columns with membership_status gold that match the id from membership_id 48Z55
select * from get_fit_now_member where membership_status = 'gold' and id = '48Z55';

-- 8. Follow the second clue by a car with a plate that included "H42W"
-- We need the person’s name, but wejust have the number plate now, so, we get all column from drivers_license table
select * from drivers_license limit 5;
-- Get all columns with plate that included ‘H42W’
select * from drivers_license where plate_number like '%H42W%';

-- 9. With third clue, we now have 3 suspected killers with the car plate matching ‘H42W’ and two with gold membership and membership id matching "48Z"
-- The person table relates to the drivers_license table by license_id.  The id in drivers_license is a foreign key of license_id from person table.
-- Now that we have the names and id from  get_fit_now_member table, we can use it to relate to the car plate of our 3 suspected killers from drivers_licence table.
-- Whoever’s name will match the clue from drivers_license table will be our killer.

-- The id from drivers_license that matches the license_id on person table from the clues on the table is our killer.
select * from person where license_id = 423327;
select * from person where license_id = 664760;
select * from person where license_id = 183779;


-- Solution: Jeremy Bowers
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;

