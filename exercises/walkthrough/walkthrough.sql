# First clue
SELECT * FROM crime_scene_report
WHERE type = 'murder'
AND city = 'SQL City';

# Write a query that identifies the first witness.
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC LIMIT 1;

# Write a query that identifies the second witness.
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE 'Annabel %';

# Write a query that shows the interview transcripts for our two subjects
SELECT name, transcript
FROM person p
JOIN interview i
ON p.id = i.person_id
WHERE p.id = '14887'
OR p.id = '16371';

# Find the murderer!
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




SELECT transcript FROM interview
WHERE person_id = '67318';



SELECT hair_color as hair, car_model as car, name
FROM drivers_license dl
JOIN person p
ON dl.id = p.license_id
WHERE car_model = 'Model S'
AND gender = 'female'
AND hair = 'red';


SELECT name, COUNT(name) AS attended
FROM person p
JOIN facebook_event_checkin f
ON p.id = f.person_id
WHERE name = 'Red Korb'
OR name = 'Regina George'
OR name = 'Miranda Priestly'
AND event_id = '1143'
AND date LIKE '201712%'
GROUP BY name
HAVING attended > 2;