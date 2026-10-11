--CURRENCY CODE

SELECT dc.currency_code
FROM dim_currency dc
WHERE currency_code IS NULL
OR TRIM(currency_code ) = ''

SELECT dc.currency_code 
FROM dim_currency dc
WHERE currency_code NOT IN ('USD', 'BRL', 'EUR')

-- 

-----------------------------------------------------------------------------------
--CURRENCY NAME

SELECT dc.currency_name
FROM dim_currency dc
WHERE currency_name IS NULL
OR TRIM(currency_name ) = ''

SELECT dc.currency_name, COUNT(*)
FROM dim_currency dc
GROUP BY currency_name 

SELECT *
FROM dim_currency dc 
WHERE currency_name IS NULL
OR TRIM(currency_name ) = ''
-- missing currency name = EURO

-----------------------------------------------------------------------------------
--SYMBOL

SELECT *
FROM dim_currency dc
WHERE dc.symbol IS NULL
OR TRIM(dc.symbol) = ''




