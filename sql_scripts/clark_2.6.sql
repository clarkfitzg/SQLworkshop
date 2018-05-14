SELECT
	l.state, i.sic_code, s.Description,
	COUNT(*) AS cnt
FROM company_info AS i
LEFT JOIN sic AS s
ON i.sic_code = s.SIC
INNER JOIN company_locations AS l
ON l.ticker = i.ticker
GROUP BY i.sic_code, l.state
ORDER BY l.state ASC, cnt DESC
