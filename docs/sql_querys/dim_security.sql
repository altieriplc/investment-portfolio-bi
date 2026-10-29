--SECURITY ID

SELECT *
FROM dim_security

SELECT security_id, COUNT(*) 
FROM dim_security
GROUP BY security_id
HAVING COUNT(*) > 1

SELECT security_id
FROM dim_security
WHERE security_id IS NULL
OR TRIM(security_id ) = ''


-----------------------------------------------------------------------------------
--TICKER

SELECT ticker 
FROM dim_security
WHERE ticker IS NULL
OR TRIM(ticker ) = ''

SELECT ticker, count(*)
FROM dim_security
GROUP BY ticker
HAVING COUNT(*) > 1

SELECT ticker, security_id  
FROM dim_security
WHERE ticker ='AAPL'

-----------------------------------------------------------------------------------
--SECURITY NAME

SELECT security_name 
FROM dim_security
WHERE security_name  IS NULL
OR TRIM(security_name ) = ''

-----------------------------------------------------------------------------------
--ASSET CLASS

SELECT asset_class 
FROM dim_security
WHERE asset_class NOT IN ('Equity', 'Fixed Income', 'ETF', 'Fund', 'Cash')


SELECT asset_class 
FROM dim_security
WHERE asset_class IS NULL
OR TRIM(asset_class )


SELECT asset_class, COUNT(*) 
FROM dim_security
GROUP BY asset_class 

-----------------------------------------------------------------------------------
--SECTOR

SELECT ds.sector, ds.security_id  , ds.ticker 
FROM dim_security ds 
WHERE ds.sector IS NULL
OR TRIM(ds.sector ) = ''

SELECT sector, COUNT(*) 
FROM dim_security
GROUP BY sector

-----------------------------------------------------------------------------------
--CURRENCY

SELECT currency
FROM dim_security
WHERE currency IS NULL
OR TRIM(currency ) = ''


SELECT currency, COUNT(*)
FROM dim_security
GROUP BY currency 

-----------------------------------------------------------------------------------
--COUNTRY

SELECT country
FROM dim_security
WHERE country IS NULL
OR TRIM(country ) = ''

SELECT country, COUNT(*)
FROM dim_security
GROUP BY country 

-----------------------------------------------------------------------------------
--ISIN

SELECT isin
FROM dim_security
WHERE isin IS NULL 
OR TRIM(isin) = ''

SELECT isin
FROM dim_security
WHERE TRIM(isin) <> '' AND
LENGTH(isin) <> 12


SELECT isin
FROM dim_security
WHERE TRIM(isin) <> '' AND
isin NOT GLOB '[A-Z][A-Z]*'
-- isin NOT GLOB '[A-Z][A-Z][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][0-9]'
