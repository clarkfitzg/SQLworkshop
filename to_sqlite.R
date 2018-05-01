#!/usr/bin/env Rscript

library(readxl)
library(RSQLite)

xlsx = "SQL_Data_Set_01_April_10_18.xlsx"
names = excel_sheets(xlsx)

args = commandArgs(trailingOnly = TRUE)
DB = args[1]

db = dbConnect(SQLite(), DB)


for (i in 2:4) {
  sheet = read_xlsx(xlsx, i)

  # Standardize the column names.
  names = gsub("\\s", "_", tolower(names(sheet)))
  names = gsub("__", "_", tolower(names(sheet)), fixed = TRUE)
  names = gsub("^_|_$", "", names)

  key = match("key", names)
  if (key)
    names[key] = "ticker"
  names(sheet) = names

  # Remove erroneous columns caused by "source" link
  if (i == 3)
    sheet = sheet[-c(9, 10, 11)]

  message(paste0(names(sheet), sep = ", "))
  dbWriteTable(db, tolower(names[[i]]), sheet)
}

# Mon Apr 30 13:06:49 PDT 2018
# CF: Adding in a couple new sources of data.
daily = read.csv("all_stocks_5yr.csv", stringsAsFactors = FALSE)

# Never mind, SQLite won't handle dates.
#daily$date = strptime(daily$date, "%Y-%m-%d")
dbWriteTable(db, name = "daily", daily)

sic = read.csv("sic-codes.csv")
dbWriteTable(db, name = "sic", sic)

dbDisconnect(db)
