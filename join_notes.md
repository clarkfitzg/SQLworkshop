Joining tables together is at the heart of SQL and databases. It allows us
to make connections between different tables and ask richer questions.
Powerful databases will happily join 10+ different tables together
in a single query.

`JOIN` with no conditions returns the cartesian product of the tables. The
cartesian product means that the database pairs up each row in the first
table with every other row in the second table. `fang_info` and `fang_sic`
both have 4 rows each, so the resulting JOIN will have 4 * 4 = 16 rows. 

```{sql]
SELECT *
FROM fang_info
JOIN fang_sic
;
```

This form of join isn't that useful, because Netflix doesn't have any connection to
Asbestos Products. So we need to add a condition that only returns the
rows that match in some way. In this case we need the SIC code in both
tables to match, so we add `fang_info.sic_code = fang_sic.SIC`:

```{sql]
SELECT *
FROM fang_info
JOIN fang_sic
ON fang_info.sic_code = fang_sic.SIC
;
```

This leaves us with only two rows, because Facebook and Google have SIC
codes ending with a zero, and these SIC codes do not appear in the other
table. One way to think about how this works is to take the full cartesian
product and remove all of those rows that do not satisfy the `ON`
condition.

Sometimes we want to include all rows from one table, even if they have no
corresponding
matches. A `LEFT JOIN`
includes at least one of each row from the first table, and possibly more
if the second table includes multiple matches.

```{sql]
SELECT *
FROM fang_info
LEFT JOIN fang_sic
ON fang_info.sic_code = fang_sic.SIC
;
```

The database inserts NULLs where it can't find matches.
