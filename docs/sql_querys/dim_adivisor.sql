--ADVISOR ID

SELECT advisor_id 
FROM dim_advisor
WHERE advisor_id IS NULL
OR TRIM(advisor_id ) = ''


-----------------------------------------------------------------------------------
--ADVISOR NAME

SELECT advisor_name 
FROM dim_advisor
WHERE advisor_name IS NULL
OR TRIM(advisor_name ) = ''


SELECT advisor_name, COUNT(*)
FROM dim_advisor
GROUP BY advisor_name 
HAVING COUNT(*) > 1

SELECT *
FROM dim_advisor da 
WHERE advisor_name = 'Mary Almeida'

SELECT da.advisor_name
FROM dim_advisor da 
WHERE advisor_name = UPPER(da.advisor_name )
OR advisor_name = LOWER(da.advisor_name )

-----------------------------------------------------------------------------------
--BRANCH

SELECT branch 
FROM dim_advisor
WHERE branch NOT IN ('Sao Paulo', 'New York', 'Lisbon', 'London')

SELECT branch 
FROM dim_advisor
WHERE branch IS NULL
OR TRIM(branch) = ''

SELECT branch, COUNT(*) FROM dim_advisor GROUP BY branch	


-----------------------------------------------------------------------------------
--HIRE DATE

SELECT COUNT (*) as rows_affected,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dim_advisor),1 ) as pct
FROM dim_advisor
WHERE DATE (hire_date ) IS NULL


-----------------------------------------------------------------------------------
--STATUS

SELECT status, COUNT(*)
FROM dim_advisor da
GROUP BY da.status 

SELECT status
FROM dim_advisor da
WHERE da.status IS NULL 
OR TRIM(da.status ) = ''