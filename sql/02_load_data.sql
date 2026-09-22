-- ============================================================
-- Carga dos CSVs no SQLite (rode no CLI: sqlite3 investments.db < 02_load_data.sql)
-- ============================================================
.mode csv
.import --skip 1 data/dim_currency.csv     dim_currency
.import --skip 1 data/dim_advisor.csv      dim_advisor
.import --skip 1 data/dim_client.csv       dim_client
.import --skip 1 data/dim_account.csv      dim_account
.import --skip 1 data/dim_security.csv     dim_security
.import --skip 1 data/fact_fx_rate.csv     fact_fx_rate
.import --skip 1 data/fact_price.csv       fact_price
.import --skip 1 data/fact_transaction.csv fact_transaction
.import --skip 1 data/fact_position.csv    fact_position
