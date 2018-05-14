SELECT
-- Count each (state, sic) combo
-- And merge description
	state, sic_code, COUNT(*) AS cnt,
	description
FROM (
	-- Combine (ticker, state, sic)
	SELECT l.ticker, l.state, r.sic_code
	FROM company_locations AS l
	INNER JOIN company_info as r
	ON l.ticker = r.ticker
	) AS A
LEFT JOIN
	sic AS B
ON A.sic_code = B.sic
GROUP BY state, sic_code
ORDER BY state, description
