-- Collection information
--Each row with 
-- •	Name (from person)
-- •	Birth date (from person)
-- •	Gender (from person)
-- •	Event name (from Event) (pk_event from 1 to 30)
-- •	Event date(from Event)
-- •	Description of role at conference

SELECT 
	p.name, 
	p.birth_date,
	p.gender, 
	p.nationality, 
	e.title, 
	e.date,
	p2.description 
FROM
	Person p 
JOIN
	Participation p2 
ON
	p.pk_person = p2.fk_person 
JOIN 
	Event e 
on
	e.pk_event = p2.fk_event 
