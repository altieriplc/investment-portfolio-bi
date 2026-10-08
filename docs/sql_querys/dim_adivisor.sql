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