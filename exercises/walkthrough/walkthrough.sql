-- Main (Who's the SQL Murderer?)

-- -- First clue
SELECT * FROM crime_scene_report
WHERE type = 'murder'
AND city = 'SQL City';

-- -- Write a query that identifies the first witness.
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC LIMIT 1;

-- -- Write a query that identifies the second witness.
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE 'Annabel %';

-- -- Write a query that shows the interview transcripts for our two subjects
SELECT name, transcript
FROM person p
JOIN interview i
ON p.id = i.person_id
WHERE p.id = '14887'
OR p.id = '16371';

-- -- Find the murderer!
SELECT p.name,
p.id,
m.id AS memberId,
membership_status AS status,
check_in_date as checkInDate,
plate_number AS plate
FROM person p
JOIN get_fit_now_member m
ON p.id = m.person_id
JOIN get_fit_now_check_in c
ON m.id = c.membership_id
JOIN drivers_license dl
ON p.license_id = dl.id
WHERE m.id LIKE '48Z%'
AND status = 'gold'
AND plate LIKE '%H42W%'
AND checkInDate LIKE '%0109';

-- Extra (Who's the SQL Mastermind?)

-- -- Getting the murderer's transcript
SELECT name, transcript
FROM person p
JOIN interview i
ON p.id = i.person_id
WHERE p.id = '67318';

-- -- Finding the Brains
SELECT name, height,
hair_color AS hair,
car_make AS carMake,
car_model AS carModel,
event_name AS event,
fb.date AS eventDate
FROM person p
JOIN drivers_license dl
ON p.license_id = dl.id
JOIN facebook_event_checkin fb
ON p.id = fb.person_id
WHERE height BETWEEN 65 AND 67
AND hair = 'red'
AND carMake = 'Tesla'
AND carModel = 'Model S'
AND event = 'SQL Symphony Concert'
AND eventDate LIKE '2017%';

-- -- Verifying she's got a lot of moolah
SELECT name, annual_income
FROM person p
JOIN income i
ON p.ssn = i.ssn
WHERE name = 'Miranda Priestly';