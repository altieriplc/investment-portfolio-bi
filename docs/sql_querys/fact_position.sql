-- POSITION ID

SELECT position_id 
FROM fact_position
WHERE position_id IS NULL OR TRIM(position_id ) =''

SELECT position_id, COUNT(*)
FROM fact_position
GROUP BY position_id 
HAVING COUNT (*) > 1



-----------------------------------------------------------------------------------
--ACCOUNT ID


SELECT fp.account_id AS fpac
FROM fact_position fp
LEFT JOIN dim_account da
ON fp.account_id = da.account_id 
WHERE da.account_id IS NULL

-----------------------------------------------------------------------------------
--SECURITY ID

SELECT fp.security_id
FROM fact_position fp
WHERE fp.security_id IS NULL OR TRIM(security_id )=''

SELECT fp.security_id
FROM fact_position fp
LEFT JOIN dim_security ds 
ON fp.security_id = ds.security_id
WHERE ds.security_id IS NULL

-----------------------------------------------------------------------------------
--POSITION DATE

SELECT position_date 
FROM fact_position
WHERE DATE(position_date ) IS NULL

-----------------------------------------------------------------------------------
--QUANTITY

SELECT quantity 
FROM fact_position
WHERE TRIM(quantity ) <> '' AND quantity GLOB '*[^0-9.-]*'

SELECT quantity 
FROM fact_position
WHERE CAST (quantity AS REAL) < 0

-----------------------------------------------------------------------------------
--MARKET PRICE

SELECT market_price 
FROM fact_position
WHERE TRIM(market_price ) <> '' AND market_price GLOB '*[^0-9.-]*'

SELECT market_price 
FROM fact_position
WHERE CAST (market_price AS REAL) < 0


-----------------------------------------------------------------------------------
--MARKET VALUE

SELECT market_value 
FROM fact_position
WHERE TRIM(market_value ) <> '' AND market_value GLOB '*[^0-9.-]*'

SELECT market_value 
FROM fact_position
WHERE CAST (market_value AS REAL) < 0



