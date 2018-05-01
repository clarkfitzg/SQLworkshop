#!/usr/bin/env Rscript

library(RSQLite)

full = dbConnect(SQLite(), "2018_04_30_stocks_full.sqlite")

demo = dbConnect(SQLite(), "stocks_demo.sqlite")

# We'll live dangerously with string formats so we can parameterize the
# table name.
template = 'SELECT *
    FROM %s
    WHERE ticker = "%s"
    LIMIT %i
    ;'

write_demo = function(table = "daily", ticker = "AAPL", n = 3)
{
    q = sprintf(template, table, ticker, n)
    tmp = dbGetQuery(full, q)
    dbWriteTable(demo, table, tmp)
}

tables = c("daily", "dividend_yield", "sandp_company_name", "sector")
stocks = c("AAPL", "AMZN")

for(t in tables){
    for(s in stocks){
        write_demo(t, s)
    }
}

# A few more to illustrate
write_demo("sandp_company_name", "GE")


