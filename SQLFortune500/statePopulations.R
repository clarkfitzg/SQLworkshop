
tt = getURLContent("https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population")
tbl = readHTMLTable(htmlParse(tt), which = 3, stringsAsFactors = FALSE)


tbl[] = lapply(tbl, function(x) gsub("^[0-9]+ !", "", x))
names(tbl) = gsub("\\n", " ", names(tbl))

tbl[[1]] = gsub(" ", " ", tbl[[1]])

tbl[, c(3, 5, 7)] = lapply(tbl[, c(3, 5, 7)], as, "FormattedInteger")

tbl[[9]] = as(tbl[[9]], "Percent")






if(FALSE) {

#a = readHTMLTable("~/List of U.S. states and territories by population - Wikipedia.html",  which = 3, stringsAsFactors = FALSE)
doc = htmlParse(tt)

f = "~/List of U.S. states and territories by population - Wikipedia.html"
doc = htmlParse(f)

tnode = getNodeSet(doc, "//table[3]")[[1]]
h = xpathSApply(tnode[["thead"]], ".//th", xmlValue)

tmp = getNodeSet(tnode, ".//tbody//tr")
vals = lapply(tmp, function(x) sapply(x[names(x) == "td"], xmlValue))

vals = xpathSApply(tnode, ".//tbody//tr", function(x) getNodeSet(x, ".//td", xmlValue))
}
