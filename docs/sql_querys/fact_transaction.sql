-- TRANSACTION ID

SELECT transaction_id 
FROM fact_transaction
WHERE transaction_id IS NULL OR TRIM(transaction_id ) = ''
-- no null

SELECT transaction_id
FROM fact_transaction
GROUP BY transaction_id 
HAVING COUNT(*) > 1

-----------------------------------------------------------------------------------
--ACCOUNT ID

SELECT account_id 
FROM fact_transaction
WHERE account_id IS NULL OR TRIM(account_id ) = ''

SELECT ft.account_id, COUNT(*)
FROM fact_transaction ft
LEFT JOIN dim_account da
ON ft.account_id = da.account_id 
WHERE da.account_id IS NULL
GROUP BY ft.account_id 
-- account ID exists in fact but not in dimension; ID exists in fact but not in the account registry

SELECT ft.account_id , ft.transaction_id 
FROM fact_transaction ft
LEFT JOIN dim_account da
ON ft.account_id = da.account_id 
WHERE da.account_id IS NULL

-----------------------------------------------------------------------------------
--SECURITY ID

SELECT COUNT(*) AS qtd,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM fact_transaction), 1) AS pct
FROM fact_transaction
WHERE security_id IS NULL OR TRIM(security_id ) = ''


SELECT ft.security_id, ft.transaction_id 
FROM fact_transaction ft
LEFT JOIN dim_security ds 
ON ft.security_id = ds.security_id
WHERE ds.security_id IS NULL AND TRIM(ft.security_id) <> ''
-- trim is necessary because the field accepts NULL

-----------------------------------------------------------------------------------
--TRANSACTION DATE

SELECT transaction_date 
FROM fact_transaction
WHERE transaction_date IS NULL OR TRIM(transaction_date )= ''


SELECT transaction_date 
FROM fact_transaction
WHERE DATE(transaction_date ) IS NULL

SELECT COUNT(*) AS qtt,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM fact_transaction), 1)
FROM fact_transaction
WHERE DATE(transaction_date ) IS NULL

-----------------------------------------------------------------------------------
--TRANSACTION TYPE

SELECT transaction_type 
FROM fact_transaction
WHERE transaction_type IS NULL OR TRIM(transaction_type )=''


SELECT transaction_type, COUNT(*)
FROM fact_transaction
GROUP BY transaction_type 
--


-----------------------------------------------------------------------------------
--QUANTITY


SELECT quantity 
FROM fact_transaction
WHERE CAST(quantity AS REAL) < 0 AND TRIM(quantity ) <>''


-----------------------------------------------------------------------------------
--PRICE

SELECT ft.price
FROM fact_transaction ft 
WHERE CAST(price AS REAL) < 0 AND TRIM(price) <>''

SELECT ft.price
FROM fact_transaction ft 
WHERE TRIM(price) <>'' AND price GLOB '*[^0-9.-]*'


-----------------------------------------------------------------------------------
--GROSS AMOUNT

SELECT ft.gross_amount 
FROM fact_transaction ft 
WHERE TRIM(gross_amount) <>'' AND gross_amount GLOB '*[^0-9.-]*'

-----------------------------------------------------------------------------------
--FEE

SELECT ft.fee 
FROM fact_transaction ft 
WHERE CASt(fee AS REAL) < 0
--verify the field for number

SELECT ft.fee
FROM fact_transaction ft
WHERE TRIM(fee) <> '' AND fee GLOB '*[^0-9.-]*';
--verify the field for empty and text

-----------------------------------------------------------------------------------
--NET AMOUNT

SELECT net_amount
FROM fact_transaction
WHERE net_amount GLOB '*[^0-9.-]*'
