--CLIENT TYPE

SELECT
	COUNT(DISTINCT client_type) as client_type
	from dim_client dc 
	
SELECT COUNT(client_type), client_type 
FROM dim_client
GROUP BY client_type

/*
 * Client Type verification of inconsistencies
 * expected 2 / found 8

**/
-----------------------------------------------------------------------------------
--CLIENT ID

SELECT COUNT(*) as  total, COUNT(DISTINCT client_id) as disntincts
FROM dim_client dc 

SELECT client_id, COUNT(*) AS vezes
FROM dim_client
GROUP BY client_id
HAVING COUNT(*) > 1;

/*
 * Client ID verification
 * ok
 */

-----------------------------------------------------------------------------------
--Client Name

SELECT client_name
FROM dim_client dc 

SELECT client_id, dc.client_name, LENGTH(dc.client_name ) as length, LENGTH(TRIM(client_name)) as clean_length
FROM dim_client dc 
WHERE length <> clean_length 

/*
 * extra spaces in 7 rows
*/

-----------------------------------------------------------------------------------
--Document
SELECT *
FROM dim_client dc 
WHERE document is null OR TRIM(document) = ''

SELECT dc.client_name, dc.document,  count(*)
FROM dim_client dc 
WHERE document is not null AND TRIM(document) <> ''
GROUP BY dc.document 
HAVING COUNT(*) > 1

/*
 * 2 empty rows
 * same document in 2 clients
*/

-----------------------------------------------------------------------------------
--COUNTRY
SELECT dc.country, COUNT(*)
FROM dim_client dc
GROUP BY country 


SELECT dc.country 
FROM dim_client dc
WHERE country is NULL AND 
country is null AND TRIM(country) = ''
/*
 *OK
*/

-----------------------------------------------------------------------------------
--STATE
SELECT dc.state , COUNT(*)
FROM dim_client dc 
GROUP BY dc.state 

SELECT state, COUNT(*)
FROM dim_client dc 
WHERE dc.state IS NULL OR
TRIM(state)  = ''

-----------------------------------------------------------------------------------
--EMAIL
SELECT dc.email
FROM dim_client dc
WHERE dc.email NOT LIKE '%@%' 
OR dc.email IS NULL
OR TRIM(dc.email ) = ""


-----------------------------------------------------------------------------------
--RISK PROFILE
SELECT dc.risk_profile , COUNT(*)
FROM dim_client dc 
GROUP BY dc.risk_profile 

SELECT dc.risk_profile , COUNT(*)
FROM dim_client dc 
WHERE dc.risk_profile IS NULL OR
TRIM(dc.risk_profile ) = ''
GROUP BY dc.risk_profile

-----------------------------------------------------------------------------------
--ONBOARDING DATE
SELECT  COUNT(*)
FROM dim_client dc 
WHERE DATE(dc.onboarding_date )  NULL 

-----------------------------------------------------------------------------------
--STATUS
SELECT dc.status, count(*)
FROM dim_client dc 
GROUP  BY dc.status 