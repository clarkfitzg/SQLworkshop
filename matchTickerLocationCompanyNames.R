
library(RSQLite)

args = commandArgs(trailingOnly = TRUE)
DB = args[1]

con = dbConnect(SQLite(), DB)

pos = dbReadTable(con, "company_locations")
sp = dbReadTable(con, "company_name")

w = tolower(pos$company) %in% tolower(sp$sandp_comp)
mtch = match(tolower(pos$company)[w], tolower(sp$sandp_comp))

z = data.frame(orig = sp$sandp_comp[mtch], loc = pos$company[w], ticker = sp$ticker[mtch], stringsAsFactors = FALSE)
table(tolower(z$orig) == tolower(z$loc))
# 4 that have  lower/upper case differences

# Now put these tickers into Fortune500Locations.csv

tmp = read.csv("Fortune500Locations.csv", stringsAsFactors = FALSE)
i = match(z$loc, tmp$company)
tmp$ticker = ""
tmp$ticker[i] = z$ticker

tmp = tmp[tmp$ticker != "",]

# Drop the old locations table.
dbSendQuery(con, "DROP TABLE company_locations")

# Write the new locations table.
dbWriteTable(con, name = "company_locations", tmp)

dbDisconnect(con)

