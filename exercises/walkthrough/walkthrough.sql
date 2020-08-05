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