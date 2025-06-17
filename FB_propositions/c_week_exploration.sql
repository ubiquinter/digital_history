
-- list all the participations with the conference year
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.date BETWEEN 1986 AND 1998
ORDER BY e.date DESC, p.name;
ORDER BY p.name, e.date;



-- List persons per conference
SELECT DISTINCT p.pk_person, p.name, e.date conference
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.date BETWEEN 1986 AND 1998
ORDER BY conference;


-- Count the participants per workshop
WITH tw1 AS 
(
SELECT DISTINCT p.pk_person, e.date conference
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.date BETWEEN 1986 AND 1998
)
SELECT conference, COUNT(*) AS num
FROM tw1
GROUP BY conference
ORDER BY conference;



SELECT *
FROM Person p;
	

WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.date BETWEEN 1986 AND 1998
)
SELECT "date", gender, description, COUNT(*) AS number 
FROM tw1
GROUP BY gender, description, date
ORDER BY "date";

WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.date BETWEEN 1986 AND 1998
)
SELECT pk_person, name, gender, COUNT(*) AS number, GROUP_CONCAT(DISTINCT description) AS roles
FROM tw1
GROUP BY pk_person, name, gender
ORDER BY number DESC;
