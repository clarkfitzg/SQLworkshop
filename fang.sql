-- Small tables for understanding joins

CREATE TABLE fang_info AS
SELECT * FROM company_info
WHERE ticker IN ("FB", "AMZN", "NFLX", "GOOGL")
;

CREATE TABLE fang_locations AS
SELECT * FROM company_locations
WHERE ticker IN (SELECT ticker FROM fang_info)
;

CREATE TABLE fang_sic AS
SELECT * FROM sic
WHERE SIC IN (7841, 7370, 5961, 5182, 3292)
;
