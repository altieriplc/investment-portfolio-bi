-- ============================================================
-- investments.db  |  schema RAW (staging) - preserva sujeira
-- Star schema: 5 dimensoes + 4 fatos
-- Colunas com datas e numericos sujos ficam como TEXT de proposito,
-- para exercitar limpeza/CAST em SQL.
-- ============================================================

DROP TABLE IF EXISTS fact_transaction;
DROP TABLE IF EXISTS fact_position;
DROP TABLE IF EXISTS fact_price;
DROP TABLE IF EXISTS fact_fx_rate;
DROP TABLE IF EXISTS dim_account;
DROP TABLE IF EXISTS dim_client;
DROP TABLE IF EXISTS dim_advisor;
DROP TABLE IF EXISTS dim_security;
DROP TABLE IF EXISTS dim_currency;

CREATE TABLE dim_currency (
    currency_code TEXT,
    currency_name TEXT,
    symbol        TEXT
);

CREATE TABLE dim_advisor (
    advisor_id   INTEGER,
    advisor_name TEXT,
    branch       TEXT,
    hire_date    TEXT,
    status       TEXT
);

CREATE TABLE dim_client (
    client_id       INTEGER,
    client_name     TEXT,
    client_type     TEXT,
    document        TEXT,
    country         TEXT,
    state           TEXT,
    email           TEXT,
    risk_profile    TEXT,
    onboarding_date TEXT,
    status          TEXT
);

CREATE TABLE dim_account (
    account_id    INTEGER,
    client_id     INTEGER,
    advisor_id    INTEGER,
    account_type  TEXT,
    base_currency TEXT,
    open_date     TEXT,
    status        TEXT
);

CREATE TABLE dim_security (
    security_id   INTEGER,
    ticker        TEXT,
    security_name TEXT,
    asset_class   TEXT,
    sector        TEXT,
    currency      TEXT,
    country       TEXT,
    isin          TEXT
);

CREATE TABLE fact_fx_rate (
    fx_id         INTEGER,
    currency_code TEXT,
    rate_date     TEXT,
    rate_to_usd   TEXT
);

CREATE TABLE fact_price (
    price_id    INTEGER,
    security_id INTEGER,
    price_date  TEXT,
    close_price TEXT
);

CREATE TABLE fact_transaction (
    transaction_id   INTEGER,
    account_id       INTEGER,
    security_id      TEXT,
    transaction_date TEXT,
    transaction_type TEXT,
    quantity         TEXT,
    price            TEXT,
    gross_amount     TEXT,
    fee              TEXT,
    net_amount       TEXT
);

CREATE TABLE fact_position (
    position_id   INTEGER,
    account_id    INTEGER,
    security_id   INTEGER,
    position_date TEXT,
    quantity      TEXT,
    market_price  TEXT,
    market_value  TEXT
);
