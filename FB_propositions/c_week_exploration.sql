SELECT *
FROM Person p;



-- list all the participations with the conference year
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
ORDER BY e.date, p.name;
--ORDER BY p.name, e.date;




-- group by roles in conference
SELECT p.pk_person, p.name, p.gender, group_concat(pp.description) description, e.date, count(*) as number
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
GROUP BY p.pk_person, p.name, p.gender, e.date
ORDER BY e.date, p.name;
ORDER BY p.name, e.date;



-- Participations of persons 
WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, group_concat(pp.description) description, e.date, count(*) as number
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
GROUP BY p.pk_person, p.name, p.gender, e.date
)
SELECT pk_person, name, gender, group_concat(date || '(' || number || ')'
				|| ' : '|| description) roles, COUNT(*) AS number_conf 
FROM tw1
group by pk_person, name, gender
ORDER by number_conf DESC ;


-- 
WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, group_concat(pp.description) description, e.date, count(*) as number
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
GROUP BY p.pk_person, p.name, p.gender, e.date
), tw2 AS (
SELECT pk_person, name, gender, group_concat(date || '(' || number || ')'
				|| ' : '|| description) roles, COUNT(*) AS number_conf 
FROM tw1
group by pk_person, name, gender
)
SELECT gender, number_conf, count(*) as number
FROM tw2 
group by gender, number_conf
ORDER BY number_conf desc;



-- Count the participants per conference
WITH tw1 AS 
(
SELECT DISTINCT p.pk_person, e.date conference
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
)
SELECT conference, COUNT(*) AS num
FROM tw1
GROUP BY conference
ORDER BY conference;



-- gender, role, conference, number
WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
)
SELECT "date", gender, description, COUNT(*) AS number 
FROM tw1
GROUP BY gender, description, date
ORDER BY "date";



-- gender, role
-- !!! should be coded, less modalities
WITH tw1 AS (
SELECT p.pk_person, p.name, p.gender, pp.description, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
)
SELECT gender, description, COUNT(*) AS number 
FROM tw1
GROUP BY gender, description;





