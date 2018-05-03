DB = stocks.sqlite

$(DB): to_sqlite.R matchTickerLocationCompanyNames.R Fortune500Locations.csv statePopulations.csv
	Rscript $< $@
	Rscript matchTickerLocationCompanyNames.R $@

Fortune500Locations.csv: SQLFortune500/companyLocations.R
	Rscript $<

statePopulations.csv: SQLFortune500/statePopulations.R
	Rscript $<

%.pdf: %.tex
	pdflatex $<
