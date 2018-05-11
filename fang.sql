-- Small tables for understanding joins

CREATE TABLE fang_info AS
SELECT ticker, company_name, sic_code, net_income
FROM company_info
WHERE ticker IN ("FB", "AMZN", "NFLX", "GOOGL")
;

CREATE TABLE fang_prices AS
SELECT ticker, date, high, low, close, open
FROM daily_share_prices
WHERE ticker IN ("FB", "AMZN", "NFLX", "GOOGL", "AAPL")
   AND date IN ("2018-02-05", "2018-02-06", "2018-02-07")
;

CREATE TABLE fang_locations AS
SELECT ticker, city, state, zip 
FROM company_locations
WHERE ticker IN (SELECT ticker FROM fang_info)
;

CREATE TABLE fang_sic AS
SELECT *
FROM sic
WHERE SIC IN (SELECT sic_code FROM fang_info)
      OR SIC IN (5182, 3292)
;
