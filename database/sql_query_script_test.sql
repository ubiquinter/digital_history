SELECT DISTINCT fk_person,  fk_event, count(*) as number
FROM
	Participation p 
group by fk_person
ORDER BY number DESC 




SELECT birth_date ,count(*) as number
FROM
	Person p 
group by birth_date 
ORDER BY number DESC


SELECT *
FROM Person p
where birth_date = "";
--UPDATE Person SET birth_date=NULL 
where birth_date = "";

