

-- list all the participations with the conference year
SELECT DISTINCT p.pk_person, p.name, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
ORDER BY e.date, p.name;



-- network of coparticipation in conferences
WITH tw1 AS
(SELECT DISTINCT p.pk_person, p.name, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
ORDER BY p.name
)
SELECT t1.pk_person p1, t1.name name_1, t2.pk_person, t2.name name_2, t1.date
FROM tw1 t1, tw1 t2
WHERE t2.date = t1.date
AND t2.name > t1.name
ORDER BY t1.date, t1.name, t2.name;



WITH tw1 AS
(SELECT DISTINCT p.pk_person, p.name, e.date
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
ORDER BY p.name
), tw2 AS (
SELECT 
CASE 
	WHEN t1.name > t2.name 
	THEN t2.pk_person
	ELSE t1.pk_person
END p1,
CASE 
	WHEN t1.name > t2.name 
	THEN t2.name
	ELSE t1.name
END name1,
CASE 
	WHEN t1.name > t2.name 
	THEN t1.pk_person
	ELSE t2.pk_person
END p2,
CASE 
	WHEN t1.name > t2.name 
	THEN t1.name
	ELSE t2.name
END name2, 
t1.date
FROM tw1 t1, tw1 t2
WHERE t2.date = t1.date
AND t2.name > t1.name)
SELECT p1, name1, p2, name2, COUNT(*) as number, GROUP_CONCAT(date) as conferences
FROM tw2
GROUP BY p1, name1, p2, name2
ORDER BY number DESC, name1, name2;





SELECT p.pk_person, p.name, p.gender, group_concat(pp.description) description, e.date, count(*) as number
FROM Person p 
	LEFT JOIN Participation pp on pp.fk_person = p.pk_person 
	LEFT JOIN Event e on pp.fk_event = e.pk_event 
WHERE e.description = 'Cortona'
--AND e.date BETWEEN 1986 AND 1998
AND p.pk_person IN (19,1,39,50,16)
GROUP BY p.pk_person, p.name, p.gender, e.date
ORDER BY e.date, p.name;
--ORDER BY p.name, e.date;




/*  Workshops
 * 
 */

--workshop persons
SELECT DISTINCT per.pk_person, per.name, per.gender, p.notes, w.name, w.description, e.date, c.categories 
FROM Presentation p, Person per, Workshop w, Event e, Topics t, Categories c 
WHERE per.pk_person = p.fk_person 
AND w.pk_workshop = p.fk_workshop 
AND t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event ;


SELECT DISTINCT per.pk_person, per.name, per.gender, p.notes, w.pk_workshop, w.name, w.description, e.date 
FROM Presentation p, Person per, Workshop w, Event e 
WHERE per.pk_person = p.fk_person 
AND w.pk_workshop = p.fk_workshop 
AND e.pk_event = w.fk_event 
ORDER BY per.name, w.pk_workshop 



WITH tw1 AS
(SELECT DISTINCT per.pk_person, per.name, per.gender, p.notes, w.pk_workshop, w.name, w.description, e.date 
FROM Presentation p, Person per, Workshop w, Event e 
WHERE per.pk_person = p.fk_person 
AND w.pk_workshop = p.fk_workshop 
AND e.pk_event = w.fk_event 
ORDER BY per.name
), tw2 AS (
SELECT 
CASE 
	WHEN t1.name > t2.name 
	THEN t2.pk_person
	ELSE t1.pk_person
END p1,
CASE 
	WHEN t1.name > t2.name 
	THEN t2.name
	ELSE t1.name
END name1,
CASE 
	WHEN t1.name > t2.name 
	THEN t1.pk_person
	ELSE t2.pk_person
END p2,
CASE 
	WHEN t1.name > t2.name 
	THEN t1.name
	ELSE t2.name
END name2, 
t1.date
FROM tw1 t1, tw1 t2
WHERE t2.pk_workshop = t1.pk_workshop
AND t2.name > t1.name)
SELECT p1, name1, p2, name2, COUNT(*) as number, GROUP_CONCAT(date) as conferences
FROM tw2
GROUP BY p1, name1, p2, name2
ORDER BY number DESC, name1, name2;



/*
 * Verbindungen zw. Themen von Workshops über Konferenzen
 * 
 * Verbindungen zw. Themen über Workshops
 * 
 */

-- count workshop categories
SELECT c.categories, COUNT(*) as num 
FROM Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event 
GROUP BY c.categories 
ORDER BY num DESC;



-- count workshop meta-categories
SELECT c.meta_category, mc.meta_category, GROUP_CONCAT(distinct c.categories) AS classes,
COUNT(*) as num 
FROM Workshop w, Event e, Topics t, Categories c, Meta_category mc 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND mc.pk_meta_category = c.meta_category 
AND e.pk_event = w.fk_event 
GROUP BY c.meta_category 
ORDER BY num DESC;



-- count workshop meta-categories per conférence
SELECT e.date, COUNT(*) as num , 
	c.meta_category, mc.meta_category, GROUP_CONCAT(distinct c.categories) AS classes
FROM Workshop w, Event e, Topics t, Categories c, Meta_category mc 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND mc.pk_meta_category = c.meta_category 
AND e.pk_event = w.fk_event 
GROUP BY e.date, c.meta_category 
ORDER BY date, num DESC;



-- count workshop categories by year
SELECT e.date, c.categories, COUNT(*) as num 
FROM Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event 
GROUP BY e.date, c.categories ;



SELECT DISTINCT w.pk_workshop, w.name, w.description, e.date, c.pk_categories, c.categories 
FROM  Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event ;





WITH tw1 AS
(SELECT DISTINCT w.pk_workshop, w.name, w.description, e.date, c.categories, c.pk_categories
FROM  Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event
ORDER BY pk_workshop
)
SELECT t1.categories, t2.categories, t1.date
FROM tw1 t1, tw1 t2
WHERE t2.pk_workshop = t1.pk_workshop
AND t2.pk_categories > t1.pk_categories;





WITH tw1 AS
(SELECT DISTINCT w.pk_workshop, w.name, w.description, e.date, c.categories, c.pk_categories
FROM  Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event
ORDER BY pk_workshop
), tw2 AS (
SELECT t1.categories c1, t2.categories c2, t1.date
FROM tw1 t1, tw1 t2
WHERE t2.pk_workshop = t1.pk_workshop
AND t2.pk_categories > t1.pk_categories
)
SELECT c1, c2, group_concat(date), COUNT(*) AS effectif 
FROM tw2
group by c1, c2
ORDER BY effectif DESC;




WITH tw1 AS
(SELECT DISTINCT w.pk_workshop, w.name, w.description, e.date, c.categories, c.pk_categories
FROM  Workshop w, Event e, Topics t, Categories c 
WHERE t.fk_workshop = w.pk_workshop 
AND t.fk_categories = c.pk_categories 
AND e.pk_event = w.fk_event
ORDER BY c.categories
), tw2 AS (
SELECT  t1.pk_categories, t1.categories c1, 
			 t2.pk_categories, t2.categories c2, t1.date,t1.pk_workshop
FROM tw1 t1, tw1 t2
WHERE t2.pk_workshop = t1.pk_workshop
AND t2.pk_categories > t1.pk_categories)
SELECT *
FROM tw2;


