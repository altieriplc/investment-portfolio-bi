--ACCOUNT ID
SELECT da.account_id
FROM dim_account da 
GROUP BY account_id 
HAVING COUNT(*) > 1

SELECT da.account_id
FROM dim_account da 
WHERE account_id IS NULL
OR TRIM(account_id ) = ''

-----------------------------------------------------------------------------------
--CLIENT ID
SELECT da.client_id
FROM dim_account da 
WHERE client_id IS NULL
OR TRIM(client_id ) = ''

SELECT da.client_id
FROM dim_account da
WHERE da.client_id NOT IN (SELECT client_id FROM dim_client)

SELECT da.client_id, dc.client_id 
FROM dim_account da 
LEFT JOIN dim_client dc
ON da.client_id = dc.client_id 
WHERE dc.client_id IS NULL

-----------------------------------------------------------------------------------
--ADVISOR ID
SELECT da.advisor_id, 
FROM dim_account da 
WHERE advisor_id IS NULL
OR TRIM(advisor_id ) = ''

SELECT dacc.advisor_id, daa.advisor_id 
FROM dim_account dacc
LEFT JOIN dim_advisor daa
ON daa.advisor_id = dacc.advisor_id 
WHERE daa.advisor_id IS NULL

-----------------------------------------------------------------------------------
--ACOOUNT TYPE
SELECT account_type, COUNT(*)
FROM dim_account da 
GROUP BY account_type


SELECT account_type
FROM dim_account da 
WHERE account_type IS NULL 
OR TRIM (account_type) = ''

SELECT account_type, COUNT(*)
FROM dim_account da 
WHERE account_type NOT IN ('Brokerage','Managed','Retirement')
GROUP BY account_type

-----------------------------------------------------------------------------------
--BASE CURRENCY
SELECT base_currency 
FROM dim_account
WHERE base_currency IS NULL OR TRIM(base_currency ) = ''
/*NO NULL*/

SELECT base_currency , COUNT(*)
FROM dim_account
WHERE base_currency  NOT IN ('USD','BRL','EUR') 
GROUP BY base_currency 

SELECT base_currency , COUNT(*)
FROM dim_account
WHERE base_currency  NOT IN ('USD','BRL','EUR') 

SELECT COUNT(*) AS afected,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dim_account) ,1) as pct
FROM dim_account 
WHERE base_currency NOT IN ('USD','BRL','EUR') 

-----------------------------------------------------------------------------------
--OPEN DATE

SELECT open_date 
FROM dim_account da
WHERE da.open_date IS NULL 
OR TRIM(da.open_date ) = ''
-- 4 linhas

SELECT COUNT(*)
FROM dim_account da 
WHERE DATE(da.open_date ) IS NULL
-- 38 linhas afetadas

SELECT COUNT(*) as rows_affected,
	ROUND(100.0 * COUNT (*) / (SELECT COUNT(*) FROM dim_account) ,1) as pct 
FROM dim_account da 
WHERE DATE(da.open_date) IS NULL

SELECT da.open_date  as rows_affected,
	ROUND(100.0 * COUNT (*) / (SELECT COUNT(*) FROM dim_account) ,1) as pct 
FROM dim_account da 
WHERE DATE(da.open_date) IS NULL

-----------------------------------------------------------------------------------
--STATUS

SELECT status 
FROM dim_account
WHERE status IS NULL 
OR TRIM(status) = ''
-- SEM NULOS

SELECT status, COUNT(*) 
FROM dim_account
GROUP BY status 