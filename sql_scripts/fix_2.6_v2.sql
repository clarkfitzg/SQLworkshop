SELECT
	state
	, sic_code
	, COUNT(*) AS cnt
	, description
FROM (
	SELECT l.ticker, l.state, r.sic_code
	FROM company_locations AS l
	INNER JOIN company_info as r
	ON l.ticker = r.ticker
	) AS A
LEFT JOIN
	sic AS B
ON A.sic_code = B.SIC
GROUP BY sic_code
HAVING state = "Arkansas"