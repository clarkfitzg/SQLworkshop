-- What's the average difference between the opening price and the closing
-- price from the previous market session for each company?

SELECT *, (
	SELECT close
	FROM fang_prices AS I
	WHERE I.date < P.date
	ORDER BY I.date DESC
	LIMIT 1
) AS prev_close
FROM fang_prices AS P
ORDER BY ticker, date
