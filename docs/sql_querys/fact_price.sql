--PRICE ID

SELECT price_id 
FROM fact_price
WHERE price_id IS NULL OR TRIM(price_id )=''

SELECT price_id
FROM fact_price
GROUP BY price_id 
HAVING COUNT(*) > 1 

-----------------------------------------------------------------------------------
--SECURITY ID


SELECT security_id 
FROM fact_price
WHERE security_id IS NULL OR TRIM(security_id )=''

SELECT fp.security_id 
FROM fact_price fp
LEFT JOIN dim_security ds 
ON fp.security_id = ds.security_id 
WHERE ds.security_id IS NULL

-----------------------------------------------------------------------------------
--PRICE DATE


SELECT price_date  
FROM fact_price
WHERE DATE (price_date ) IS NULL

-----------------------------------------------------------------------------------
--CLOSE PRICE


SELECT close_price  
FROM fact_price
WHERE CAST(close_price AS REAL) <= 0

SELECT close_price  
FROM fact_price
WHERE TRIM(close_price) <>'' AND close_price GLOB '*[^0-9.-]*'
