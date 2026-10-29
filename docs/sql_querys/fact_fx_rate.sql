--FX ID
SELECT *
FROM fact_fx_rate

SELECT fx_id, COUNT(*)
FROM fact_fx_rate
GROUP BY fx_id
HAVING COUNT(*) > 1

SELECT fx_id
FROM fact_fx_rate
WHERE fx_id IS NULL OR TRIM(fx_id) = ''


SELECT fx_id
FROM fact_fx_rate
WHERE fx_id  GLOB '*[^0-9]*' 

-----------------------------------------------------------------------------------
--CURRENCY CODE

SELECT currency_code 
FROM fact_fx_rate
WHERE currency_code IS NULL OR TRIM(currency_code ) = ''
-- NO NULL

SELECT currency_code 
FROM fact_fx_rate
GROUP BY currency_code 

SELECT fc.currency_code, dm.currency_code 
FROM fact_fx_rate fc
LEFT JOIN dim_currency dm 
ON fc.currency_code = dm.currency_code 
WHERE dm.currency_code IS NULL


-----------------------------------------------------------------------------------
--RATE DATE

SELECT rate_date, count(*)
FROM fact_fx_rate

WHERE rate_date IS NULL OR TRIM(rate_date )= ''

SELECT rate_date
FROM fact_fx_rate
WHERE DATE(rate_date ) IS NULL

SELECT COUNT(*) as out_of_pattern,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM fact_fx_rate), 1) as pct
FROM fact_fx_rate
WHERE DATE(rate_date ) IS NULL

-----------------------------------------------------------------------------------
--RATE TO USD

SELECT rate_to_usd
FROM fact_fx_rate ffr 


SELECT ffr.rate_to_usd
FROM fact_fx_rate ffr
WHERE ffr.rate_to_usd  IS NULL OR TRIM(ffr.rate_to_usd ) = ''
--

SELECT ffr.rate_to_usd
FROM fact_fx_rate ffr
WHERE ffr.rate_to_usd <= 0

SELECT ffr.rate_to_usd
FROM fact_fx_rate ffr
WHERE TRIM(ffr.rate_to_usd ) <> ''
AND CAST(rate_to_usd AS REAL) <= 0

SELECT rate_date, currency_code, COUNT(*)
FROM fact_fx_rate
GROUP BY rate_date, currency_code
HAVING COUNT(*) > 1


SELECT ffr.rate_to_usd
FROM fact_fx_rate ffr
WHERE rate_to_usd  GLOB '*[^0-9.-]*' 



