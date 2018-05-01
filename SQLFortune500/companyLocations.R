u = "https://www.geolounge.com/fortune-500-list-by-state-for-2015/"

tt = getURLContent(u)
doc = htmlParse(tt)
# or
# doc = htmlParse("~/Fortune 500 List by State for 2015 - GeoLounge_ All Things Geography.html")
t1 = readHTMLTable(doc, which = 1, stringsAsFactors = FALSE)

write.csv(t1, "Fortune500Locations.csv")
