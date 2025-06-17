
-- list all the participations with the conference year
SELECT p.name, p.gender, pp.country, pp.institute, pp.occupation, pp.subject, pp.fk_event 
FROM person p 
	LEFT JOIN participation pp on pp.fk_person = p.pk_person 
	ORDER BY pp.fk_event, p.name;
	ORDER BY p.name, pp.fk_event;