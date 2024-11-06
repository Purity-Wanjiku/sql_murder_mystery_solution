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

