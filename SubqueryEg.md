Compute the  states and their 2010 populations which
are greater than the average state population estimate,
but don't include the
Contiguous United States, The fifty states, Fifty states + D.C., or
"Total U.S. (including D.C. and territories)"


SELECT AVG(popnEstimate2017) FROM state_populations;


SELECT AVG(popnEstimate2017) FROM state_populations WHERE
   NOT state IN ('Contiguous United States', 'The fifty states', 'Fifty states + D.C.', 'Total U.S. (including D.C. and territories)');


Alternatively, we can eliminate the 4 rows by filtering out any rows which
have a population value greater than 100 million:

SELECT AVG(popnEstimate2017) FROM state_populations WHERE popn2010 < 1e8;


Now that we have the average, we need to use this in a query to find
the states with a popn2010 value above this:
```
SELECT * FROM state_populations 
WHERE popn2010 > (
                  SELECT AVG(popnEstimate2017)
                  FROM  state_populations
                  WHERE  popn2010 < 1e8);
```
Again, we need to filter out these 4 rows for the aggregated data.
We do this by adding a WHERE clause to our top-leve/outer query:
```
SELECT * FROM state_populations 
WHERE popn2010 > (
                  SELECT AVG(popnEstimate2017)
                  FROM  state_populations
                  WHERE  popn2010 < 1e8)
WHERE popn2010 < 1e8
```

