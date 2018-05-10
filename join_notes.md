
Default join is an inner join. We only see rows that match in both tables.

```{sql]
SELECT *
FROM fang_info
JOIN fang_sic
ON fang_info.sic_code = fang_sic.SIC
;
```


